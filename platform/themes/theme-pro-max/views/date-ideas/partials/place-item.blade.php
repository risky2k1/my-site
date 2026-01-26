<!-- Place -->
<article class="card group overflow-hidden p-0 bg-base-200 border-white/5 hover:border-primary/50">
    <div class="aspect-video w-full overflow-hidden relative">
        <img src="{{ RvMedia::getImageUrl($place->image, 'thumb') }}" alt="{{ $place->name }}"
            class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110">
        <div class="absolute top-2 right-2 flex flex-col gap-1 items-end">
            @foreach ($place->categories->take(3) as $category)
                <span
                    class="bg-black/60 backdrop-blur-md px-2 py-1 rounded text-xs font-semibold text-white border border-white/10 whitespace-nowrap">
                    {{ $category->name }}
                </span>
            @endforeach

            @if ($place->categories->count() > 3)
                <span class="bg-primary/80 backdrop-blur-md px-2 py-1 rounded text-xs font-bold text-white">
                    +{{ $place->categories->count() - 3 }}
                </span>
            @endif
        </div>

        <div class="absolute top-2 l-2 flex flex-col gap-1 items-st">
            {{ $place->price_range->toHtml() }}
        </div>
    </div>
    <div class="card-body p-6">
        <h3 class="card-title text-xl font-bold mb-1 group-hover:text-primary transition-colors">
            <a href="{{ $place->url }}" class="no-underline hover:underline">
                {{ $place->name }}
            </a>
        </h3>
        <div class="flex items-center gap-1 text-base-content/70 text-sm mb-3">
            {!! BaseHelper::renderIcon('ti ti-map-pin', null, ['class' => 'w-3 h-3']) !!} {{ $place->address }}
        </div>
        <p class="text-base-content/70 text-sm line-clamp-2 mb-4">{!! BaseHelper::clean($place->description) !!}</p>
        <div class="card-actions">
            <a href="{{ $place->url }}"
                class="link link-primary no-underline font-semibold hover:underline inline-flex items-center gap-1">
                {{ __('View Details') }} {!! BaseHelper::renderIcon('ti ti-arrow-right', null, ['class' => 'w-3 h-3']) !!}
            </a>
        </div>
    </div>
</article>
