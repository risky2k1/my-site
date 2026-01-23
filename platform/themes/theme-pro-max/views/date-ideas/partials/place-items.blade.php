<!-- Place -->
@foreach ($places as $place)
    <article class="card group overflow-hidden p-0 bg-base-200 border-white/5 hover:border-primary/50">
        <div class="aspect-video w-full overflow-hidden relative">
            <img src="#" alt="{{ $place->name }}"
                class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110">
            <div
                class="absolute top-2 right-2 bg-black/60 backdrop-blur-md px-2 py-1 rounded text-xs font-bold text-white border border-white/10">
                {{ $place->categories?->first()?->name }}
            </div>
        </div>
        <div class="card-body p-6">
            <h3 class="card-title text-xl font-bold mb-1 group-hover:text-primary transition-colors">{{ $place->name }}
            </h3>
            <div class="flex items-center gap-1 text-base-content/70 text-sm mb-3">
                {!! BaseHelper::renderIcon('ti ti-map-pin', null, ['class' => 'w-3 h-3']) !!} {{ $place->address }}
            </div>
            <p class="text-base-content/70 text-sm line-clamp-2 mb-4">{!! BaseHelper::clean($place->description) !!}</p>
            <div class="card-actions">
                <button onclick="place_modal_1.showModal()"
                    class="link link-primary no-underline font-semibold hover:underline inline-flex items-center gap-1">
                    View Details <i data-lucide="arrow-right" class="w-3 h-3"></i>
                </button>
            </div>
        </div>
    </article>
@endforeach
