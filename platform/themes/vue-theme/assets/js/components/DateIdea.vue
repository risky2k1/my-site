<template>
  <div class="min-h-screen bg-gray-50 py-16">
    <div class="container-custom">
      <!-- Header -->
      <div class="text-center mb-12">
        <h1 class="text-4xl md:text-5xl font-bold text-gray-900 mb-4">Date Ideas</h1>
        <p class="text-lg text-gray-600 max-w-2xl mx-auto">
          Khám phá những địa điểm tuyệt vời cho buổi hẹn hò của bạn
        </p>
      </div>

      <!-- Filters & Random Button -->
      <div :class="{'grid md:grid-cols-4 gap-8': isVertical}">
        <!-- Filters & Random Button -->
        <div :class="[
          'bg-white rounded-xl shadow-md p-6 mb-8',
          isVertical ? 'md:col-span-1 mb-0 h-fit sticky top-4' : ''
        ]">
          <div :class="[
            'gap-4',
            isVertical ? 'flex flex-col' : 'grid md:grid-cols-4'
          ]">
            <!-- Type Filter -->
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-2">Loại địa điểm</label>
              <select v-model="filters.type" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent">
                <option value="">Tất cả</option>
                <option value="restaurant">Nhà hàng</option>
                <option value="cafe">Quán cà phê</option>
                <option value="homestay">Homestay</option>
                <option value="activity">Hoạt động</option>
              </select>
            </div>

            <!-- Price Filter -->
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-2">Mức giá</label>
              <select v-model="filters.price" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent">
                <option value="">Tất cả</option>
                <option value="budget">Tiết kiệm (< 200k)</option>
                <option value="medium">Trung bình (200k - 500k)</option>
                <option value="premium">Cao cấp (> 500k)</option>
              </select>
            </div>

            <!-- Location Filter -->
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-2">Khu vực</label>
              <select v-model="filters.location" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-transparent">
                <option value="">Tất cả</option>
                <option value="hanoi">Hà Nội</option>
                <option value="hcm">TP. Hồ Chí Minh</option>
                <option value="danang">Đà Nẵng</option>
                <option value="dalat">Đà Lạt</option>
              </select>
            </div>

            <!-- Random Button -->
            <div class="flex items-end">
              <button @click="randomPick" class="w-full btn btn-primary flex items-center justify-center gap-2">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"></path>
                </svg>
                Random
              </button>
            </div>
          </div>

          <!-- Active Filters Count -->
          <div v-if="activeFiltersCount > 0" class="mt-4 flex items-center gap-2">
            <span class="text-sm text-gray-600">{{ filteredIdeas.length }} kết quả</span>
            <button @click="clearFilters" class="text-sm text-primary-600 hover:text-primary-700">
              Xóa bộ lọc
            </button>
          </div>
        </div>

        <!-- Random Result Modal -->
        <div v-if="randomResult" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4" @click="randomResult = null">
          <div class="bg-white rounded-2xl p-8 max-w-md w-full transform scale-100 animate-bounce-in" @click.stop>
            <div class="text-center mb-6">
              <div class="w-16 h-16 bg-primary-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <svg class="w-8 h-8 text-primary-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                </svg>
              </div>
              <h3 class="text-2xl font-bold text-gray-900 mb-2">Gợi ý cho bạn!</h3>
              <p class="text-gray-600">Hãy thử địa điểm này nhé</p>
            </div>
            
            <div class="bg-gradient-to-br from-primary-50 to-primary-100 rounded-xl p-6 mb-6">
              <div class="flex items-start gap-3 mb-3">
                <span class="px-3 py-1 bg-white text-primary-700 text-sm rounded-full font-medium">
                  {{ getTypeLabel(randomResult.type) }}
                </span>
                <span class="px-3 py-1 bg-white text-gray-700 text-sm rounded-full">
                  {{ randomResult.location }}
                </span>
              </div>
              <h4 class="text-xl font-bold text-gray-900 mb-2">{{ randomResult.name }}</h4>
              <p class="text-gray-700 mb-3">{{ randomResult.description }}</p>
              <div class="flex items-center justify-between text-sm">
                <span class="text-gray-600">{{ randomResult.address }}</span>
                <span class="font-semibold text-primary-700">{{ randomResult.priceRange }}</span>
              </div>
            </div>

            <button @click="randomResult = null" class="w-full btn btn-primary">
              Đóng
            </button>
          </div>
        </div>

        <!-- Ideas Grid -->
        <div :class="[
          'grid gap-6',
          isVertical ? 'md:col-span-3 grid-cols-1 md:grid-cols-2' : 'md:grid-cols-2 lg:grid-cols-3'
        ]">
          <div 
            v-for="idea in filteredIdeas" 
            :key="idea.id"
            class="bg-white rounded-xl shadow-md overflow-hidden hover:shadow-xl transition-all duration-300 transform hover:-translate-y-1"
          >
            <!-- Image -->
            <div class="relative h-48 bg-gradient-to-br from-primary-100 to-primary-200">
              <div class="absolute inset-0 flex items-center justify-center">
                <svg class="w-16 h-16 text-primary-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                </svg>
              </div>
              <div class="absolute top-4 left-4">
                <span class="px-3 py-1 bg-white text-primary-700 text-sm rounded-full font-medium shadow-md">
                  {{ getTypeLabel(idea.type) }}
                </span>
              </div>
            </div>

            <!-- Content -->
            <div class="p-6">
              <h3 class="text-xl font-bold text-gray-900 mb-2">{{ idea.name }}</h3>
              <p class="text-gray-600 mb-4 line-clamp-2">{{ idea.description }}</p>
              
              <div class="space-y-2 mb-4">
                <div class="flex items-center text-sm text-gray-600">
                  <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                  </svg>
                  {{ idea.address }}
                </div>
                <div class="flex items-center text-sm text-gray-600">
                  <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                  </svg>
                  {{ idea.priceRange }}
                </div>
              </div>

              <div class="flex flex-wrap gap-2">
                <span 
                  v-for="tag in idea.tags" 
                  :key="tag"
                  class="px-2 py-1 bg-gray-100 text-gray-700 text-xs rounded-full"
                >
                  {{ tag }}
                </span>
              </div>
            </div>
          </div>
          
          <!-- Empty State within Layout -->
          <div v-if="filteredIdeas.length === 0" class="col-span-full text-center py-16">
            <svg class="w-24 h-24 text-gray-300 mx-auto mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.172 16.172a4 4 0 015.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
            </svg>
            <h3 class="text-xl font-semibold text-gray-700 mb-2">Không tìm thấy kết quả</h3>
            <p class="text-gray-500 mb-4">Thử thay đổi bộ lọc hoặc nhấn nút Random</p>
            <button @click="clearFilters" class="btn btn-primary">
              Xóa bộ lọc
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'DateIdea',
  data() {
    return {
      filters: {
        type: '',
        price: '',
        location: ''
      },
      isVertical: true,
      randomResult: null,
      ideas: [
        {
          id: 1,
          name: 'The Coffee House',
          type: 'cafe',
          location: 'Hà Nội',
          address: '86 Trần Quang Khải, Hoàn Kiếm',
          priceRange: '50k - 150k',
          price: 'budget',
          description: 'Quán cà phê yên tĩnh với không gian ấm cúng, phù hợp cho những buổi hẹn hò lãng mạn.',
          tags: ['Wifi', 'Yên tĩnh', 'View đẹp']
        },
        {
          id: 2,
          name: 'Nhà hàng Ngon',
          type: 'restaurant',
          location: 'Hà Nội',
          address: '79 Phan Bội Châu, Hoàn Kiếm',
          priceRange: '200k - 400k',
          price: 'medium',
          description: 'Nhà hàng phục vụ các món ăn truyền thống Việt Nam trong không gian vườn xanh mát.',
          tags: ['Món Việt', 'Không gian đẹp', 'Phục vụ tốt']
        },
        {
          id: 3,
          name: 'Dalat Homestay',
          type: 'homestay',
          location: 'Đà Lạt',
          address: 'Đường Trần Phú, Phường 4',
          priceRange: '500k - 800k/đêm',
          price: 'medium',
          description: 'Homestay view thung lũng, không gian lãng mạn giữa thiên nhiên Đà Lạt.',
          tags: ['View núi', 'Romantic', 'Bữa sáng']
        },
        {
          id: 4,
          name: 'Rạp CGV',
          type: 'activity',
          location: 'TP. Hồ Chí Minh',
          address: 'Vincom Center, Quận 1',
          priceRange: '100k - 200k',
          price: 'budget',
          description: 'Rạp chiếu phim hiện đại với công nghệ âm thanh và hình ảnh tốt nhất.',
          tags: ['Phim mới', 'Ghế đôi', 'Popcorn']
        },
        {
          id: 5,
          name: 'Highlands Coffee Rooftop',
          type: 'cafe',
          location: 'TP. Hồ Chí Minh',
          address: 'Lầu 5, Bitexco, Quận 1',
          priceRange: '80k - 200k',
          price: 'budget',
          description: 'Quán cà phê trên cao với view toàn cảnh thành phố, lý tưởng cho buổi tối.',
          tags: ['View thành phố', 'Rooftop', 'Sunset']
        },
        {
          id: 6,
          name: 'Nhà hàng Hải Sản Biển Đông',
          type: 'restaurant',
          location: 'Đà Nẵng',
          address: 'Đường Võ Nguyên Giáp, Sơn Trà',
          priceRange: '300k - 600k',
          price: 'medium',
          description: 'Nhà hàng hải sản tươi sống với view biển tuyệt đẹp.',
          tags: ['Hải sản', 'View biển', 'Tươi sống']
        },
        {
          id: 7,
          name: 'Vườn Dâu Đà Lạt',
          type: 'activity',
          location: 'Đà Lạt',
          address: 'Xã Xuân Thọ, Đà Lạt',
          priceRange: '50k - 100k',
          price: 'budget',
          description: 'Trải nghiệm hái dâu tươi trong vườn, chụp ảnh check-in đẹp.',
          tags: ['Trải nghiệm', 'Check-in', 'Thiên nhiên']
        },
        {
          id: 8,
          name: 'Ana Mandara Resort',
          type: 'homestay',
          location: 'Đà Nẵng',
          address: 'Đường Trần Hưng Đạo, Sơn Trà',
          priceRange: '2tr - 5tr/đêm',
          price: 'premium',
          description: 'Resort 5 sao bên bờ biển với dịch vụ đẳng cấp quốc tế.',
          tags: ['5 sao', 'Spa', 'Bãi biển riêng']
        },
        {
          id: 9,
          name: 'Quán Ăn Vặt 37',
          type: 'restaurant',
          location: 'Hà Nội',
          address: '37 Nguyễn Hữu Huân, Hoàn Kiếm',
          priceRange: '100k - 200k',
          price: 'budget',
          description: 'Quán ăn vặt phong cách Hà Nội xưa với nhiều món ngon.',
          tags: ['Ăn vặt', 'Giá rẻ', 'Đông khách']
        },
        {
          id: 10,
          name: 'Cầu Rồng Show',
          type: 'activity',
          location: 'Đà Nẵng',
          address: 'Cầu Rồng, Sông Hàn',
          priceRange: 'Miễn phí',
          price: 'budget',
          description: 'Xem cầu Rồng phun lửa và nước vào cuối tuần, trải nghiệm độc đáo.',
          tags: ['Miễn phí', 'Cuối tuần', 'Đặc sắc']
        },
        {
          id: 11,
          name: 'Terrace Cafe & Restaurant',
          type: 'cafe',
          location: 'Đà Lạt',
          address: 'Đường Trần Phú, Phường 3',
          priceRange: '100k - 250k',
          price: 'medium',
          description: 'Quán cà phê với view hồ Xuân Hương, không gian lãng mạn.',
          tags: ['View hồ', 'Romantic', 'Sân thượng']
        },
        {
          id: 12,
          name: 'Nhà hàng Hương Sen',
          type: 'restaurant',
          location: 'TP. Hồ Chí Minh',
          address: 'Đường Nguyễn Huệ, Quận 1',
          priceRange: '400k - 800k',
          price: 'premium',
          description: 'Nhà hàng cao cấp phục vụ ẩm thực Á - Âu trong không gian sang trọng.',
          tags: ['Cao cấp', 'Á - Âu', 'Sang trọng']
        }
      ]
    }
  },
  computed: {
    filteredIdeas() {
      return this.ideas.filter(idea => {
        const typeMatch = !this.filters.type || idea.type === this.filters.type
        const priceMatch = !this.filters.price || idea.price === this.filters.price
        const locationMatch = !this.filters.location || idea.location === this.filters.location
        return typeMatch && priceMatch && locationMatch
      })
    },
    activeFiltersCount() {
      return Object.values(this.filters).filter(v => v !== '').length
    }
  },
  methods: {
    getTypeLabel(type) {
      const labels = {
        restaurant: 'Nhà hàng',
        cafe: 'Quán cà phê',
        homestay: 'Homestay',
        activity: 'Hoạt động'
      }
      return labels[type] || type
    },
    randomPick() {
      const available = this.filteredIdeas.length > 0 ? this.filteredIdeas : this.ideas
      const randomIndex = Math.floor(Math.random() * available.length)
      this.randomResult = available[randomIndex]
    },
    clearFilters() {
      this.filters = {
        type: '',
        price: '',
        location: ''
      }
    }
  }
}
</script>

<style scoped>
.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

@keyframes bounce-in {
  0% {
    transform: scale(0.3);
    opacity: 0;
  }
  50% {
    transform: scale(1.05);
  }
  70% {
    transform: scale(0.9);
  }
  100% {
    transform: scale(1);
    opacity: 1;
  }
}

.animate-bounce-in {
  animation: bounce-in 0.5s ease-out;
}
</style>
