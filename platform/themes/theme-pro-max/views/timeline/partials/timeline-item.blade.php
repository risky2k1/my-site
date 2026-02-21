@props([
    'side' => 'right', // left | right
    'date' => '',
    'title' => '',
    'description' => '',
    'content' => '',
    'icon' => 'ti ti-heart-filled',
    'color' => 'pink',
    'timelineItem' => null,
])

@php
    $isLeft = $side === 'left';
@endphp

<div
    class="relative grid md:grid-cols-2 gap-8 md:gap-16 items-center timeline-item opacity-100 translate-y-10 transition-all duration-700 ease-out">

    <div class="timeline-dot hidden md:block"></div>

    {{-- Left empty --}}
    @if (!$isLeft)
        <div class="hidden md:block"></div>
    @endif

    {{-- Content --}}
    <div class="{{ $isLeft ? 'md:col-start-1' : '' }}">
        <div
            class="card bg-base-200 border border-{{ $color }}-500/20 shadow-xl
                   hover:shadow-2xl hover:-translate-y-1 transition-all duration-300 group">

            <div class="card-body p-6">
                <div class="flex items-start gap-4">
                    <div class="avatar placeholder">
                        <div
                            class="bg-gradient-to-br from-{{ $color }}-500 to-{{ $color }}-600
                                   text-white rounded-full w-12 h-12 flex items-center justify-center">
                            {!! BaseHelper::renderIcon($icon, 'w-6 h-6') !!}

                        </div>
                    </div>

                    <div class="flex-1">
                        <div class="mb-2">
                            <span
                                class="badge badge-sm bg-{{ $color }}-500/20 text-{{ $color }}-300 border-0">
                                {{ $date }}
                            </span>
                        </div>

                        <h3 class="card-title text-xl mb-2 group-hover:text-{{ $color }}-400 transition-colors">
                            {{ $title }}
                        </h3>

                        <p class="text-base-content/70 text-sm leading-relaxed mb-4">
                            {!! BaseHelper::clean($description) !!}
                        </p>

                        @if ($content)
                            <p class="text-base-content/70 text-sm leading-relaxed mb-4">
                                {!! BaseHelper::clean($content) !!}
                            </p>
                        @endif
                        
                        @if (get_timeline_item_gallery($timelineItem))
                            <a href="javascript:void(0)"
                                class="link link-primary text-sm inline-flex items-center gap-1 open-gallery"
                                data-gallery='@json(get_timeline_item_gallery($timelineItem))'>
                                {{ __('View Gallery') }}
                                {!! BaseHelper::renderIcon('ti ti-arrow-right', 'w-4 h-4') !!}
                            </a>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- Right empty --}}
    @if ($isLeft)
        <div class="hidden md:block"></div>
    @endif
</div>
