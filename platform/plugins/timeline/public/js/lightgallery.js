document.addEventListener('click', function (e) {
    const trigger = e.target.closest('.open-gallery');
    if (!trigger) return;

    e.preventDefault();

    let images = [];
    try {
        images = JSON.parse(trigger.dataset.gallery);
    } catch (err) {
        console.error('Gallery data invalid', err);
        return;
    }

    if (!images.length) return;

    const container = document.createElement('div');
    document.body.appendChild(container);

    const gallery = lightGallery(container, {
        dynamic: true,
        dynamicEl: images,
        fullscreen: true,
        closable: true,
        download: false,
        counter: true,
    });

    gallery.openGallery(0);

    container.addEventListener('lgAfterClose', () => {
        gallery.destroy();
        container.remove();
    });
});
