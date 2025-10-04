// Timeline Animation on Scroll
const observerOptions = {
    threshold: 0.3,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('animate-in');
        }
    });
}, observerOptions);

// Observe all timeline items
document.querySelectorAll('.timeline-item').forEach(item => {
    observer.observe(item);
});

// Floating Hearts Animation
function createFloatingHeart() {
    const heartsContainer = document.getElementById('floating-hearts');
    const heart = document.createElement('div');
    heart.className = 'heart';
    heart.innerHTML = ['💖', '💕', '💗', '💝', '💘'][Math.floor(Math.random() * 5)];

    // Random position and animation duration
    heart.style.left = Math.random() * 100 + '%';
    heart.style.animationDuration = (Math.random() * 3 + 5) + 's';
    heart.style.animationDelay = Math.random() * 2 + 's';

    heartsContainer.appendChild(heart);

    // Remove heart after animation
    setTimeout(() => {
        heart.remove();
    }, 8000);
}

// Create floating hearts periodically
setInterval(createFloatingHeart, 2000);

// Counter Animation
function animateCounter(element, target, duration = 2000) {
    let start = 0;
    const increment = target / (duration / 16);

    const timer = setInterval(() => {
        start += increment;
        if (start >= target) {
            element.textContent = target;
            clearInterval(timer);
        } else {
            element.textContent = Math.floor(start);
        }
    }, 16);
}

// Calculate days together (from May 20, 2021)
function calculateDaysTogether() {
    const startDate = new Date('2021-05-20');
    const today = new Date();
    const timeDiff = today.getTime() - startDate.getTime();
    const daysDiff = Math.ceil(timeDiff / (1000 * 3600 * 24));
    return daysDiff;
}

// Animate counters when they come into view
const counterObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            const daysCounter = document.getElementById('days-counter');
            const memoriesCounter = document.getElementById('memories-counter');
            const adventuresCounter = document.getElementById('adventures-counter');

            if (daysCounter && !daysCounter.classList.contains('animated')) {
                daysCounter.classList.add('animated');
                animateCounter(daysCounter, calculateDaysTogether());
                animateCounter(memoriesCounter, 847);
                animateCounter(adventuresCounter, 23);
            }
        }
    });
}, {threshold: 0.5});

// Observe counter section
const counterSection = document.querySelector('.love-gradient');
if (counterSection) {
    counterObserver.observe(counterSection);
}

// Add hover effects to timeline cards
document.querySelectorAll('.timeline-card').forEach(card => {
    card.addEventListener('mouseenter', () => {
        card.style.transform = 'translateY(-10px) scale(1.02)';
    });

    card.addEventListener('mouseleave', () => {
        card.style.transform = 'translateY(0) scale(1)';
    });
});

// Mobile menu toggle
const mobileMenuBtn = document.querySelector('.md\\:hidden button');
const navLinks = document.querySelector('.md\\:flex');

if (mobileMenuBtn && navLinks) {
    mobileMenuBtn.addEventListener('click', () => {
        navLinks.classList.toggle('hidden');
        navLinks.classList.toggle('flex');
    });
}

// Smooth scrolling for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Add sparkle effect to timeline markers on hover
document.querySelectorAll('.timeline-marker').forEach(marker => {
    marker.addEventListener('mouseenter', () => {
        // Create sparkle elements
        for (let i = 0; i < 6; i++) {
            const sparkle = document.createElement('div');
            sparkle.style.cssText = `
                        position: absolute;
                        width: 4px;
                        height: 4px;
                        background: white;
                        border-radius: 50%;
                        pointer-events: none;
                        animation: sparkle 1s ease-out forwards;
                    `;

            const angle = (i * 60) * Math.PI / 180;
            const distance = 30;
            sparkle.style.left = `calc(50% + ${Math.cos(angle) * distance}px)`;
            sparkle.style.top = `calc(50% + ${Math.sin(angle) * distance}px)`;

            marker.appendChild(sparkle);

            setTimeout(() => sparkle.remove(), 1000);
        }
    });
});

// Add sparkle animation keyframes
const style = document.createElement('style');
style.textContent = `
            @keyframes sparkle {
                0% {
                    transform: scale(0) rotate(0deg);
                    opacity: 1;
                }
                50% {
                    transform: scale(1) rotate(180deg);
                    opacity: 1;
                }
                100% {
                    transform: scale(0) rotate(360deg);
                    opacity: 0;
                }
            }
        `;
document.head.appendChild(style);

// Add parallax effect to hero section
window.addEventListener('scroll', () => {
    const scrolled = window.pageYOffset;
    const heroSection = document.querySelector('.love-gradient');
    const parallaxElements = heroSection.querySelectorAll('.absolute');

    parallaxElements.forEach((element, index) => {
        const speed = 0.3 + (index * 0.1);
        element.style.transform = `translateY(${scrolled * speed}px)`;
    });
});

// Add typing effect to hero title (optional)
function typeWriter(element, text, speed = 100) {
    let i = 0;
    element.textContent = '';

    function type() {
        if (i < text.length) {
            element.textContent += text.charAt(i);
            i++;
            setTimeout(type, speed);
        }
    }

    type();
}

// Initialize typing effect on page load
document.addEventListener('DOMContentLoaded', () => {
    const heroTitle = document.querySelector('.script-font');
    if (heroTitle) {
        // Uncomment the line below if you want typing effect
        // typeWriter(heroTitle, 'Our Journey', 150);
    }
});

// Add click handler for timeline items to expand/show more details
document.querySelectorAll('.timeline-card').forEach(card => {
    card.addEventListener('click', () => {
        // Add a gentle pulse effect when clicked
        card.style.animation = 'pulse 0.6s ease-in-out';
        setTimeout(() => {
            card.style.animation = '';
        }, 600);

        // You could expand this to show a modal with more photos/details
        console.log('Timeline item clicked - could open detailed view');
    });
});

// Add CSS for pulse animation
const pulseStyle = document.createElement('style');
pulseStyle.textContent = `
            @keyframes pulse {
                0% { transform: scale(1); }
                50% { transform: scale(1.05); }
                100% { transform: scale(1); }
            }
        `;
document.head.appendChild(pulseStyle);

// Add intersection observer for timeline line animation
const timelineObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            const timeline = document.querySelector('.timeline::before');
            // You could animate the timeline line growing as user scrolls
        }
    });
}, {threshold: 0.1});

document.querySelectorAll('.timeline-item').forEach(item => {
    timelineObserver.observe(item);
});
