document.addEventListener('DOMContentLoaded', function () {
    const el = document.getElementById('place-lightgallery');
    if (!el || typeof lightGallery === 'undefined') return;

    lightGallery(el, {
        selector: 'a',
        speed: 300,
        download: false,
        thumbnail: true,
        animateThumb: true,
        showThumbByDefault: false,
    });
});
