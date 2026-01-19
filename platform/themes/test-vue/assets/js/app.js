import { createApp } from 'vue'
import PortfolioHero from './components/PortfolioHero.vue'
import PortfolioAbout from './components/PortfolioAbout.vue'
import PortfolioProjects from './components/PortfolioProjects.vue'
import PortfolioContact from './components/PortfolioContact.vue'
import DateIdea from './components/DateIdea.vue'
import Timeline from './components/Timeline.vue'

// Initialize Vue app
const app = createApp({})

// Register components globally
app.component('portfolio-hero', PortfolioHero)
app.component('portfolio-about', PortfolioAbout)
app.component('portfolio-projects', PortfolioProjects)
app.component('portfolio-contact', PortfolioContact)
app.component('date-idea', DateIdea)
app.component('timeline', Timeline)

// Mount the app
app.mount('#app')
