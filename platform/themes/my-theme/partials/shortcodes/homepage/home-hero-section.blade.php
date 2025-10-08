<!-- Hero Section -->
<section class="gradient-bg hero-section d-flex align-items-center">
    <div class="position-absolute top-0 start-0 w-100 h-100" style="background: rgba(0,0,0,0.10);"></div>
    <div class="container position-relative z-1 text-center py-5">
        <div class="animate-fade-in-up">
            <h1 class="display-4 display-md-2 fw-bold text-white mb-3">
                {{ $shortcode->title }}
            </h1>
            <p class="fs-5 text-white-50 mb-4 mx-auto" style="max-width: 720px;">
                {{ $shortcode->description }}
            </p>
            <div class="d-flex flex-column flex-sm-row gap-3 justify-content-center align-items-center">
                <a href="#featured" class="btn btn-light text-primary fw-semibold px-4 py-2 rounded-pill">View My Work</a>
                <a href="#" class="btn btn-outline-light fw-semibold px-4 py-2 rounded-pill">Download CV</a>
            </div>
        </div>
    </div>

    <!-- Floating Elements -->
    <div class="position-absolute" style="top: 5rem; left: 5rem;">
        <div class="animate-float rounded-circle" style="width: 4rem; height: 4rem; background: rgba(255,255,255,0.2);"></div>
    </div>
    <div class="position-absolute" style="bottom: 10rem; right: 5rem; animation-delay: 2s;">
        <div class="animate-float rounded-circle" style="width: 3rem; height: 3rem; background: rgba(240,147,251,0.3);"></div>
    </div>
    <div class="position-absolute" style="top: 50%; left: 2.5rem; animation-delay: 4s;">
        <div class="animate-float rounded-circle" style="width: 2rem; height: 2rem; background: rgba(255,255,255,0.3);"></div>
    </div>
</section>
