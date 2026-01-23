document.addEventListener('DOMContentLoaded', function () {
    const sidebar = document.getElementById('left-sidebar-filter');
    const grid = document.getElementById('places-grid');

    if (!sidebar || !grid) return;

    let controller; // dùng để abort request cũ

    sidebar.addEventListener('change', function (e) {
        if (e.target.type !== 'checkbox') return;

        // Abort request cũ nếu user click liên tục
        if (controller) {
            controller.abort();
        }
        controller = new AbortController();

        const params = new URLSearchParams();

        // Gom tất cả checkbox đang checked
        sidebar.querySelectorAll('input[type="checkbox"]:checked')
            .forEach(input => {
                params.append(input.name, input.value);
            });

        // Optional: loading state
        grid.classList.add('opacity-50', 'pointer-events-none');

        fetch(`admin/ajax/filter-places?${params.toString()}`, {
            method: 'GET',
            headers: {
                'X-Requested-With': 'XMLHttpRequest'
            },
            signal: controller.signal
        })
            .then(res => {
                if (!res.ok) throw new Error('Network error');
                return res.text();
            })
            .then(html => {
                console.log(html);
                grid.innerHTML = html;
            })
            .catch(err => {
                if (err.name !== 'AbortError') {
                    console.error(err);
                }
            })
            .finally(() => {
                grid.classList.remove('opacity-50', 'pointer-events-none');
            });
    });

    document.getElementById('filter-reset')?.addEventListener('click', function () {
        document
            .querySelectorAll('#left-sidebar-filter input[type="checkbox"]')
            .forEach(cb => cb.checked = false);

        // trigger lại ajax
        document
            .querySelector('#left-sidebar-filter')
            .dispatchEvent(new Event('change', { bubbles: true }));
    });
});
