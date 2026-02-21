// Smooth scrolling for anchor links
document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
    anchor.addEventListener('click', function (e) {
        const href = this.getAttribute('href');
        if (href && href.length > 1) {
            e.preventDefault();
            const target = document.querySelector(href);
            if (target) {
                target.scrollIntoView({behavior: 'smooth', block: 'start'});
            }
        }
    });
});

// Intersection Observer animations
const observerOptions = {threshold: 0.1, rootMargin: '0px 0px -50px 0px'};
const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
        if (entry.isIntersecting) entry.target.classList.add('animate-fade-in-up');
    });
}, observerOptions);
document.querySelectorAll('.card-hover, section').forEach((el) => observer.observe(el));

// Parallax effect for hero
window.addEventListener('scroll', () => {
    const scrolled = window.pageYOffset;
    const hero = document.querySelector('.hero-section');
    if (hero) hero.style.transform = `translateY(${scrolled * 0.10}px)`;
});
