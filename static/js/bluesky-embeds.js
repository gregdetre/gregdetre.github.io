(function () {
    function parse(href) {
        const m = /^https:\/\/bsky\.app\/profile\/([^/]+)\/post\/([^/?#]+)/.exec(href || '');
        return m ? { handle: m[1], rkey: m[2] } : null;
    }

    async function toAtUri(handle, rkey) {
        const res = await fetch('https://public.api.bsky.app/xrpc/com.atproto.identity.resolveHandle?handle=' + encodeURIComponent(handle));
        const data = await res.json();
        return `at://${data.did}/app.bsky.feed.post/${rkey}`;
    }

    async function run() {
        const blocks = Array.from(document.querySelectorAll('blockquote.bluesky-embed'));
        let needsEmbed = false;
        for (const blk of blocks) {
            if (blk.hasAttribute('data-bluesky-uri')) { needsEmbed = true; continue; }
            const a = blk.querySelector('a[href^="https://bsky.app/profile/"]');
            const p = a && parse(a.getAttribute('href'));
            if (!p) continue;
            try {
                blk.setAttribute('data-bluesky-uri', await toAtUri(p.handle, p.rkey));
                needsEmbed = true;
            } catch { }
        }
        if (!needsEmbed) return;
        const s = document.createElement('script');
        s.async = true; s.src = 'https://embed.bsky.app/static/embed.js'; s.charset = 'utf-8';
        document.body.appendChild(s);
    }

    if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', run); else run();
})();


