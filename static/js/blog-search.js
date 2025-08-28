// Smart search: free text + tag chips for /blog listings
// - Filters existing <li> items in #post-list using data-* attributes from the template
// - Supports multiple tag chips (AND)
// - Free-text query tokenized by whitespace; all tokens must match title|tags|excerpt
// - Tag suggestions appear under the input based on available tags
// - Syncs state with URL (?q=...&tags=t1,t2)
(function () {
    function debounce(fn, ms) {
        let t = null;
        return function () {
            const args = arguments;
            const ctx = this;
            clearTimeout(t);
            t = setTimeout(function () { fn.apply(ctx, args); }, ms);
        };
    }

    function getAllPostItems() {
        const list = document.getElementById('post-list');
        if (!list) return [];
        return Array.from(list.querySelectorAll('li'));
    }

    function collectAllTags(items) {
        const set = new Set();
        items.forEach((el) => {
            const raw = (el.getAttribute('data-tags') || '').trim();
            if (!raw) return;
            raw.split('|').forEach((t) => {
                const tag = t.trim();
                if (tag) set.add(tag);
            });
        });
        return Array.from(set).sort();
    }

    function parseParams() {
        const params = new URLSearchParams(window.location.search);
        const q = (params.get('q') || '').trim();
        const tags = (params.get('tags') || '').split(',').map((t) => t.trim()).filter(Boolean);
        return { q, tags };
    }

    function writeParams(q, tags) {
        const url = new URL(window.location.href);
        if (q && q.trim()) url.searchParams.set('q', q.trim()); else url.searchParams.delete('q');
        if (tags && tags.length) url.searchParams.set('tags', tags.join(',')); else url.searchParams.delete('tags');
        window.history.replaceState({}, '', url);
    }

    function tokenize(text) {
        return (text || '').toLowerCase().split(/\s+/).filter(Boolean);
    }

    function matchesPost(el, queryTokens, selectedTags) {
        const title = (el.getAttribute('data-title') || '').toLowerCase();
        const tags = (el.getAttribute('data-tags') || '').toLowerCase();
        const excerpt = (el.getAttribute('data-excerpt') || '').toLowerCase();
        // Tag filter: AND semantics
        for (const t of selectedTags) {
            if (!tags.split('|').includes(t.toLowerCase())) return false;
        }
        // Text tokens: require every token match somewhere
        for (const tok of queryTokens) {
            if (!(title.includes(tok) || tags.includes(tok) || excerpt.includes(tok))) return false;
        }
        return true;
    }

    function filterList(items, query, selectedTags) {
        const qTokens = tokenize(query);
        let visibleCount = 0;
        items.forEach((el) => {
            const ok = matchesPost(el, qTokens, selectedTags);
            el.style.display = ok ? '' : 'none';
            if (ok) visibleCount += 1;
        });
        const list = document.getElementById('post-list');
        if (list) list.setAttribute('data-visible-count', String(visibleCount));
    }

    function renderChips(container, tags, onRemove) {
        container.innerHTML = '';
        tags.forEach((t, idx) => {
            const chip = document.createElement('button');
            chip.type = 'button';
            chip.className = 'chip';
            chip.textContent = t;
            chip.setAttribute('aria-label', `Remove tag ${t}`);
            chip.addEventListener('click', function () { onRemove(idx); });
            container.appendChild(chip);
        });
        if (tags.length) {
            const clear = document.createElement('button');
            clear.type = 'button';
            clear.className = 'chip-clear';
            clear.textContent = 'Clear tags';
            clear.addEventListener('click', function () { onRemove('all'); });
            container.appendChild(clear);
        }
    }

    function suggestTags(allTags, inputValue, alreadySelected) {
        const q = (inputValue || '').toLowerCase();
        if (!q) return [];
        return allTags
            .filter((t) => !alreadySelected.includes(t))
            .filter((t) => t.includes(q))
            .slice(0, 8);
    }

    function renderSuggestions(container, suggestions, onPick) {
        container.innerHTML = '';
        if (!suggestions.length) return;
        const ul = document.createElement('ul');
        ul.className = 'suggestion-list';
        suggestions.forEach((t) => {
            const li = document.createElement('li');
            const btn = document.createElement('button');
            btn.type = 'button';
            btn.textContent = t;
            btn.addEventListener('click', function () { onPick(t); });
            li.appendChild(btn);
            ul.appendChild(li);
        });
        container.appendChild(ul);
    }

    function init() {
        const input = document.getElementById('blog-search-input');
        const chipsEl = document.getElementById('blog-search-chips');
        const suggestEl = document.getElementById('blog-search-suggestions');
        const list = document.getElementById('post-list');
        if (!input || !chipsEl || !suggestEl || !list) return;

        const items = getAllPostItems();
        const allTags = collectAllTags(items);

        const state = { q: '', tags: [] };
        // Restore from URL
        const fromUrl = parseParams();
        state.q = fromUrl.q || '';
        state.tags = (fromUrl.tags || []).filter((t) => allTags.includes(t.toLowerCase()));
        input.value = state.q;
        renderChips(chipsEl, state.tags, function (idx) {
            if (idx === 'all') { state.tags = []; }
            else { state.tags.splice(idx, 1); }
            renderChips(chipsEl, state.tags, arguments.callee);
            filterList(items, state.q, state.tags);
            writeParams(state.q, state.tags);
        });

        const update = debounce(function () {
            filterList(items, state.q, state.tags);
            writeParams(state.q, state.tags);
            const sug = suggestTags(allTags, state.q, state.tags);
            renderSuggestions(suggestEl, sug, function (tag) {
                if (!state.tags.includes(tag)) state.tags.push(tag);
                input.value = '';
                state.q = '';
                renderChips(chipsEl, state.tags, function (idx) {
                    if (idx === 'all') { state.tags = []; }
                    else { state.tags.splice(idx, 1); }
                    renderChips(chipsEl, state.tags, arguments.callee);
                    filterList(items, state.q, state.tags);
                    writeParams(state.q, state.tags);
                });
                filterList(items, state.q, state.tags);
                writeParams(state.q, state.tags);
                renderSuggestions(suggestEl, [], function () { });
            });
        }, 120);

        input.addEventListener('input', function () {
            state.q = input.value;
            update();
        });

        input.addEventListener('keydown', function (e) {
            if (e.key === 'Escape') {
                input.value = '';
                state.q = '';
                renderSuggestions(suggestEl, [], function () { });
                update();
            }
        });

        // Initial apply
        filterList(items, state.q, state.tags);
        if (state.q) {
            renderSuggestions(suggestEl, suggestTags(allTags, state.q, state.tags), function () { });
        }
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();


