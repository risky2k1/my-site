document.addEventListener('DOMContentLoaded', function () {
    const sidebar = document.getElementById('left-sidebar-filter');
    const grid = document.getElementById('places-grid');
    const sentinel = document.getElementById('load-more-sentinel');
    const loader = document.getElementById('loading-indicator');
    const noMore = document.getElementById('no-more');

    if (!grid || !sentinel) return;

    let page = 1;
    let loading = false;
    let hasMore = true;
    let controller = null;
    let debounceTimer = null;

    /**
     * Build filter params
     */
    function buildFilterParams() {
        const params = new URLSearchParams();

        sidebar?.querySelectorAll('input[type="checkbox"]:checked')
            .forEach(input => {
                params.append(input.name, input.value);
            });

        params.append('page', page);

        return params;
    }

    /**
     * UI helpers
     */
    function showLoader() {
        loader?.classList.remove('hidden');
    }

    function hideLoader() {
        loader?.classList.add('hidden');
    }

    function showNoMore() {
        noMore?.classList.remove('hidden');
    }

    function hideNoMore() {
        noMore?.classList.add('hidden');
    }

    /**
     * Fetch places
     */
    function fetchPlaces(reset = false) {
        if (loading || (!hasMore && !reset)) return;

        loading = true;
        showLoader();
        hideNoMore();

        if (controller) controller.abort();
        controller = new AbortController();

        if (reset) {
            page = 1;
            hasMore = true;
            grid.innerHTML = '';
        }

        const params = buildFilterParams();

        fetch(`admin/ajax/filter-places?${params.toString()}`, {
            headers: { 'X-Requested-With': 'XMLHttpRequest' },
            signal: controller.signal,
        })
            .then(res => res.json())
            .then(({ html, meta }) => {
                if (reset) {
                    grid.innerHTML = html;
                } else {
                    grid.insertAdjacentHTML('beforeend', html);
                }

                hasMore = meta.has_more;
                page = meta.current_page;

                if (!hasMore) {
                    showNoMore();
                }
            })
            .catch(err => {
                if (err.name !== 'AbortError') {
                    console.error(err);
                }
            })
            .finally(() => {
                loading = false;
                hideLoader();
            });
    }

    /**
     * Debounced fetch (300ms)
     */
    function debouncedFetch(reset = false) {
        clearTimeout(debounceTimer);

        debounceTimer = setTimeout(() => {
            fetchPlaces(reset);
        }, 250);
    }

    /**
     * IntersectionObserver
     */
    const observer = new IntersectionObserver(entries => {
        if (!entries[0].isIntersecting) return;
        if (!hasMore || loading) return;

        page++;
        debouncedFetch();
    }, {
        rootMargin: '200px',
    });

    observer.observe(sentinel);

    /**
     * Filter change → reset list
     */
    sidebar?.addEventListener('change', function (e) {
        if (e.target.type !== 'checkbox') return;
        debouncedFetch(true);
    });

    /**
     * Reset filter
     */
    document.getElementById('filter-reset')?.addEventListener('click', function () {
        sidebar
            ?.querySelectorAll('input[type="checkbox"]')
            .forEach(cb => cb.checked = false);

        debouncedFetch(true);
    });

    /**
     * Initial load
     */
    debouncedFetch(true);

    document.addEventListener('click', function (e) {
        const btn = e.target.closest('[data-open-place-modal]');
        if (!btn) return;

        const placeId = btn.dataset.placeId;
        const modal = document.getElementById('place_modal_detail');

        if (!modal) return;

        // 👉 sau này bạn gọi ajax load detail ở đây
        // loadPlaceDetail(placeId);

        modal.showModal();
    });
});
