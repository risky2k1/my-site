document.addEventListener('DOMContentLoaded', function () {
    const grid = document.getElementById('places-grid');
    const sentinel = document.getElementById('load-more-sentinel');

    if (!grid || !sentinel) return;

    const sidebar = document.getElementById('left-sidebar-filter');
    const loader = document.getElementById('loading-indicator');
    const noMore = document.getElementById('no-more');

    let page = 1;
    let loading = false;
    let hasMore = true;
    let controller = null;
    let debounceTimer = null;

    const observer = new IntersectionObserver(entries => {
        if (!entries[0].isIntersecting || loading || !hasMore) return;
        page++;
        debouncedFetch();
    }, { rootMargin: '200px' });

    observer.observe(sentinel);

    function buildFilterParams() {
        const params = new URLSearchParams();
        sidebar?.querySelectorAll('input[type="checkbox"]:checked')
            .forEach(input => params.append(input.name, input.value));
        params.append('page', page);
        return params;
    }

    function fetchPlaces(reset = false) {
        if (loading) return;

        loading = true;
        loader?.classList.remove('hidden');

        if (controller) controller.abort();
        controller = new AbortController();

        if (reset) {
            page = 1;
            hasMore = true;
            grid.innerHTML = '';
        }

        fetch(`admin/ajax/filter-places?${buildFilterParams()}`, {
            headers: { 'X-Requested-With': 'XMLHttpRequest' },
            signal: controller.signal,
        })
            .then(res => res.json())
            .then(({ html, meta }) => {
                grid.insertAdjacentHTML('beforeend', html);
                hasMore = meta.has_more;
                page = meta.current_page;
                if (!hasMore) noMore?.classList.remove('hidden');
            })
            .finally(() => {
                loading = false;
                loader?.classList.add('hidden');
            });
    }

    function debouncedFetch(reset = false) {
        clearTimeout(debounceTimer);
        debounceTimer = setTimeout(() => fetchPlaces(reset), 250);
    }

    sidebar?.addEventListener('change', e => {
        if (e.target.type === 'checkbox') debouncedFetch(true);
    });

    document.getElementById('filter-reset')?.addEventListener('click', () => {
        sidebar?.querySelectorAll('input[type="checkbox"]')
            .forEach(cb => cb.checked = false);
        debouncedFetch(true);
    });

    debouncedFetch(true);
});
