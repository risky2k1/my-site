 <!-- Hero Section -->
<section class="min-h-screen hero pt-20 px-6 relative overflow-hidden">
        <!-- Background Decor -->
        <div class="absolute top-0 right-0 w-1/2 h-1/2 bg-primary/10 blur-[120px] rounded-full pointer-events-none"></div>
        <div class="absolute bottom-0 left-0 w-1/3 h-1/3 bg-accent/10 blur-[100px] rounded-full pointer-events-none"></div>

        <div class="hero-content max-w-6xl mx-auto grid md:grid-cols-2 gap-12 items-center relative z-10 w-full p-0">
            <div class="space-y-8 text-left">
                <div class="badge badge-lg badge-outline gap-2 border-primary/20 text-primary bg-primary/10 p-4">
                    <span class="relative flex h-2 w-2">
                      <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-primary opacity-75"></span>
                      <span class="relative inline-flex rounded-full h-2 w-2 bg-primary"></span>
                    </span>
                    Available for work
                </div>
                <h1 class="text-5xl md:text-7xl font-heading font-bold leading-tight">
                    Building <span class="text-transparent bg-clip-text bg-gradient-to-r from-primary to-accent">Digital Experiences</span> that matter.
                </h1>
                <p class="text-lg text-base-content/70 max-w-lg leading-relaxed">
                    I'm a Full Stack Developer passionate about crafting accessible, pixel-perfect, and performant web experiences.
                </p>
                <div class="flex flex-wrap gap-4">
                    <a href="#projects" class="btn btn-primary gap-2">
                        View Projects <i data-lucide="arrow-right" class="w-4 h-4"></i>
                    </a>
                    <a href="https://github.com" target="_blank" class="btn btn-neutral gap-2 border border-white/10 hover:border-white/30">
                        <i data-lucide="github" class="w-4 h-4"></i> GitHub
                    </a>
                </div>
            </div>
            <!-- Hero Visual -->
            <div class="relative hidden md:block group">
                <div class="absolute inset-0 bg-gradient-to-tr from-primary to-purple-500 rounded-2xl rotate-6 opacity-30 group-hover:rotate-12 transition-transform duration-500"></div>
                <div class="card bg-base-200 border border-white/10 shadow-2xl skew-y-0 group-hover:-translate-y-2 transition-transform duration-500">
                    <div class="card-body p-6">
                         <pre class="font-mono text-sm text-blue-300 overflow-hidden">
<code><span class="text-purple-400">class</span> <span class="text-yellow-300">Developer</span> {
  <span class="text-purple-400">constructor</span>() {
    <span class="text-red-400">this</span>.name = <span class="text-green-400">"Tuan"</span>;
    <span class="text-red-400">this</span>.role = <span class="text-green-400">"Full Stack"</span>;
    <span class="text-red-400">this</span>.skills = [
      <span class="text-green-400">"Vue.js"</span>, <span class="text-green-400">"Node.js"</span>, 
      <span class="text-green-400">"Tailwind"</span>
    ];
  }

  <span class="text-blue-400">code</span>() {
    <span class="text-purple-400">return</span> <span class="text-green-400">"Hello World!"</span>;
  }
}</code>
                        </pre>
                    </div>
                </div>
            </div>
        </div>
    </section>
