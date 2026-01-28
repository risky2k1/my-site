document.addEventListener('DOMContentLoaded', function () {
    const grid = document.getElementById('timeline-grid');
    const sentinel = document.getElementById('timeline-sentinel');
    const loader = document.getElementById('timeline-loading');
    const noMore = document.getElementById('timeline-no-more');

    if (!grid || !sentinel) return;

    let page = 1;
    let loading = false;
    let hasMore = true;

    const observer = new IntersectionObserver(entries => {
        if (!entries[0].isIntersecting || loading || !hasMore) return;
        page++;
        fetchTimelines();
    }, { rootMargin: '200px' });

    observer.observe(sentinel);

    function fetchTimelines() {
        loading = true;
        loader?.classList.remove('hidden');

        fetch(`ajax/timeline-items?page=${page}`, {
            headers: { 'X-Requested-With': 'XMLHttpRequest' },
        })
            .then(res => res.json())
            .then(({ html, meta }) => {
                grid.insertAdjacentHTML('beforeend', html);
                hasMore = meta.has_more;
                if (!hasMore) noMore?.classList.remove('hidden');
            })
            .finally(() => {
                loading = false;
                loader?.classList.add('hidden');
            });
    }

    // initial
    fetchTimelines();
});
