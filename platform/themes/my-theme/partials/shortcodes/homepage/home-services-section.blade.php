<!-- Services Section -->
<section class="py-20 bg-white">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-16">
            <h2 class="text-4xl md:text-5xl font-bold text-gray-900 mb-4">
                {{--What I Do--}}
                {{ $shortcode->title }}
            </h2>
            <p class="text-xl text-gray-600 max-w-2xl mx-auto">
                {{--I specialize in creating modern, responsive, and user-friendly
                digital solutions--}}
                {{ $shortcode->description }}
            </p>
        </div>

        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
            <div
                class="card-hover bg-white p-8 rounded-2xl shadow-lg border border-gray-100"
            >
                <div class="text-4xl text-primary mb-6">
                    <i class="fas fa-laptop-code"></i>
                </div>
                <h3 class="text-2xl font-bold text-gray-900 mb-4">
                    Web Development
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Modern, responsive websites built with cutting-edge technologies
                    like Vue.js, React, and Node.js.
                </p>
            </div>

            <div
                class="card-hover bg-white p-8 rounded-2xl shadow-lg border border-gray-100"
            >
                <div class="text-4xl text-primary mb-6">
                    <i class="fas fa-mobile-alt"></i>
                </div>
                <h3 class="text-2xl font-bold text-gray-900 mb-4">Mobile Apps</h3>
                <p class="text-gray-600 leading-relaxed">
                    Native and cross-platform mobile applications that provide
                    seamless user experiences.
                </p>
            </div>

            <div
                class="card-hover bg-white p-8 rounded-2xl shadow-lg border border-gray-100"
            >
                <div class="text-4xl text-primary mb-6">
                    <i class="fas fa-paint-brush"></i>
                </div>
                <h3 class="text-2xl font-bold text-gray-900 mb-4">UI/UX Design</h3>
                <p class="text-gray-600 leading-relaxed">
                    Beautiful, intuitive designs that focus on user experience and
                    modern aesthetics.
                </p>
            </div>

            <div
                class="card-hover bg-white p-8 rounded-2xl shadow-lg border border-gray-100"
            >
                <div class="text-4xl text-primary mb-6">
                    <i class="fas fa-database"></i>
                </div>
                <h3 class="text-2xl font-bold text-gray-900 mb-4">
                    Backend Systems
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Robust backend solutions and APIs that power modern web
                    applications.
                </p>
            </div>

            <div
                class="card-hover bg-white p-8 rounded-2xl shadow-lg border border-gray-100"
            >
                <div class="text-4xl text-primary mb-6">
                    <i class="fas fa-cloud"></i>
                </div>
                <h3 class="text-2xl font-bold text-gray-900 mb-4">
                    Cloud Solutions
                </h3>
                <p class="text-gray-600 leading-relaxed">
                    Scalable cloud infrastructure and deployment strategies for modern
                    applications.
                </p>
            </div>

            <div
                class="card-hover bg-white p-8 rounded-2xl shadow-lg border border-gray-100"
            >
                <div class="text-4xl text-primary mb-6">
                    <i class="fas fa-chart-line"></i>
                </div>
                <h3 class="text-2xl font-bold text-gray-900 mb-4">Analytics</h3>
                <p class="text-gray-600 leading-relaxed">
                    Data-driven insights and analytics to optimize performance and
                    user engagement.
                </p>
            </div>
        </div>
    </div>
</section>
