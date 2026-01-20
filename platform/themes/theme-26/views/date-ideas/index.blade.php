<div class="min-h-screen bg-gray-50 py-16">
    <div class="container-custom">
        <!-- Header -->
        <div class="text-center mb-12">
            <h1 class="text-4xl md:text-5xl font-bold text-gray-900 mb-4">Date Ideas</h1>
            <p class="text-lg text-gray-600 max-w-2xl mx-auto mb-6">
                Khám phá những địa điểm tuyệt vời cho buổi hẹn hò của bạn
            </p>

            <!-- Layout Toggle Buttons -->
            <div class="flex justify-center gap-4 mt-4">
                <button
                    @click="isVertical = true"
                    :class="['px-4 py-2 rounded-lg flex items-center gap-2 transition-all', isVertical ? 'bg-primary-600 text-white shadow-lg' : 'bg-white text-gray-600 hover:bg-gray-100']"
                >
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M9 17V7m0 10a2 2 0 01-2 2H5a2 2 0 01-2-2V7a2 2 0 012-2h2a2 2 0 012 2m0 10a2 2 0 002 2h2a2 2 0 002-2V7a2 2 0 00-2-2h-2a2 2 0 00-2 2"/>
                    </svg>
                    Vertical
                </button>
                <button
                    @click="isVertical = false"
                    :class="['px-4 py-2 rounded-lg flex items-center gap-2 transition-all', !isVertical ? 'bg-primary-600 text-white shadow-lg' : 'bg-white text-gray-600 hover:bg-gray-100']"
                >
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"/>
                    </svg>
                    Horizontal
                </button>
            </div>
        </div>

        <!-- Filters & Random Button -->
        <div :class="{'grid md:grid-cols-4 gap-8': isVertical}">
            <!-- Filters & Random Button -->
            <div :class="['bg-white rounded-xl shadow-md p-6 mb-8',isVertical ? 'md:col-span-1 mb-0 h-fit sticky top-4' : '']">
                <div :class="['gap-4',isVertical ? 'flex flex-col' : 'grid md:grid-cols-4']">
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
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"></path>
                            </svg>
                            Random
                        </button>
                    </div>
                </div>

                <!-- Active Filters Count -->
                <div v-if="activeFiltersCount > 0" class="mt-4 flex items-center gap-2">
                    <span class="text-sm text-gray-600">123 kết quả</span>
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
                  Random type
                </span>
                            <span class="px-3 py-1 bg-white text-gray-700 text-sm rounded-full">
                  Random type
                </span>
                        </div>
                        <h4 class="text-xl font-bold text-gray-900 mb-2">name</h4>
                        <p class="text-gray-700 mb-3">Des</p>
                        <div class="flex items-center justify-between text-sm">
                            <span class="text-gray-600">Address</span>
                            <span class="font-semibold text-primary-700">Price</span>
                        </div>
                    </div>

                    <button @click="randomResult = null" class="w-full btn btn-primary">
                        Đóng
                    </button>
                </div>
            </div>

            <!-- Ideas Grid -->
            <div :class="['grid gap-6',isVertical ? 'md:col-span-3 grid-cols-1 md:grid-cols-2' : 'md:grid-cols-2 lg:grid-cols-3']">
                <div
                    v-for="idea in ideas"
                    :key="idea.id"
                    class="bg-white rounded-xl shadow-md overflow-hidden hover:shadow-xl transition-all duration-300 transform hover:-translate-y-1"
                >
                    <!-- Image -->
                    <div class="relative h-48 bg-gradient-to-br from-primary-100 to-primary-200">
                        <div class="absolute inset-0 flex items-center justify-center">
                            <svg class="w-16 h-16 text-primary-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                      d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                            </svg>
                        </div>
                        <div class="absolute top-4 left-4">
                            <div
                                v-if="idea.categories && idea.categories.length"
                                class="px-3 py-1 bg-white text-primary-700 text-sm rounded-full font-medium shadow-md">
                                Name
                            </div>
                        </div>
                    </div>

                    <!-- Content -->
                    <div class="p-6">
                        <h3 class="text-xl font-bold text-gray-900 mb-2">Name</h3>
                        <p class="text-gray-600 mb-4 line-clamp-2">Des</p>

                        <div class="space-y-2 mb-4">
                            <div class="flex items-center text-sm text-gray-600">
                                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                                </svg>
                                Address
                            </div>
                            <div class="flex items-center text-sm text-gray-600">
                                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                          d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                </svg>
                       Price
                            </div>
                        </div>

                        <div class="flex flex-wrap gap-2">
                            <div
                                v-for="mood in idea.moods"
                                :key="mood"
                                class="px-2 py-1 bg-gray-100 text-gray-700 text-xs rounded-full"
                            >
                               name
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Empty State within Layout -->
                <div v-if="!loading && ideas.length === 0" class="col-span-full text-center py-16">
                    <svg class="w-24 h-24 text-gray-300 mx-auto mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.172 16.172a4 4 0 015.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                    <h3 class="text-xl font-semibold text-gray-700 mb-2">Không tìm thấy kết quả</h3>
                    <p class="text-gray-500 mb-4">Thử thay đổi bộ lọc hoặc nhấn nút Random</p>
                    <button @click="clearFilters" class="btn btn-primary">
                        Xóa bộ lọc
                    </button>
                </div>

                <!-- Loading State -->
                <div v-if="loading" class="col-span-full flex justify-center py-8">
                    <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600"></div>
                </div>

                <!-- Load More -->
                <div v-if="hasMore && !loading" class="col-span-full flex justify-center mt-8">
                    <button @click="loadMore" class="btn btn-outline flex items-center gap-2">
                        Xem thêm
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
                        </svg>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
