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
        @include(Theme::getThemeNamespace() . '::views.date-ideas.partials.place-items', [
            'places' => $places,
        ])
    </div>

    <div id="load-more-sentinel" class="h-1"></div>
    <span id="loading-indicator" class="hidden text-center py-6 text-base-content/60 loading loading-bars loading-md">
        Loading...
    </span>
    <div id="no-more" class="hidden text-center py-6 text-sm text-base-content/50">
        {{ __('No more places') }}
    </div>
    <!-- Laravel Compatible Pagination -->
    {{-- {{ $places->links($paginationView) }} --}}

</div>


<!-- Detailed Modals with Static Content -->

<!-- Modal for Place -->
<dialog id="place_modal_detail" class="modal">
    <div
        class="modal-box w-11/12 max-w-6xl h-[85vh] p-0 rounded-2xl bg-base-200 border border-white/10 overscroll-none flex flex-col">
        <form method="dialog" class="absolute right-4 top-4 z-30">
            <button class="btn btn-sm btn-circle btn-ghost bg-black/50 hover:bg-black/80 text-white border-0">✕</button>
        </form>

        <div class="body">

        </div>
    </div>
    <form method="dialog" class="modal-backdrop">
        <button>close</button>
    </form>
</dialog>
