

<main class="max-w-7xl mx-auto px-6 pb-24 w-full flex flex-col lg:flex-row gap-8">
    <!-- Sidebar Filters -->
    <aside class="w-full lg:w-1/4 flex-shrink-0">
        <div class="card bg-base-200 border border-white/10 sticky top-24">
            <div class="card-body p-6">
                <div class="flex justify-between items-center mb-6">
                    <h3 class="font-heading font-bold text-lg">Filters</h3>
                    <button class="link link-primary no-underline hover:underline text-sm">Reset</button>
                </div>

                <!-- Categories -->
                <div class="mb-6 form-control">
                    <h4 class="font-medium mb-3 text-sm uppercase tracking-wide text-base-content/50">Categories</h4>
                    <div class="space-y-2">
                        <label class="label cursor-pointer justify-start gap-3 p-0">
                            <input type="checkbox"
                                class="checkbox checkbox-sm checkbox-primary rounded border-white/20" />
                            <span class="label-text">Restaurant</span>
                        </label>
                        <label class="label cursor-pointer justify-start gap-3 p-0">
                            <input type="checkbox"
                                class="checkbox checkbox-sm checkbox-primary rounded border-white/20" />
                            <span class="label-text">Coffee Shop</span>
                        </label>
                        <label class="label cursor-pointer justify-start gap-3 p-0">
                            <input type="checkbox"
                                class="checkbox checkbox-sm checkbox-primary rounded border-white/20" />
                            <span class="label-text">Homestay</span>
                        </label>
                        <label class="label cursor-pointer justify-start gap-3 p-0">
                            <input type="checkbox"
                                class="checkbox checkbox-sm checkbox-primary rounded border-white/20" />
                            <span class="label-text">Hotel</span>
                        </label>
                    </div>
                </div>

                <!-- Moods -->
                <div class="mb-6 form-control">
                    <h4 class="font-medium mb-3 text-sm uppercase tracking-wide text-base-content/50">Moods</h4>
                    <div class="space-y-2">
                        <label class="label cursor-pointer justify-start gap-3 p-0">
                            <input type="checkbox"
                                class="checkbox checkbox-sm checkbox-primary rounded border-white/20" />
                            <span class="label-text">Romantic</span>
                        </label>
                        <label class="label cursor-pointer justify-start gap-3 p-0">
                            <input type="checkbox"
                                class="checkbox checkbox-sm checkbox-primary rounded border-white/20" />
                            <span class="label-text">Chill</span>
                        </label>
                        <label class="label cursor-pointer justify-start gap-3 p-0">
                            <input type="checkbox"
                                class="checkbox checkbox-sm checkbox-primary rounded border-white/20" />
                            <span class="label-text">Luxury</span>
                        </label>
                    </div>
                </div>

                <!-- Price -->
                <div class="mb-6 form-control">
                    <h4 class="font-medium mb-3 text-sm uppercase tracking-wide text-base-content/50">Price</h4>
                    <div class="space-y-2">
                        <label class="label cursor-pointer justify-start gap-3 p-0">
                            <input type="checkbox"
                                class="checkbox checkbox-sm checkbox-primary rounded border-white/20" />
                            <span class="label-text">Low ($)</span>
                        </label>
                        <label class="label cursor-pointer justify-start gap-3 p-0">
                            <input type="checkbox"
                                class="checkbox checkbox-sm checkbox-primary rounded border-white/20" />
                            <span class="label-text">Medium ($$)</span>
                        </label>
                        <label class="label cursor-pointer justify-start gap-3 p-0">
                            <input type="checkbox"
                                class="checkbox checkbox-sm checkbox-primary rounded border-white/20" />
                            <span class="label-text">High ($$$)</span>
                        </label>
                    </div>
                </div>

                <!-- Rating -->
                <div class="mb-6 form-control">
                    <h4 class="font-medium mb-3 text-sm uppercase tracking-wide text-base-content/50">Rating</h4>
                    <div class="space-y-2">
                        <label class="label cursor-pointer justify-start gap-3 p-0">
                            <input type="checkbox"
                                class="checkbox checkbox-sm checkbox-primary rounded border-white/20" />
                            <div class="rating rating-xs disabled pointer-events-none">
                                <input type="radio" name="rating-1" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-1" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-1" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-1" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-1" class="mask mask-star-2 bg-orange-400" checked />
                            </div>
                            <span class="label-text ml-1">5 Stars</span>
                        </label>
                        <label class="label cursor-pointer justify-start gap-3 p-0">
                            <input type="checkbox"
                                class="checkbox checkbox-sm checkbox-primary rounded border-white/20" />
                            <div class="rating rating-xs disabled pointer-events-none">
                                <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400"
                                    checked />
                                <input type="radio" name="rating-2" class="mask mask-star-2 bg-white/20" />
                            </div>
                            <span class="label-text ml-1">4 Stars & up</span>
                        </label>
                        <label class="label cursor-pointer justify-start gap-3 p-0">
                            <input type="checkbox"
                                class="checkbox checkbox-sm checkbox-primary rounded border-white/20" />
                            <div class="rating rating-xs disabled pointer-events-none">
                                <input type="radio" name="rating-3" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-3" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-3" class="mask mask-star-2 bg-orange-400"
                                    checked />
                                <input type="radio" name="rating-3" class="mask mask-star-2 bg-white/20" />
                                <input type="radio" name="rating-3" class="mask mask-star-2 bg-white/20" />
                            </div>
                            <span class="label-text ml-1">3 Stars & up</span>
                        </label>
                    </div>
                </div>

                <!-- Region -->
                <div class="mb-6 form-control">
                    <h4 class="font-medium mb-3 text-sm uppercase tracking-wide text-base-content/50">Region</h4>
                    <div class="space-y-2">
                        <label class="label cursor-pointer justify-start gap-3 p-0">
                            <input type="radio" name="region"
                                class="radio radio-sm radio-primary border-white/20" />
                            <span class="label-text">North</span>
                        </label>
                        <label class="label cursor-pointer justify-start gap-3 p-0">
                            <input type="radio" name="region"
                                class="radio radio-sm radio-primary border-white/20" />
                            <span class="label-text">Central</span>
                        </label>
                        <label class="label cursor-pointer justify-start gap-3 p-0">
                            <input type="radio" name="region"
                                class="radio radio-sm radio-primary border-white/20" />
                            <span class="label-text">South</span>
                        </label>
                    </div>
                </div>

                <!-- City -->
                <div class="form-control">
                    <h4 class="font-medium mb-3 text-sm uppercase tracking-wide text-base-content/50">City</h4>
                    <select class="select select-bordered select-sm w-full bg-base-100 border-white/10">
                        <option>All Cities</option>
                        <option>Hanoi</option>
                        <option>Da Nang</option>
                        <option>Ho Chi Minh City</option>
                    </select>
                </div>
            </div>
        </div>
    </aside>

    <!-- Main Grid & Controls -->
    <div class="flex-grow">
        <!-- Top Controls -->
        <div class="flex flex-col sm:flex-row justify-between items-center gap-4 mb-8">
            <p class="text-base-content/70 text-sm">Showing <span class="text-white font-bold">12</span> of <span
                    class="text-white font-bold">45</span> places</p>
            <button id="random-btn" class="btn btn-primary gap-2 group animate-bounce-slow">
                <i data-lucide="shuffle" class="w-4 h-4 group-hover:rotate-180 transition-transform duration-500"></i>
                Random Pick
            </button>
        </div>

        <!-- Grid -->
        <div id="places-grid" class="grid md:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 gap-6 mb-12">
            <!-- Place 1 -->
            <article class="card group overflow-hidden p-0 bg-base-200 border-white/5 hover:border-primary/50">
                <div class="aspect-video w-full overflow-hidden relative">
                    <img src="https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=800&q=80"
                        alt="Skyline Lounge"
                        class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110">
                    <div
                        class="absolute top-2 right-2 bg-black/60 backdrop-blur-md px-2 py-1 rounded text-xs font-bold text-white border border-white/10">
                        Restaurant
                    </div>
                </div>
                <div class="card-body p-6">
                    <h3 class="card-title text-xl font-bold mb-1 group-hover:text-primary transition-colors">Skyline
                        Lounge</h3>
                    <div class="flex items-center gap-1 text-base-content/70 text-sm mb-3">
                        <i data-lucide="map-pin" class="w-3 h-3"></i> District 1, HCMC
                    </div>
                    <p class="text-base-content/70 text-sm line-clamp-2 mb-4">A rooftop restaurant with panoramic views
                        of the city. Perfect for a romantic dinner under the stars.</p>
                    <div class="card-actions">
                        <button onclick="place_modal_1.showModal()"
                            class="link link-primary no-underline font-semibold hover:underline inline-flex items-center gap-1">
                            View Details <i data-lucide="arrow-right" class="w-3 h-3"></i>
                        </button>
                    </div>
                </div>
            </article>

            <!-- Place 2 -->
            <article class="card group overflow-hidden p-0 bg-base-200 border-white/5 hover:border-primary/50">
                <div class="aspect-video w-full overflow-hidden relative">
                    <img src="https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=800&q=80"
                        alt="Cozy Corner Homestay"
                        class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110">
                    <div
                        class="absolute top-2 right-2 bg-black/60 backdrop-blur-md px-2 py-1 rounded text-xs font-bold text-white border border-white/10">
                        Homestay
                    </div>
                </div>
                <div class="card-body p-6">
                    <h3 class="card-title text-xl font-bold mb-1 group-hover:text-primary transition-colors">Cozy
                        Corner Homestay</h3>
                    <div class="flex items-center gap-1 text-base-content/70 text-sm mb-3">
                        <i data-lucide="map-pin" class="w-3 h-3"></i> Dalat City
                    </div>
                    <p class="text-base-content/70 text-sm line-clamp-2 mb-4">A hidden gem in the heart of the city,
                        offering a quiet escape with vintage decor.</p>
                    <div class="card-actions">
                        <button onclick="place_modal_2.showModal()"
                            class="link link-primary no-underline font-semibold hover:underline inline-flex items-center gap-1">
                            View Details <i data-lucide="arrow-right" class="w-3 h-3"></i>
                        </button>
                    </div>
                </div>
            </article>

            <!-- Place 3 -->
            <article class="card group overflow-hidden p-0 bg-base-200 border-white/5 hover:border-primary/50">
                <div class="aspect-video w-full overflow-hidden relative">
                    <img src="https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80"
                        alt="The Grand Hotel"
                        class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110">
                    <div
                        class="absolute top-2 right-2 bg-black/60 backdrop-blur-md px-2 py-1 rounded text-xs font-bold text-white border border-white/10">
                        Hotel
                    </div>
                </div>
                <div class="card-body p-6">
                    <h3 class="card-title text-xl font-bold mb-1 group-hover:text-primary transition-colors">The Grand
                        Hotel</h3>
                    <div class="flex items-center gap-1 text-base-content/70 text-sm mb-3">
                        <i data-lucide="map-pin" class="w-3 h-3"></i> Nha Trang
                    </div>
                    <p class="text-base-content/70 text-sm line-clamp-2 mb-4">Luxury accommodation with 5-star
                        amenities and service. Treat yourself to a lavish weekend.</p>
                    <div class="card-actions">
                        <button onclick="place_modal_3.showModal()"
                            class="link link-primary no-underline font-semibold hover:underline inline-flex items-center gap-1">
                            View Details <i data-lucide="arrow-right" class="w-3 h-3"></i>
                        </button>
                    </div>
                </div>
            </article>
        </div>

        <!-- Laravel Compatible Pagination -->
        <nav role="navigation" aria-label="Pagination"
            class="flex items-center justify-between border-t border-white/10 pt-4">
            <div class="flex justify-between flex-1 sm:hidden">
                <button class="join-item btn btn-outline btn-sm">Previous</button>
                <button class="join-item btn btn-outline btn-sm">Next</button>
            </div>
            <div class="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
                <div>
                    <p class="text-sm text-base-content/70">
                        Showing
                        <span class="font-medium text-white">1</span>
                        to
                        <span class="font-medium text-white">3</span>
                        of
                        <span class="font-medium text-white">3</span>
                        results
                    </p>
                </div>
                <div>
                    <div class="join">
                        <button
                            class="join-item btn btn-sm btn-outline border-white/10 text-base-content/70 hover:bg-white/5 hover:text-white"
                            aria-label="&laquo; Previous">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd"
                                    d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
                                    clip-rule="evenodd" />
                            </svg>
                        </button>

                        <button class="join-item btn btn-sm btn-active btn-primary">1</button>

                        <button
                            class="join-item btn btn-sm btn-outline border-white/10 text-base-content/70 hover:bg-white/5 hover:text-white"
                            aria-label="Next &raquo;">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd"
                                    d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                                    clip-rule="evenodd" />
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
        </nav>

    </div>
</main>

<!-- Detailed Modals with Static Content -->

<!-- Modal for Place 1 -->
<dialog id="place_modal_1" class="modal">
    <div
        class="modal-box w-11/12 max-w-6xl h-[85vh] p-0 rounded-2xl bg-base-200 border border-white/10 overscroll-none flex flex-col">
        <form method="dialog" class="absolute right-4 top-4 z-30">
            <button
                class="btn btn-sm btn-circle btn-ghost bg-black/50 hover:bg-black/80 text-white border-0">✕</button>
        </form>

        <div class="flex-1 flex flex-col overflow-hidden">
            <!-- Carousel -->
            <div class="carousel w-full h-64 md:h-80 bg-secondary">
                <div id="slide1-1" class="carousel-item relative w-full">
                    <img src="https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=800&q=80"
                        class="w-full h-full object-cover" />
                    <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
                        <a href="#slide1-3" class="btn btn-circle btn-sm bg-black/50 border-0 text-white">❮</a>
                        <a href="#slide1-2" class="btn btn-circle btn-sm bg-black/50 border-0 text-white">❯</a>
                    </div>
                </div>
                <div id="slide1-2" class="carousel-item relative w-full">
                    <img src="https://images.unsplash.com/photo-1559339352-11d035aa65de?w=800&q=80"
                        class="w-full h-full object-cover" />
                    <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
                        <a href="#slide1-1" class="btn btn-circle btn-sm bg-black/50 border-0 text-white">❮</a>
                        <a href="#slide1-3" class="btn btn-circle btn-sm bg-black/50 border-0 text-white">❯</a>
                    </div>
                </div>
                <div id="slide1-3" class="carousel-item relative w-full">
                    <img src="https://images.unsplash.com/photo-1550966871-3ed3c47e2ce2?w=800&q=80"
                        class="w-full h-full object-cover" />
                    <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
                        <a href="#slide1-2" class="btn btn-circle btn-sm bg-black/50 border-0 text-white">❮</a>
                        <a href="#slide1-1" class="btn btn-circle btn-sm bg-black/50 border-0 text-white">❯</a>
                    </div>
                </div>
            </div>

            <!-- CSS Tabs -->
            <div role="tablist" class="tabs tabs-bordered bg-base-200 z-10 w-full grid grid-cols-2">
                <input type="radio" name="tabs_place_1" role="tab"
                    class="tab w-full h-auto py-4 text-sm font-bold active-tab-text"
                    aria-label="Information & Reviews" checked />
                <div role="tabpanel"
                    class="tab-content bg-base-200 p-6 md:p-8 h-full overflow-y-auto custom-scrollbar border-t-base-300">
                    <div class="max-w-4xl mx-auto">
                        <div class="flex items-center justify-between mb-4">
                            <div
                                class="badge badge-primary badge-outline font-bold uppercase tracking-wider bg-primary/10 border-0">
                                Restaurant</div>
                            <div class="rating rating-sm disabled pointer-events-none">
                                <input type="radio" name="rating-1-modal" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-1-modal" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-1-modal" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-1-modal" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-1-modal" class="mask mask-star-2 bg-orange-400"
                                    checked />
                                <span class="text-base-content/70 ml-2 text-xs self-center">(128 reviews)</span>
                            </div>
                        </div>

                        <h2 class="text-3xl font-heading font-bold mb-2">Skyline Lounge</h2>
                        <div class="flex items-center gap-2 text-sm text-base-content/70 mb-6">
                            <i data-lucide="map-pin" class="w-4 h-4"></i> <span>District 1, HCMC</span>
                        </div>

                        <p class="text-base-content/70 leading-relaxed mb-8 text-lg">
                            A rooftop restaurant with panoramic views of the city. Perfect for a romantic dinner under
                            the stars.
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut
                            labore et dolore magna aliqua.
                        </p>

                        <!-- Reviews -->
                        <div class="border-t border-white/10 pt-8">
                            <h3 class="font-bold text-xl mb-6">Guest Reviews</h3>
                            <div class="space-y-6">
                                <div class="pb-6 border-b border-white/5 last:border-0 last:pb-0">
                                    <div class="flex justify-between items-start mb-2">
                                        <div class="flex items-center gap-3">
                                            <div class="avatar placeholder">
                                                <div
                                                    class="bg-gradient-to-br from-primary to-accent text-white rounded-full w-10">
                                                    <span class="text-xs font-bold">JD</span>
                                                </div>
                                            </div>
                                            <div>
                                                <span class="font-bold text-sm block">John Doe</span>
                                                <span class="text-xs text-base-content/70">Verified Visitor</span>
                                            </div>
                                        </div>
                                        <span class="text-xs text-base-content/70">2 days ago</span>
                                    </div>
                                    <div class="rating rating-xs disabled pointer-events-none mb-3">
                                        <input type="radio" class="mask mask-star-2 bg-orange-400" />
                                        <input type="radio" class="mask mask-star-2 bg-orange-400" />
                                        <input type="radio" class="mask mask-star-2 bg-orange-400" />
                                        <input type="radio" class="mask mask-star-2 bg-orange-400" />
                                        <input type="radio" class="mask mask-star-2 bg-orange-400" checked />
                                    </div>
                                    <p class="text-sm text-base-content/70 leading-relaxed">"Absolutely loved the vibe!
                                        The staff was incredibly welcoming and the location is just perfect for a
                                        weekend getaway."</p>
                                </div>
                            </div>
                        </div>

                        <div
                            class="mt-8 pt-6 border-t border-white/10 flex justify-end gap-3 sticky bottom-0 bg-base-200">
                            <form method="dialog">
                                <button class="btn btn-ghost text-sm">Close</button>
                            </form>
                            <button class="btn btn-primary text-sm flex items-center gap-2">
                                Book Now <i data-lucide="arrow-right" class="w-4 h-4"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <input type="radio" name="tabs_place_1" role="tab"
                    class="tab w-full h-auto py-4 text-sm font-medium" aria-label="Map" />
                <div role="tabpanel" class="tab-content bg-base-200 h-full w-full">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.0968141837063!2d105.85017601540223!3d21.02881188599828!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab9bd9861ca1%3A0xe7887f7b72ca17a9!2sHanoi!5e0!3m2!1sen!2s!4v1634567890123!5m2!1sen!2s"
                        width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"
                        class="w-full h-full grayscale contrast-125 opacity-90 hover:opacity-100 transition-opacity">
                    </iframe>
                </div>
            </div>
        </div>
    </div>
    <form method="dialog" class="modal-backdrop">
        <button>close</button>
    </form>
</dialog>

<!-- Modal for Place 2 -->
<dialog id="place_modal_2" class="modal">
    <div
        class="modal-box w-11/12 max-w-6xl h-[85vh] p-0 rounded-2xl bg-base-200 border border-white/10 overscroll-none flex flex-col">
        <form method="dialog" class="absolute right-4 top-4 z-30">
            <button
                class="btn btn-sm btn-circle btn-ghost bg-black/50 hover:bg-black/80 text-white border-0">✕</button>
        </form>

        <div class="flex-1 flex flex-col overflow-hidden">
            <!-- Carousel -->
            <div class="carousel w-full h-64 md:h-80 bg-secondary">
                <div id="slide2-1" class="carousel-item relative w-full">
                    <img src="https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=800&q=80"
                        class="w-full h-full object-cover" />
                    <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
                        <a href="#slide2-2" class="btn btn-circle btn-sm bg-black/50 border-0 text-white">❮</a>
                        <a href="#slide2-2" class="btn btn-circle btn-sm bg-black/50 border-0 text-white">❯</a>
                    </div>
                </div>
                <div id="slide2-2" class="carousel-item relative w-full">
                    <img src="https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800&q=80"
                        class="w-full h-full object-cover" />
                    <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
                        <a href="#slide2-1" class="btn btn-circle btn-sm bg-black/50 border-0 text-white">❮</a>
                        <a href="#slide2-1" class="btn btn-circle btn-sm bg-black/50 border-0 text-white">❯</a>
                    </div>
                </div>
            </div>

            <!-- CSS Tabs -->
            <div role="tablist" class="tabs tabs-bordered bg-base-200 z-10 w-full grid grid-cols-2">
                <input type="radio" name="tabs_place_2" role="tab"
                    class="tab w-full h-auto py-4 text-sm font-bold active-tab-text"
                    aria-label="Information & Reviews" checked />
                <div role="tabpanel"
                    class="tab-content bg-base-200 p-6 md:p-8 h-full overflow-y-auto custom-scrollbar border-t-base-300">
                    <div class="max-w-4xl mx-auto">
                        <div class="flex items-center justify-between mb-4">
                            <div
                                class="badge badge-primary badge-outline font-bold uppercase tracking-wider bg-primary/10 border-0">
                                Homestay</div>
                            <div class="rating rating-sm disabled pointer-events-none">
                                <input type="radio" name="rating-2-modal" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-2-modal" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-2-modal" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-2-modal" class="mask mask-star-2 bg-orange-400"
                                    checked />
                                <input type="radio" name="rating-2-modal" class="mask mask-star-2 bg-white/20" />
                                <span class="text-base-content/70 ml-2 text-xs self-center">(85 reviews)</span>
                            </div>
                        </div>

                        <h2 class="text-3xl font-heading font-bold mb-2">Cozy Corner Homestay</h2>
                        <div class="flex items-center gap-2 text-sm text-base-content/70 mb-6">
                            <i data-lucide="map-pin" class="w-4 h-4"></i> <span>Dalat City</span>
                        </div>

                        <p class="text-base-content/70 leading-relaxed mb-8 text-lg">
                            A hidden gem in the heart of the city, offering a quiet escape with vintage decor.
                        </p>

                        <div
                            class="mt-8 pt-6 border-t border-white/10 flex justify-end gap-3 sticky bottom-0 bg-base-200">
                            <form method="dialog">
                                <button class="btn btn-ghost text-sm">Close</button>
                            </form>
                            <button class="btn btn-primary text-sm flex items-center gap-2">
                                Book Now <i data-lucide="arrow-right" class="w-4 h-4"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <input type="radio" name="tabs_place_2" role="tab"
                    class="tab w-full h-auto py-4 text-sm font-medium" aria-label="Map" />
                <div role="tabpanel" class="tab-content bg-base-200 h-full w-full">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3903.287790240536!2d108.44201621528657!3d11.94041919153526!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317112fef20988b1%3A0xad5f228b672bf90!2sDa%20Lat%2C%20Lam%20Dong%2C%20Vietnam!5e0!3m2!1sen!2s!4v1634567890123!5m2!1sen!2s"
                        width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"
                        class="w-full h-full grayscale contrast-125 opacity-90 hover:opacity-100 transition-opacity">
                    </iframe>
                </div>
            </div>
        </div>
    </div>
    <form method="dialog" class="modal-backdrop">
        <button>close</button>
    </form>
</dialog>

<!-- Modal for Place 3 -->
<dialog id="place_modal_3" class="modal">
    <div
        class="modal-box w-11/12 max-w-6xl h-[85vh] p-0 rounded-2xl bg-base-200 border border-white/10 overscroll-none flex flex-col">
        <form method="dialog" class="absolute right-4 top-4 z-30">
            <button
                class="btn btn-sm btn-circle btn-ghost bg-black/50 hover:bg-black/80 text-white border-0">✕</button>
        </form>

        <div class="flex-1 flex flex-col overflow-hidden">
            <!-- Carousel -->
            <div class="carousel w-full h-64 md:h-80 bg-secondary">
                <div id="slide3-1" class="carousel-item relative w-full">
                    <img src="https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&q=80"
                        class="w-full h-full object-cover" />
                    <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
                        <a href="#slide3-2" class="btn btn-circle btn-sm bg-black/50 border-0 text-white">❮</a>
                        <a href="#slide3-2" class="btn btn-circle btn-sm bg-black/50 border-0 text-white">❯</a>
                    </div>
                </div>
                <div id="slide3-2" class="carousel-item relative w-full">
                    <img src="https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800&q=80"
                        class="w-full h-full object-cover" />
                    <div class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
                        <a href="#slide3-1" class="btn btn-circle btn-sm bg-black/50 border-0 text-white">❮</a>
                        <a href="#slide3-1" class="btn btn-circle btn-sm bg-black/50 border-0 text-white">❯</a>
                    </div>
                </div>
            </div>

            <!-- CSS Tabs -->
            <div role="tablist" class="tabs tabs-bordered bg-base-200 z-10 w-full grid grid-cols-2">
                <input type="radio" name="tabs_place_3" role="tab"
                    class="tab w-full h-auto py-4 text-sm font-bold active-tab-text"
                    aria-label="Information & Reviews" checked />
                <div role="tabpanel"
                    class="tab-content bg-base-200 p-6 md:p-8 h-full overflow-y-auto custom-scrollbar border-t-base-300">
                    <div class="max-w-4xl mx-auto">
                        <div class="flex items-center justify-between mb-4">
                            <div
                                class="badge badge-primary badge-outline font-bold uppercase tracking-wider bg-primary/10 border-0">
                                Hotel</div>
                            <div class="rating rating-sm disabled pointer-events-none">
                                <input type="radio" name="rating-3-modal" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-3-modal" class="mask mask-star-2 bg-orange-400"
                                    checked />
                                <input type="radio" name="rating-3-modal" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-3-modal" class="mask mask-star-2 bg-orange-400" />
                                <input type="radio" name="rating-3-modal" class="mask mask-star-2 bg-orange-400" />
                                <span class="text-base-content/70 ml-2 text-xs self-center">(320 reviews)</span>
                            </div>
                        </div>

                        <h2 class="text-3xl font-heading font-bold mb-2">The Grand Hotel</h2>
                        <div class="flex items-center gap-2 text-sm text-base-content/70 mb-6">
                            <i data-lucide="map-pin" class="w-4 h-4"></i> <span>Nha Trang</span>
                        </div>

                        <p class="text-base-content/70 leading-relaxed mb-8 text-lg">
                            Luxury accommodation with 5-star amenities and service. Treat yourself to a lavish weekend.
                        </p>

                        <div
                            class="mt-8 pt-6 border-t border-white/10 flex justify-end gap-3 sticky bottom-0 bg-base-200">
                            <form method="dialog">
                                <button class="btn btn-ghost text-sm">Close</button>
                            </form>
                            <button class="btn btn-primary text-sm flex items-center gap-2">
                                Book Now <i data-lucide="arrow-right" class="w-4 h-4"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <input type="radio" name="tabs_place_3" role="tab"
                    class="tab w-full h-auto py-4 text-sm font-medium" aria-label="Map" />
                <div role="tabpanel" class="tab-content bg-base-200 h-full w-full">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3907.6830026265737!2d109.1967483152834!3d12.23879139133857!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3170677811cc886f%3A0x5c4bbb0bfbfa7a63!2sNha%20Trang%2C%20Khanh%20Hoa%20Province%2C%20Vietnam!5e0!3m2!1sen!2s!4v1634567890123!5m2!1sen!2s"
                        width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"
                        class="w-full h-full grayscale contrast-125 opacity-90 hover:opacity-100 transition-opacity">
                    </iframe>
                </div>
            </div>
        </div>
    </div>
    <form method="dialog" class="modal-backdrop">
        <button>close</button>
    </form>
</dialog>
