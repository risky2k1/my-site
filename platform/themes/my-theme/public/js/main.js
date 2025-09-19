// Smooth scrolling for anchor links
document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
    anchor.addEventListener("click", function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute("href"));
        if (target) {
            target.scrollIntoView({
                behavior: "smooth",
                block: "start",
            });
        }
    });
});

// Add scroll-triggered animations
const observerOptions = {
    threshold: 0.1,
    rootMargin: "0px 0px -50px 0px",
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
        if (entry.isIntersecting) {
            entry.target.classList.add("animate-fade-in-up");
        }
    });
}, observerOptions);

// Observe all cards and sections
document.querySelectorAll(".card-hover, section").forEach((el) => {
    observer.observe(el);
});

// Mobile menu toggle
const mobileMenuBtn = document.querySelector(".md\\:hidden button");
const navLinks = document.querySelector(".md\\:flex");

if (mobileMenuBtn && navLinks) {
    mobileMenuBtn.addEventListener("click", () => {
        navLinks.classList.toggle("hidden");
        navLinks.classList.toggle("flex");
    });
}

// Add parallax effect to hero section
window.addEventListener("scroll", () => {
    const scrolled = window.pageYOffset;
    const hero = document.querySelector(".hero-section");
    if (hero) {
        hero.style.transform = `translateY(${scrolled * 0.10}px)`;
    }
});


// Blog filtering and sorting functionality
const searchInput = document.getElementById('searchInput');
const categoryFilter = document.getElementById('categoryFilter');
const sortBy = document.getElementById('sortBy');
const postsContainer = document.getElementById('postsContainer');
const blogPosts = document.querySelectorAll('.blog-post');
const gridView = document.getElementById('gridView');
const listView = document.getElementById('listView');

let currentView = 'grid';

// Search functionality
searchInput.addEventListener('input', filterPosts);
categoryFilter.addEventListener('change', filterPosts);
sortBy.addEventListener('change', sortPosts);

// View toggle
gridView.addEventListener('click', () => toggleView('grid'));
listView.addEventListener('click', () => toggleView('list'));

function filterPosts() {
    const searchTerm = searchInput.value.toLowerCase();
    const selectedCategory = categoryFilter.value;

    blogPosts.forEach(post => {
        const title = post.dataset.title.toLowerCase();
        const category = post.dataset.category;

        const matchesSearch = title.includes(searchTerm);
        const matchesCategory = !selectedCategory || category === selectedCategory;

        if (matchesSearch && matchesCategory) {
            post.style.display = 'block';
            post.classList.add('animate-fade-in');
        } else {
            post.style.display = 'none';
        }
    });
}

function sortPosts() {
    const sortValue = sortBy.value;
    const postsArray = Array.from(blogPosts);

    postsArray.sort((a, b) => {
        switch (sortValue) {
            case 'date-desc':
                return new Date(b.dataset.date) - new Date(a.dataset.date);
            case 'date-asc':
                return new Date(a.dataset.date) - new Date(b.dataset.date);
            case 'title-asc':
                return a.dataset.title.localeCompare(b.dataset.title);
            case 'title-desc':
                return b.dataset.title.localeCompare(a.dataset.title);
            default:
                return 0;
        }
    });

    // Re-append sorted posts
    postsArray.forEach(post => postsContainer.appendChild(post));
}

function toggleView(view) {
    currentView = view;

    if (view === 'grid') {
        gridView.classList.add('bg-primary', 'text-white');
        gridView.classList.remove('bg-gray-200', 'text-gray-700');
        listView.classList.add('bg-gray-200', 'text-gray-700');
        listView.classList.remove('bg-primary', 'text-white');

        postsContainer.className = 'grid md:grid-cols-2 lg:grid-cols-3 gap-8';
    } else {
        listView.classList.add('bg-primary', 'text-white');
        listView.classList.remove('bg-gray-200', 'text-gray-700');
        gridView.classList.add('bg-gray-200', 'text-gray-700');
        gridView.classList.remove('bg-primary', 'text-white');

        postsContainer.className = 'space-y-6';

        // Adjust post layout for list view
        blogPosts.forEach(post => {
            if (view === 'list') {
                post.classList.add('md:flex');
                const img = post.querySelector('div:first-child');
                if (img) {
                    img.classList.add('md:w-64', 'md:h-48');
                }
            } else {
                post.classList.remove('md:flex');
            }
        });
    }
}

// Observe all blog posts
blogPosts.forEach(post => {
    observer.observe(post);
});
