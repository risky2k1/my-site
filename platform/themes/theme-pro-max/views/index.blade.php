 <!-- Hero Section -->
 <section class="min-h-screen hero pt-20 px-6 relative overflow-hidden">
     <!-- Background Decor -->
     <div class="absolute top-0 right-0 w-1/2 h-1/2 bg-primary/10 blur-[120px] rounded-full pointer-events-none"></div>
     <div class="absolute bottom-0 left-0 w-1/3 h-1/3 bg-accent/10 blur-[100px] rounded-full pointer-events-none"></div>

     <div class="hero-content max-w-6xl mx-auto grid md:grid-cols-2 gap-12 items-center relative z-10 w-full p-0">
         <div class="space-y-8 text-left">
             <div class="badge badge-lg badge-outline gap-2 border-primary/20 text-primary bg-primary/10 p-4">
                 <span class="relative flex h-2 w-2">
                     <span
                         class="animate-ping absolute inline-flex h-full w-full rounded-full bg-primary opacity-75"></span>
                     <span class="relative inline-flex rounded-full h-2 w-2 bg-primary"></span>
                 </span>
                 Available for work
             </div>
             <h1 class="text-5xl md:text-7xl font-heading font-bold leading-tight">
                 Building <span class="text-transparent bg-clip-text bg-gradient-to-r from-primary to-accent">Digital
                     Experiences</span> that matter.
             </h1>
             <p class="text-lg text-base-content/70 max-w-lg leading-relaxed">
                 I'm a Full Stack Developer passionate about crafting accessible, pixel-perfect, and performant web
                 experiences.
             </p>
             <div class="flex flex-wrap gap-4">
                 <a href="#projects" class="btn btn-primary gap-2">
                     View Projects <i data-lucide="arrow-right" class="w-4 h-4"></i>
                 </a>
                 <a href="https://github.com" target="_blank"
                     class="btn btn-neutral gap-2 border border-white/10 hover:border-white/30">
                     <i data-lucide="github" class="w-4 h-4"></i> GitHub
                 </a>
             </div>
         </div>
         <!-- Hero Visual -->
         <div class="relative hidden md:block group">
             <div
                 class="absolute inset-0 bg-gradient-to-tr from-primary to-purple-500 rounded-2xl rotate-6 opacity-30 group-hover:rotate-12 transition-transform duration-500">
             </div>
             <div
                 class="card bg-base-200 border border-white/10 shadow-2xl skew-y-0 group-hover:-translate-y-2 transition-transform duration-500">
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

 <!-- Skills Section -->
 <section id="skills" class="py-24 px-6 bg-base-200/30">
     <div class="max-w-6xl mx-auto">
         <h2 class="text-3xl md:text-4xl font-heading font-bold mb-12 flex items-center gap-3">
             <i data-lucide="cpu" class="text-primary"></i> Tech Stack
         </h2>
         <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-6">
             <!-- Skill Items -->
             <div
                 class="card bg-base-200 border border-white/5 hover:border-primary/50 transition-colors group cursor-default">
                 <div class="card-body p-6 items-center text-center gap-3">
                     <i data-lucide="layout"
                         class="w-8 h-8 text-base-content/50 group-hover:text-primary transition-colors"></i>
                     <span class="font-medium">Frontend</span>
                 </div>
             </div>
             <div
                 class="card bg-base-200 border border-white/5 hover:border-primary/50 transition-colors group cursor-default">
                 <div class="card-body p-6 items-center text-center gap-3">
                     <i data-lucide="server"
                         class="w-8 h-8 text-base-content/50 group-hover:text-primary transition-colors"></i>
                     <span class="font-medium">Backend</span>
                 </div>
             </div>
             <div
                 class="card bg-base-200 border border-white/5 hover:border-primary/50 transition-colors group cursor-default">
                 <div class="card-body p-6 items-center text-center gap-3">
                     <i data-lucide="database"
                         class="w-8 h-8 text-base-content/50 group-hover:text-primary transition-colors"></i>
                     <span class="font-medium">Database</span>
                 </div>
             </div>
             <div
                 class="card bg-base-200 border border-white/5 hover:border-primary/50 transition-colors group cursor-default">
                 <div class="card-body p-6 items-center text-center gap-3">
                     <i data-lucide="figma"
                         class="w-8 h-8 text-base-content/50 group-hover:text-primary transition-colors"></i>
                     <span class="font-medium">Design</span>
                 </div>
             </div>
         </div>
     </div>
 </section>

 <!-- Projects Section -->
 <section id="projects" class="py-24 px-6">
     <div class="max-w-6xl mx-auto">
         <h2 class="text-3xl md:text-4xl font-heading font-bold mb-12 flex items-center gap-3">
             <i data-lucide="folder-git-2" class="text-primary"></i> Featured Projects
         </h2>
         <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
             <!-- Project Card 1 -->
             <article class="card image-full h-[400px] group overflow-hidden before:!bg-transparent">
                 <figure class="relative w-full h-full">
                     <div
                         class="absolute inset-0 bg-secondary/50 group-hover:scale-105 transition-transform duration-500 z-0 w-full h-full">
                     </div>
                     <div class="absolute inset-0 bg-gradient-to-b from-transparent to-black/90 z-10 w-full h-full">
                     </div>
                 </figure>
                 <div class="card-body justify-end z-20 p-6 relative">
                     <div
                         class="mb-4 transform translate-y-4 opacity-0 group-hover:translate-y-0 group-hover:opacity-100 transition-all duration-300 delay-100">
                         <div
                             class="badge badge-primary badge-outline font-bold uppercase tracking-wider bg-primary/10 border-0">
                             E-Commerce</div>
                     </div>
                     <h3 class="card-title text-2xl font-bold mb-2">ShopMaster Pro</h3>
                     <p
                         class="text-base-content/70 line-clamp-2 mb-4 group-hover:text-base-content transition-colors flex-grow-0">
                         A fully functional e-commerce platform built with Next.js and Stripe integration.
                     </p>
                     <div class="card-actions">
                         <a href="#"
                             class="link link-primary no-underline font-semibold hover:underline inline-flex items-center gap-2">
                             View Case Study <i data-lucide="arrow-up-right" class="w-4 h-4"></i>
                         </a>
                     </div>
                 </div>
             </article>

             <!-- Project Card 2 -->
             <article class="card image-full h-[400px] group overflow-hidden before:!bg-transparent">
                 <figure class="relative w-full h-full">
                     <div
                         class="absolute inset-0 bg-secondary/50 group-hover:scale-105 transition-transform duration-500 z-0 w-full h-full">
                     </div>
                     <div class="absolute inset-0 bg-gradient-to-b from-transparent to-black/90 z-10 w-full h-full">
                     </div>
                 </figure>
                 <div class="card-body justify-end z-20 p-6 relative">
                     <div
                         class="mb-4 transform translate-y-4 opacity-0 group-hover:translate-y-0 group-hover:opacity-100 transition-all duration-300 delay-100">
                         <div
                             class="badge badge-primary badge-outline font-bold uppercase tracking-wider bg-primary/10 border-0">
                             SaaS</div>
                     </div>
                     <h3 class="card-title text-2xl font-bold mb-2">TaskFlow</h3>
                     <p
                         class="text-base-content/70 line-clamp-2 mb-4 group-hover:text-base-content transition-colors flex-grow-0">
                         Project management dashboard for remote teams with real-time updates.
                     </p>
                     <div class="card-actions">
                         <a href="#"
                             class="link link-primary no-underline font-semibold hover:underline inline-flex items-center gap-2">
                             View Case Study <i data-lucide="arrow-up-right" class="w-4 h-4"></i>
                         </a>
                     </div>
                 </div>
             </article>

             <!-- Project Card 3: Date Places Promo -->
             <article
                 class="card image-full h-[400px] group overflow-hidden border border-primary/50 before:!bg-transparent">
                 <figure class="relative w-full h-full">
                     <div
                         class="absolute inset-0 bg-gradient-to-br from-primary/20 to-purple-500/20 group-hover:scale-105 transition-transform duration-500 z-0 w-full h-full">
                     </div>
                     <div class="absolute inset-0 bg-gradient-to-b from-transparent to-black/90 z-10 w-full h-full">
                     </div>
                 </figure>
                 <div class="card-body justify-end z-20 p-6 relative">
                     <div class="mb-4">
                         <div
                             class="badge badge-primary border-0 font-bold text-white bg-gradient-to-r from-primary to-purple-500 animate-pulse">
                             New Feature</div>
                     </div>
                     <h3 class="card-title text-2xl font-bold mb-2">Date Places Finder</h3>
                     <p
                         class="text-base-content/70 line-clamp-2 mb-4 group-hover:text-base-content transition-colors flex-grow-0">
                         Discover the perfect spot for your next date. Filter by mood and category.
                     </p>
                     <div class="card-actions w-full">
                         <a href="date-places.html" class="btn btn-primary w-full">
                             Try It Now
                         </a>
                     </div>
                 </div>
             </article>
         </div>
     </div>
 </section>

 <!-- Contact Section -->
 <section id="contact" class="py-24 px-6 bg-base-200/30">
     <div class="hero-content max-w-4xl mx-auto flex-col text-center w-full">
         <h2 class="text-3xl md:text-4xl font-heading font-bold mb-6">Let's work together</h2>
         <p class="text-base-content/70 mb-12 text-lg">
             Have a project in mind? I'd love to hear about it. Send me a message and I'll get back to you as soon as
             possible.
         </p>

         <form class="card w-full max-w-md mx-auto shadow-2xl bg-base-100">
             <div class="card-body text-left">
                 <div class="form-control">
                     <label class="label">
                         <span class="label-text">Email</span>
                     </label>
                     <input type="email" placeholder="you@example.com" class="input input-bordered" />
                 </div>
                 <div class="form-control">
                     <label class="label">
                         <span class="label-text">Message</span>
                     </label>
                     <textarea class="textarea textarea-bordered h-24" placeholder="Tell me about your project..."></textarea>
                 </div>
                 <div class="form-control mt-6">
                     <button class="btn btn-primary">Send Message</button>
                 </div>
             </div>
         </form>
     </div>
 </section>
