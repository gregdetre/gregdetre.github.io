(function () {
    const EMBED_SRC = 'https://embed.bsky.app/static/embed.js';

    function parseBlueskyPostUrl(url) {
        if (!url) return null;
        const m = url.match(/^https:\/\/bsky\.app\/profile\/([^/]+)\/post\/([^/?#]+)/);
        if (!m) return null;
        return { handle: m[1], rkey: m[2] };
    }

    const didCache = new Map();
    async function resolveDid(handle) {
        if (didCache.has(handle)) return didCache.get(handle);
        const res = await fetch(
            'https://public.api.bsky.app/xrpc/com.atproto.identity.resolveHandle?handle=' +
            encodeURIComponent(handle)
        );
        if (!res.ok) throw new Error('resolveHandle failed: ' + res.status);
        const data = await res.json();
        const did = data && data.did;
        if (!did) throw new Error('No DID for handle: ' + handle);
        didCache.set(handle, did);
        return did;
    }

    async function prepareBlockquotes() {
        const blocks = Array.from(document.querySelectorAll('blockquote.bluesky-embed'));
        if (!blocks.length) return 0;
        let prepared = 0;
        for (const blk of blocks) {
            if (blk.hasAttribute('data-bluesky-uri')) {
                prepared++;
                continue;
            }
            const link = blk.querySelector('a[href^="https://bsky.app/profile/"]');
            const href = link && link.getAttribute('href');
            const parsed = parseBlueskyPostUrl(href);
            if (!parsed) continue;
            try {
                const did = await resolveDid(parsed.handle);
                const aturi = `at://${did}/app.bsky.feed.post/${parsed.rkey}`;
                blk.setAttribute('data-bluesky-uri', aturi);
                blk.setAttribute('data-bluesky-embed-color-mode', 'system');
                prepared++;
            } catch (_) {
                // keep graceful fallback link
            }
        }
        return prepared;
    }

    function ensureEmbedScript() {
        if (document.querySelector(`script[src^="${EMBED_SRC}"]`)) return Promise.resolve();
        return new Promise((resolve) => {
            const s = document.createElement('script');
            s.async = true;
            s.src = EMBED_SRC;
            s.charset = 'utf-8';
            s.onload = resolve;
            document.body.appendChild(s);
        });
    }

    async function init() {
        try {
            const n = await prepareBlockquotes();
            if (n > 0) {
                await ensureEmbedScript();
            }
        } catch (_) {
            // fail silently; links remain
        }
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();


