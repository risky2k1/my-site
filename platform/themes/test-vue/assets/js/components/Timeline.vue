<template>
  <div class="min-h-screen bg-gradient-to-b from-primary-50 to-white py-16">
    <div class="container-custom">
      <!-- Header -->
      <div class="text-center mb-16">
        <h1 class="text-4xl md:text-5xl font-bold text-gray-900 mb-4">Our Love Story</h1>
        <p class="text-lg text-gray-600 max-w-2xl mx-auto">
          Hành trình tình yêu của chúng mình qua từng khoảnh khắc đáng nhớ
        </p>
      </div>

      <!-- Timeline -->
      <div class="relative max-w-4xl mx-auto">
        <!-- Center Line -->
        <div class="absolute left-1/2 transform -translate-x-1/2 h-full w-1 bg-primary-200"></div>

        <!-- Timeline Items -->
        <div class="space-y-12">
          <div
            v-for="(item, index) in visibleItems"
            :key="item.id"
            :class="[
              'relative md:w-1/2',
              index % 2 === 0 ? 'md:ml-auto md:pl-12 md:text-left' : 'md:pr-12 md:text-right'
            ]"
            class="timeline-item"
            :data-index="index"
          >
            <!-- Timeline Dot -->
            <div 
              class="absolute top-8 w-6 h-6 bg-primary-600 rounded-full border-4 border-white shadow-lg z-10 transform"
              :class="[
                'left-1/2 -translate-x-1/2', // Mobile: Center
                index % 2 === 0 
                  ? 'md:left-0 md:-translate-x-1/2' // Desktop Right Item: Dot on Left Edge
                  : 'md:left-auto md:right-0 md:translate-x-1/2', // Desktop Left Item: Dot on Right Edge
                { 'animate-pulse': index === visibleItems.length - 1 }
              ]"
            ></div>

            <!-- Content Card -->
            <div 
              :class="[
                'bg-white rounded-xl shadow-lg p-6 transition-all duration-500',
                'hover:shadow-xl hover:scale-105'
              ]"
            >
              <!-- Date Badge -->
              <div 
                :class="[
                  'inline-block px-4 py-2 bg-gradient-to-r from-primary-500 to-primary-600 text-white rounded-full text-sm font-semibold mb-4 shadow-md'
                ]"
              >
                {{ item.date }}
              </div>

              <!-- Title -->
              <h3 class="text-2xl font-bold text-gray-900 mb-3">{{ item.title }}</h3>

              <!-- Description -->
              <p class="text-gray-600 mb-4 leading-relaxed">{{ item.description }}</p>

              <!-- Image Placeholder -->
              <div class="relative h-48 bg-gradient-to-br from-primary-100 to-primary-200 rounded-lg overflow-hidden mb-4">
                <div class="absolute inset-0 flex items-center justify-center">
                  <svg class="w-16 h-16 text-primary-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                  </svg>
                </div>
              </div>

              <!-- Tags -->
              <div class="flex flex-wrap gap-2">
                <span 
                  v-for="tag in item.tags" 
                  :key="tag"
                  class="px-3 py-1 bg-primary-50 text-primary-700 text-sm rounded-full"
                >
                  {{ tag }}
                </span>
              </div>

              <!-- Arrow pointing to timeline -->
              <div 
                :class="[
                  'hidden md:block absolute top-8 w-4 h-4 bg-white transform rotate-45',
                  index % 2 === 0 ? 'left-0 -translate-x-2' : 'right-0 translate-x-2'
                ]"
              ></div>
            </div>
          </div>
        </div>

        <!-- Loading Indicator -->
        <div v-if="loading" class="text-center py-8">
          <div class="inline-block w-12 h-12 border-4 border-primary-200 border-t-primary-600 rounded-full animate-spin"></div>
          <p class="text-gray-600 mt-4">Đang tải thêm kỷ niệm...</p>
        </div>

        <!-- End Message -->
        <div v-if="!hasMore && visibleItems.length > 0" class="relative z-10 text-center py-12 bg-white">
          <div class="inline-block p-4 bg-primary-100 rounded-full mb-4 shadow-sm">
            <svg class="w-8 h-8 text-primary-600" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd"></path>
            </svg>
          </div>
          <p class="text-lg font-semibold text-gray-700">Và câu chuyện vẫn tiếp diễn...</p>
          <p class="text-gray-500 mt-2">Còn nhiều kỷ niệm đẹp đang chờ đợi phía trước</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Timeline',
  data() {
    return {
      visibleItems: [],
      currentPage: 0,
      itemsPerPage: 4,
      loading: false,
      hasMore: true,
      allItems: [
        {
          id: 1,
          date: '14/02/2020',
          title: 'Lần Đầu Gặp Gỡ',
          description: 'Ngày đầu tiên chúng mình gặp nhau tại quán cà phê nhỏ. Một buổi chiều mùa xuân đầy nắng, và từ đó mọi thứ bắt đầu...',
          tags: ['Khởi đầu', 'Đặc biệt']
        },
        {
          id: 2,
          date: '20/03/2020',
          title: 'Buổi Hẹn Đầu Tiên',
          description: 'Chúng mình cùng nhau đi xem phim và ăn tối. Cả hai đều hơi ngại ngùng nhưng rất vui vẻ và thoải mái.',
          tags: ['Hẹn hò', 'Lãng mạn']
        },
        {
          id: 3,
          date: '15/04/2020',
          title: 'Ngày Yêu Nhau',
          description: 'Dưới ánh hoàng hôn bên hồ Gươm, anh đã chính thức tỏ tình với em. Và em đã gật đầu đồng ý!',
          tags: ['Tỏ tình', 'Kỷ niệm', 'Quan trọng']
        },
        {
          id: 4,
          date: '01/06/2020',
          title: 'Chuyến Du Lịch Đầu Tiên',
          description: 'Cùng nhau khám phá Đà Lạt - thành phố ngàn hoa. Những kỷ niệm tuyệt vời bên nhau trong chuyến đi đầu tiên.',
          tags: ['Du lịch', 'Đà Lạt', 'Phiêu lưu']
        },
        {
          id: 5,
          date: '14/08/2020',
          title: 'Kỷ Niệm 100 Ngày',
          description: 'Kỷ niệm 100 ngày yêu nhau với bữa tối lãng mạn tại nhà hàng view sông. Anh đã tặng em một món quà bất ngờ.',
          tags: ['Kỷ niệm', '100 ngày']
        },
        {
          id: 6,
          date: '25/12/2020',
          title: 'Giáng Sinh Đầu Tiên',
          description: 'Giáng sinh ấm áp bên nhau, trang trí cây thông và trao nhau những món quà ý nghĩa.',
          tags: ['Giáng sinh', 'Lễ hội']
        },
        {
          id: 7,
          date: '01/01/2021',
          title: 'Năm Mới Cùng Nhau',
          description: 'Đón năm mới 2021 với những ước mơ và kế hoạch cho tương lai. Hứa hẹn sẽ luôn bên nhau.',
          tags: ['Năm mới', 'Hứa hẹn']
        },
        {
          id: 8,
          date: '14/02/2021',
          title: 'Valentine Đầu Tiên',
          description: 'Ngày Valentine đầu tiên của chúng mình. Anh đã chuẩn bị một bữa tối tự nấu đầy bất ngờ.',
          tags: ['Valentine', 'Lãng mạn']
        },
        {
          id: 9,
          date: '15/04/2021',
          title: 'Kỷ Niệm 1 Năm Yêu',
          description: 'Một năm bên nhau với biết bao kỷ niệm đẹp. Chúng mình đã trưởng thành và hiểu nhau hơn rất nhiều.',
          tags: ['1 năm', 'Kỷ niệm', 'Quan trọng']
        },
        {
          id: 10,
          date: '20/07/2021',
          title: 'Gặp Gỡ Gia Đình',
          description: 'Ngày anh chính thức ra mắt gia đình em. Một bước quan trọng trong mối quan hệ của chúng mình.',
          tags: ['Gia đình', 'Quan trọng']
        },
        {
          id: 11,
          date: '10/10/2021',
          title: 'Chuyến Đi Phú Quốc',
          description: 'Kỳ nghỉ tuyệt vời tại đảo ngọc Phú Quốc. Biển xanh, cát trắng và những khoảnh khắc đáng nhớ.',
          tags: ['Du lịch', 'Biển', 'Phú Quốc']
        },
        {
          id: 12,
          date: '25/12/2021',
          title: 'Giáng Sinh Thứ Hai',
          description: 'Giáng sinh ấm áp hơn khi có nhau. Cùng nhau nướng bánh và trang trí nhà cửa.',
          tags: ['Giáng sinh', 'Ấm áp']
        },
        {
          id: 13,
          date: '14/02/2022',
          title: 'Lời Cầu Hôn',
          description: 'Dưới ánh nến lung linh, anh đã quỳ gối cầu hôn em. Và em đã khóc và nói "Có"!',
          tags: ['Cầu hôn', 'Đặc biệt', 'Quan trọng']
        },
        {
          id: 14,
          date: '15/04/2022',
          title: 'Kỷ Niệm 2 Năm',
          description: 'Hai năm bên nhau, từ người yêu đến vợ chồng tương lai. Hạnh phúc nhất là có em.',
          tags: ['2 năm', 'Kỷ niệm']
        },
        {
          id: 15,
          date: '01/08/2022',
          title: 'Chuẩn Bị Đám Cưới',
          description: 'Bắt đầu chuẩn bị cho ngày trọng đại. Chọn váy cưới, địa điểm và lên kế hoạch cho mọi thứ.',
          tags: ['Đám cưới', 'Chuẩn bị']
        },
        {
          id: 16,
          date: '15/10/2022',
          title: 'Ngày Cưới',
          description: 'Ngày trọng đại nhất trong đời. Chúng mình chính thức trở thành vợ chồng trước sự chứng kiến của gia đình và bạn bè.',
          tags: ['Đám cưới', 'Trọng đại', 'Hạnh phúc']
        }
      ]
    }
  },
  mounted() {
    this.loadMore()
    window.addEventListener('scroll', this.handleScroll)
  },
  beforeUnmount() {
    window.removeEventListener('scroll', this.handleScroll)
  },
  methods: {
    loadMore() {
      if (this.loading || !this.hasMore) return

      this.loading = true

      // Simulate loading delay
      setTimeout(() => {
        const start = this.currentPage * this.itemsPerPage
        const end = start + this.itemsPerPage
        const newItems = this.allItems.slice(start, end)

        this.visibleItems.push(...newItems)
        this.currentPage++

        if (end >= this.allItems.length) {
          this.hasMore = false
        }

        this.loading = false
      }, 800)
    },
    handleScroll() {
      const scrollTop = window.pageYOffset || document.documentElement.scrollTop
      const windowHeight = window.innerHeight
      const documentHeight = document.documentElement.scrollHeight

      // Load more when user scrolls to 80% of the page
      if (scrollTop + windowHeight >= documentHeight * 0.8) {
        this.loadMore()
      }
    }
  }
}
</script>

<style scoped>
.timeline-item {
  opacity: 0;
  animation: fadeInUp 0.6s ease-out forwards;
}

.timeline-item:nth-child(1) { animation-delay: 0.1s; }
.timeline-item:nth-child(2) { animation-delay: 0.2s; }
.timeline-item:nth-child(3) { animation-delay: 0.3s; }
.timeline-item:nth-child(4) { animation-delay: 0.4s; }

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@media (max-width: 768px) {
  .md\:pr-1\/2,
  .md\:pl-1\/2 {
    padding-left: 2rem !important;
    padding-right: 0 !important;
    text-align: left !important;
  }

  .md\:mr-12,
  .md\:ml-12 {
    margin-left: 0 !important;
    margin-right: 0 !important;
  }
}
</style>
