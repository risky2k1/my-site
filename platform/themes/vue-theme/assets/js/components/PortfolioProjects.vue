<template>
    <section id="projects" class="section bg-gray-50">
        <div class="container-custom">
            <h2 class="text-4xl md:text-5xl font-bold text-center text-gray-900 mb-4">My Projects</h2>
            <p class="text-center text-gray-600 mb-12 max-w-2xl mx-auto">
                Here are some of my recent works that showcase my skills and creativity
            </p>

            <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                <div
                    v-for="project in projects"
                    :key="project.id"
                    class="group bg-white rounded-xl overflow-hidden shadow-lg hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-2"
                >
                    <div class="relative overflow-hidden aspect-video bg-gradient-to-br from-primary-100 to-primary-200">
                        <div class="absolute inset-0 flex items-center justify-center">
                            <svg class="w-20 h-20 text-primary-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                            </svg>
                        </div>
                        <div class="absolute inset-0 bg-primary-600 opacity-0 group-hover:opacity-90 transition-opacity duration-300 flex items-center justify-center">
                            <a :href="project.url" class="btn btn-primary transform scale-0 group-hover:scale-100 transition-transform duration-300">
                                View Project
                            </a>
                        </div>
                    </div>

                    <div class="p-6">
                        <h3 class="text-xl font-bold text-gray-900 mb-2">{{ project.title }}</h3>
                        <p class="text-gray-600 mb-4">{{ project.description }}</p>

                        <div class="flex flex-wrap gap-2">
                            <div v-for="tech in project.technologies" :key="tech" class="px-3 py-1 bg-primary-50 text-primary-700 text-sm rounded-full">{{ tech }}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
export default {
    name: 'PortfolioProjects',
    data() {
        return {
            projects: [
                {
                    id: 1,
                    title: 'E-Commerce Platform',
                    description: 'A full-featured online shopping platform with payment integration and admin dashboard.',
                    technologies: ['Vue.js', 'Laravel', 'MySQL'],
                    url: '#'
                },
                {
                    id: 2,
                    title: 'Task Management App',
                    description: 'Collaborative task management tool with real-time updates and team features.',
                    technologies: ['React', 'Node.js', 'MongoDB'],
                    url: '#'
                },
                {
                    id: 3,
                    title: 'Portfolio Website',
                    description: 'Modern portfolio website with smooth animations and responsive design.',
                    technologies: ['Vue.js', 'TailwindCSS'],
                    url: '#'
                },
                {
                    id: 4,
                    title: 'Blog Platform',
                    description: 'Content management system with markdown support and SEO optimization.',
                    technologies: ['PHP', 'Laravel', 'Vue.js'],
                    url: '#'
                },
                {
                    id: 5,
                    title: 'Weather Dashboard',
                    description: 'Real-time weather tracking application with beautiful data visualizations.',
                    technologies: ['JavaScript', 'API Integration'],
                    url: '#'
                },
                {
                    id: 6,
                    title: 'Social Media App',
                    description: 'Social networking platform with messaging and content sharing features.',
                    technologies: ['React', 'Firebase', 'TailwindCSS'],
                    url: '#'
                }
            ]
        }
    }
}
</script>
