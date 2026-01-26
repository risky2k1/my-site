<section class="py-12 px-4 md:px-6">
    <div class="max-w-6xl mx-auto">
        <div
            class="bg-base-200 rounded-3xl overflow-hidden border border-white/10 shadow-2xl flex flex-col md:flex-row h-auto md:h-[800px]">
            <!-- Left Side: Image Carousel -->
            <div class="w-full md:w-1/2 relative bg-secondary">
                <div class="w-full h-[400px] md:h-full">
                    {!! render_place_gallery($place) !!}
                </div>
            </div>

            <!-- Right Side: Content Tabs -->
            <div class="w-full md:w-1/2 flex flex-col h-full bg-base-200">
                <div role="tablist" class="tabs tabs-bordered w-full grid grid-cols-2">
                    <input type="radio" name="place_tabs" role="tab"
                        class="tab h-auto py-4 text-sm font-bold active-tab-text border-b-2"
                        aria-label="{{ __('Information & Reviews') }}" checked />
                    <div role="tabpanel" class="tab-content p-6 md:p-8 overflow-y-auto custom-scrollbar flex-grow">
                        <div class="flex items-center justify-between mb-4">
                            <div
                                class="badge badge-primary badge-outline font-bold uppercase tracking-wider bg-primary/10 border-0 text-primary px-3 py-1">
                                {{ $place->categories?->first()?->name ?? __('Place') }}
                            </div>
                            <div class="rating rating-sm disabled pointer-events-none flex items-center gap-1">
                                @for ($i = 1; $i <= 5; $i++)
                                    <input type="radio" name="rating-show" class="mask mask-star-2 bg-orange-400"
                                        @if ($i <= floor($place->reviews_avg_star ?? 5)) checked @endif />
                                @endfor
                                <span
                                    class="text-base-content/70 ml-2 text-xs">({{ $place->reviews_count ?? 'Give me 5 stars' }})</span>
                            </div>
                        </div>

                        <h1 class="text-3xl md:text-4xl font-heading font-bold mb-2">{{ $place->name }}</h1>
                        <div class="flex items-center gap-2 text-sm text-base-content/70 mb-6">
                            {!! BaseHelper::renderIcon('ti ti-map-pin', null, ['class' => 'w-4 h-4']) !!}
                            <span>{{ $place->address }}</span>
                        </div>

                        <div class="prose prose-sm md:prose-base text-base-content/70 leading-relaxed mb-8">
                            {!! BaseHelper::clean($place->description) !!}
                            {!! BaseHelper::clean($place->content) !!}
                        </div>

                        <!-- Reviews Section Placeholder -->
                        <div class="border-t border-white/10 pt-8">
                            <h3 class="font-bold text-xl mb-6">{{ __('Guest Reviews') }}</h3>
                            <div class="space-y-6">
                                Coming soon when GCP accepted my Payment =))
                                {{-- @include(Theme::getThemeNamespace() . '::views.date-ideas.partials.comments.item') --}}

                            </div>
                        </div>
                    </div>

                    <input type="radio" name="place_tabs" role="tab"
                        class="tab h-auto py-4 text-sm font-medium border-b-2" aria-label="{{ __('Map') }}" />
                    <div role="tabpanel" class="tab-content h-[400px] w-full">
                        @if ($place->latitude && $place->longitude)
                            <iframe width="100%" height="100%" style="border:0;"
                                class="w-full h-full transition-opacity" loading="lazy" allowfullscreen
                                referrerpolicy="no-referrer-when-downgrade"
                                src="https://www.google.com/maps?q={{ $place->latitude }},{{ $place->longitude }}&z=15&output=embed">
                            </iframe>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
