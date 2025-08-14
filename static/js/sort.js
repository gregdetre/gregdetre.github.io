// Simple client-side sorting for folder index lists
(function () {
    function by(getKey, dir) {
        return function (a, b) {
            const ka = getKey(a);
            const kb = getKey(b);
            if (ka === kb) return 0;
            const lt = ka < kb ? -1 : 1;
            return dir === 'asc' ? lt : -lt;
        };
    }

    function parseIntAttr(el, name) {
        const v = parseInt(el.getAttribute(name) || '0', 10);
        return isNaN(v) ? 0 : v;
    }

    function sortList(list, criterion) {
        const items = Array.from(list.querySelectorAll('li'));
        let comparator;
        switch (criterion) {
            case 'date_asc':
                comparator = by((el) => parseIntAttr(el, 'data-date'), 'asc');
                break;
            case 'alpha':
                comparator = by((el) => (el.getAttribute('data-title') || ''), 'asc');
                break;
            case 'alpha_desc':
                comparator = by((el) => (el.getAttribute('data-title') || ''), 'desc');
                break;
            case 'modified_desc':
                comparator = by((el) => parseIntAttr(el, 'data-modified'), 'desc');
                break;
            case 'words_desc':
                comparator = by((el) => parseIntAttr(el, 'data-words'), 'desc');
                break;
            case 'words_asc':
                comparator = by((el) => parseIntAttr(el, 'data-words'), 'asc');
                break;
            case 'starred_first':
                // starred=1 should come first; then fall back to date desc
                comparator = function (a, b) {
                    const sa = parseIntAttr(a, 'data-starred');
                    const sb = parseIntAttr(b, 'data-starred');
                    if (sa !== sb) return sb - sa; // 1 before 0
                    const da = parseIntAttr(a, 'data-date');
                    const db = parseIntAttr(b, 'data-date');
                    return db - da;
                };
                break;
            case 'date_desc':
            default:
                comparator = by((el) => parseIntAttr(el, 'data-date'), 'desc');
                break;
        }

        // Stable re-render
        const frag = document.createDocumentFragment();
        items.sort(comparator).forEach((el) => frag.appendChild(el));
        list.appendChild(frag);
    }

    function init() {
        const list = document.getElementById('post-list');
        const select = document.getElementById('sort-select');
        if (!list || !select) return;

        // Initialize from query param if present, else keep default
        const params = new URLSearchParams(window.location.search);
        const qp = params.get('sort');
        if (qp) {
            const allowed = new Set(['date_desc', 'date_asc', 'alpha', 'alpha_desc', 'modified_desc', 'words_desc', 'words_asc', 'starred_first']);
            if (allowed.has(qp)) {
                select.value = qp;
            }
        }

        sortList(list, select.value);

        select.addEventListener('change', function () {
            sortList(list, select.value);
            // Update query param without reload for shareable links
            const url = new URL(window.location.href);
            url.searchParams.set('sort', select.value);
            window.history.replaceState({}, '', url);
        });
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();


