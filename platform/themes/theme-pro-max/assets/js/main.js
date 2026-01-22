// DOM Elements
const filterButtons = document.querySelectorAll('.filter-btn');

// Initial Render
document.addEventListener('DOMContentLoaded', () => {
    // lucide.createIcons();
});

// Event Listeners - Visual toggle only for filters
// (Optional: if the user wanted purely static, we might remove this too, 
// but keeping the visual toggle feeling is often nice even if data isn't filtering)
filterButtons.forEach(btn => {
    btn.addEventListener('click', () => {
        // Update active state
        filterButtons.forEach(b => {
            b.classList.remove('bg-primary', 'text-white', 'border-transparent');
            b.classList.add('bg-transparent', 'text-primary', 'border-primary');
        });
        btn.classList.remove('bg-transparent', 'text-primary', 'border-primary');
        btn.classList.add('bg-primary', 'text-white', 'border-transparent');
    });
});
