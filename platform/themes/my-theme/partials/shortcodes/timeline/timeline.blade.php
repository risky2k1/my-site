@if(!empty($timeline))
    <!-- Timeline -->
    <section class="py-5">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="display-6 fw-bold text-dark mb-2">{{ $timeline->name }}</h2>
                <p class="fs-5 text-secondary">
                    {!! BaseHelper::clean($timeline->description) !!}
                </p>
            </div>

            <div class="timeline">
                @foreach($timeline->items as $item)
                    <div class="timeline-item" data-year="2021">
                        <div class="timeline-marker">
                            {!! BaseHelper::renderIcon($item->icon) !!}
                        </div>
                        <div class="timeline-content">
                            <div class="timeline-card">
                                <div class="memory-photo">
                                    @empty($item->image)
                                        {!! BaseHelper::renderIcon($item->icon2) !!}
                                    @else
                                        <img src="{{ RvMedia::getImageUrl($item->image) }}" alt="{{ $item->name }}">
                                    @endempty
                                </div>
                                <span class="badge bg-pink text-white mb-2">{{ $item->category?->name ?? __('Memory') }}</span>
                                <h3 class="h4 fw-bold script-font mb-1">{{ $item->title }}</h3>
                                <p class="small text-secondary mb-3">
                                    {{ $item->date }} • {{ $item->place?->name }}
                                </p>
                                <p class="text-secondary mb-3">
                                    {!! $item->content !!}
                                </p>
                                <div class="small text-secondary">
                                    <i class="fas fa-map-marker-alt me-2"></i>{{ $item->place?->address }}
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </section>

    <!-- Counter Section -->
    <section class="love-gradient text-center text-white py-5">
        <div class="container">
            <h2 class="h3 fw-bold script-font mb-4">{{ __("Together We've Shared") }}</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="p-4 rounded-4 bg-white bg-opacity-25">
                        <div id="days-counter" class="display-5 fw-bold" data-date="{{ $timeline->start_date?->diffInDays(now()) }}">0</div>
                        <div class="small">{{ __("Days Together") }}</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-4 rounded-4 bg-white bg-opacity-25">
                        <div id="memories-counter" class="display-5 fw-bold" data-amount="{{ $timeline->items->count() }}">0</div>
                        <div class="small">{{ __("Beautiful Memories") }}</div>
                    </div>
                </div>
                {{--<div class="col-md-3">
                    <div class="p-4 rounded-4 bg-white bg-opacity-25">
                        <div id="adventures-counter" class="display-5 fw-bold">0</div>
                        <div class="small">Adventures</div>
                    </div>
                </div>--}}
                <div class="col-md-4">
                    <div class="p-4 rounded-4 bg-white bg-opacity-25">
                        <div class="display-5 fw-bold">∞</div>
                        <div class="small">{{ __("Love & More to Come") }}</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endif
