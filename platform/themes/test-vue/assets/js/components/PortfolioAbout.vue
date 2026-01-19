<template>
  <section id="about" class="section bg-white">
    <div class="container-custom">
      <div class="max-w-4xl mx-auto">
        <h2 class="text-4xl md:text-5xl font-bold text-center text-gray-900 mb-12">About Me</h2>
        
        <div class="grid md:grid-cols-2 gap-12 items-center">
          <div class="space-y-6">
            <p class="text-lg text-gray-600 leading-relaxed">
              {{ bio }}
            </p>
            <p class="text-lg text-gray-600 leading-relaxed">
              {{ mission }}
            </p>
          </div>
          
          <div class="space-y-6">
            <h3 class="text-2xl font-semibold text-gray-900 mb-4">Skills & Technologies</h3>
            <div class="space-y-4">
              <div v-for="skill in skills" :key="skill.name" class="group">
                <div class="flex justify-between mb-2">
                  <span class="font-medium text-gray-700">{{ skill.name }}</span>
                  <span class="text-primary-600 font-semibold">{{ skill.level }}%</span>
                </div>
                <div class="w-full bg-gray-200 rounded-full h-3 overflow-hidden">
                  <div 
                    class="bg-gradient-to-r from-primary-500 to-primary-600 h-3 rounded-full transition-all duration-1000 ease-out group-hover:scale-105"
                    :style="{ width: skill.level + '%' }"
                  ></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'PortfolioAbout',
  data() {
    return {
      bio: 'I\'m a passionate developer with a love for creating elegant solutions to complex problems. With years of experience in web development, I specialize in building modern, responsive applications.',
      mission: 'My mission is to craft digital experiences that not only look great but also provide real value to users and businesses alike.',
      skills: [
        { name: 'Vue.js / React', level: 90 },
        { name: 'PHP / Laravel', level: 85 },
        { name: 'JavaScript / TypeScript', level: 88 },
        { name: 'TailwindCSS / UI Design', level: 92 },
        { name: 'Database Design', level: 80 }
      ]
    }
  }
}
</script>
