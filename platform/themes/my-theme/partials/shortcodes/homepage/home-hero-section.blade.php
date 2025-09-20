<!-- Hero Section -->
<section
    class="gradient-bg hero-section min-h-screen flex items-center relative overflow-hidden"
>
    <div class="absolute inset-0 bg-black/10"></div>
    <div
        class="relative z-10 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center"
    >
        <div class="animate-fade-in-up">
            <h1 class="text-5xl md:text-7xl font-bold text-white mb-6">
                {{ $shortcode->title }}
                {{--Hello, I'm <span class="text-accent">Your Name</span>--}}
            </h1>
            <p class="text-xl md:text-2xl text-white/90 mb-8 max-w-3xl mx-auto">
                {{ $shortcode->description }}
                {{--Creative Developer & Designer crafting amazing digital experiences
                with modern technologies--}}
            </p>
            <div
                class="flex flex-col sm:flex-row gap-4 justify-center items-center"
            >
                <button
                    class="bg-white text-primary px-8 py-4 rounded-full font-semibold hover:bg-gray-100 transition-all duration-300 transform hover:scale-105"
                >
                    View My Work
                </button>
                <button
                    class="border-2 border-white text-white px-8 py-4 rounded-full font-semibold hover:bg-white hover:text-primary transition-all duration-300"
                >
                    Download CV
                </button>
            </div>
        </div>
    </div>

    <!-- Floating Elements -->
    <div class="absolute top-20 left-20 animate-float">
        <div class="w-16 h-16 bg-white/20 rounded-full"></div>
    </div>
    <div
        class="absolute bottom-40 right-20 animate-float"
        style="animation-delay: 2s"
    >
        <div class="w-12 h-12 bg-accent/30 rounded-full"></div>
    </div>
    <div
        class="absolute top-1/2 left-10 animate-float"
        style="animation-delay: 4s"
    >
        <div class="w-8 h-8 bg-white/30 rounded-full"></div>
    </div>
</section>
