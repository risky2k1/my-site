<!-- Main Grid & Controls -->
<div class="flex-grow">
    <!-- Top Controls -->
    <div class="flex flex-col sm:flex-row justify-between items-center gap-4 mb-8">
        <button id="random-btn" class="btn btn-primary gap-2 group animate-bounce-slow">
            {!! BaseHelper::renderIcon('ti ti-arrows-shuffle-2', null, [
                'class' => 'w-4 h-4 group-hover:rotate-180 transition-transform duration-500',
            ]) !!}
            {{ __('Random Pick') }}
        </button>
    </div>

    <!-- Grid -->
    <div id="places-grid" class="grid md:grid-cols-2 lg:grid-cols-2 xl:grid-cols-3 gap-6 mb-12">
        @include(Theme::getThemeNamespace() . '::views.date-ideas.partials.place-items', ['places' => $places])
    </div>

    <!-- Laravel Compatible Pagination -->
    {{ $places->links($paginationView) }}

</div>


<!-- Detailed Modals with Static Content -->

<!-- Modal for Place -->
<dialog id="place_modal_1" class="modal">
    <div
        class="modal-box w-11/12 max-w-6xl h-[85vh] p-0 rounded-2xl bg-base-200 border border-white/10 overscroll-none flex flex-col">
        <form method="dialog" class="absolute right-4 top-4 z-30">
            <button class="btn btn-sm btn-circle btn-ghost bg-black/50 hover:bg-black/80 text-white border-0">✕</button>
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
                    class="tab w-full h-auto py-4 text-sm font-bold active-tab-text" aria-label="Information & Reviews"
                    checked />
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
