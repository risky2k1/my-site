<section class="relative min-h-screen flex items-center justify-center bg-gradient-to-br from-primary-50 via-white to-primary-100 overflow-hidden">
    <!-- Background decoration -->
    <div class="absolute inset-0 overflow-hidden">
        <div class="absolute -top-40 -right-40 w-80 h-80 bg-primary-200 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob"></div>
        <div class="absolute -bottom-40 -left-40 w-80 h-80 bg-primary-300 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob animation-delay-2000"></div>
        <div
            class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-80 h-80 bg-primary-100 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob animation-delay-4000"></div>
    </div>

    <div class="container-custom relative z-10 text-center">
        <div class="mb-8 animate-fade-in-up">
            <h1 class="text-5xl md:text-7xl font-bold text-gray-900 mb-4">
                Hi, I'm <span class="text-primary-600">My Name</span>
            </h1>
            <p class="text-xl md:text-2xl text-gray-600 mb-2">Frontend Developer</p>
            <p class="text-lg text-gray-500 max-w-2xl mx-auto">
                Short description here
            </p>
        </div>

        <div class="flex gap-4 justify-center mb-12 animate-fade-in-up animation-delay-200">
            <a href="#projects" class="btn btn-primary">View My Work</a>
            <a href="#contact" class="btn btn-secondary">Get In Touch</a>
        </div>

        <!-- Social links -->
        <div class="flex gap-6 justify-center animate-fade-in-up animation-delay-400">
            <!-- GitHub -->
            <a href="#" aria-label="GitHub" class="text-gray-600 hover:text-primary-600 transition">
                <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
                </svg>
            </a>

            <!-- LinkedIn -->
            <a href="#" aria-label="LinkedIn" class="text-gray-600 hover:text-primary-600 transition">
                <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
                </svg>
            </a>

            <!-- Twitter -->
            <a href="#" aria-label="Twitter" class="text-gray-600 hover:text-primary-600 transition">
                <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z"/>
                </svg>
            </a>

            <!-- Email -->
            <a href="mailto:hello@example.com" aria-label="Email" class="text-gray-600 hover:text-primary-600 transition">
                <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M1.5 4.5h21v15h-21z"/>
                </svg>
            </a>
        </div>
    </div>

    <!-- Scroll indicator -->
    <div class="absolute bottom-8 left-1/2 -translate-x-1/2 animate-bounce">
        <svg class="w-6 h-6 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7-7-7M12 21V3"/>
        </svg>
    </div>
</section>

<section id="about" class="section bg-white">
    <div class="container-custom max-w-4xl mx-auto">
        <h2 class="text-4xl md:text-5xl font-bold text-center mb-12">About Me</h2>

        <div class="grid md:grid-cols-2 gap-12 items-center">
            <div class="space-y-6 text-lg text-gray-600">
                <p>Bio text here</p>
                <p>Mission text here</p>
            </div>

            <div>
                <h3 class="text-2xl font-semibold mb-4">Skills & Technologies</h3>

                <!-- Skill -->
                <div class="mb-4">
                    <div class="flex justify-between mb-2">
                        <span class="font-medium">HTML / CSS</span>
                        <span class="text-primary-600 font-semibold">90%</span>
                    </div>
                    <div class="bg-gray-200 h-3 rounded-full">
                        <div class="h-3 bg-gradient-to-r from-primary-500 to-primary-600 rounded-full" style="width:90%"></div>
                    </div>
                </div>

                <div class="mb-4">
                    <div class="flex justify-between mb-2">
                        <span class="font-medium">JavaScript</span>
                        <span class="text-primary-600 font-semibold">80%</span>
                    </div>
                    <div class="bg-gray-200 h-3 rounded-full">
                        <div class="h-3 bg-gradient-to-r from-primary-500 to-primary-600 rounded-full" style="width:80%"></div>
                    </div>
                </div>

                <div class="mb-4">
                    <div class="flex justify-between mb-2">
                        <span class="font-medium">TailwindCSS</span>
                        <span class="text-primary-600 font-semibold">85%</span>
                    </div>
                    <div class="bg-gray-200 h-3 rounded-full">
                        <div class="h-3 bg-gradient-to-r from-primary-500 to-primary-600 rounded-full" style="width:85%"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="projects" class="section bg-gray-50">
    <div class="container-custom">
        <h2 class="text-4xl md:text-5xl font-bold text-center mb-4">My Projects</h2>
        <p class="text-center text-gray-600 mb-12 max-w-2xl mx-auto">
            Recent works
        </p>

        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
            <!-- Project -->
            <div class="group bg-white rounded-xl shadow-lg hover:shadow-2xl transition transform hover:-translate-y-2">
                <div class="aspect-video bg-primary-100 flex items-center justify-center">
                    <span class="text-primary-400">Preview</span>
                </div>
                <div class="p-6">
                    <h3 class="text-xl font-bold mb-2">Project One</h3>
                    <p class="text-gray-600 mb-4">Project description</p>
                    <div class="flex gap-2">
                        <span class="px-3 py-1 bg-primary-50 text-primary-700 text-sm rounded-full">HTML</span>
                        <span class="px-3 py-1 bg-primary-50 text-primary-700 text-sm rounded-full">CSS</span>
                    </div>
                </div>
            </div>

            <!-- copy thêm 2 block tương tự -->
        </div>
    </div>
</section>

<section id="contact" class="section bg-white">
    <div class="container-custom max-w-4xl mx-auto">
        <h2 class="text-4xl md:text-5xl font-bold text-center mb-12">Get In Touch</h2>

        <form method="post" action="#" class="space-y-6">
            <input type="text" name="name" placeholder="Your name" class="w-full border rounded-lg px-4 py-3">
            <input type="email" name="email" placeholder="Your email" class="w-full border rounded-lg px-4 py-3">
            <textarea name="message" rows="5" placeholder="Message" class="w-full border rounded-lg px-4 py-3"></textarea>
            <button type="submit" class="btn btn-primary w-full">Send Message</button>
        </form>
    </div>
</section>
