<nav role="navigation" aria-label="Pagination" class="flex items-center justify-between border-t border-white/10 pt-4">
    <div class="hidden sm:flex sm:items-center sm:justify-end w-full">
        <div class="join">

            {{-- Previous --}}
            @if ($paginator->onFirstPage())
                <span class="join-item btn btn-sm btn-outline opacity-50 cursor-not-allowed">‹</span>
            @else
                <a href="{{ $paginator->previousPageUrl() }}" data-pagination
                    class="join-item btn btn-sm btn-outline border-white/10 text-base-content/70 hover:bg-white/5 hover:text-white">
                    ‹
                </a>
            @endif

            {{-- Pages --}}
            @php
                $current = $paginator->currentPage();
                $last = $paginator->lastPage();
                $start = max(1, $current - 2);
                $end = min($last, $current + 2);
            @endphp

            @for ($page = $start; $page <= $end; $page++)
                @if ($page == $current)
                    <span class="join-item btn btn-sm btn-active btn-primary">
                        {{ $page }}
                    </span>
                @else
                    <a href="{{ $paginator->url($page) }}" data-pagination
                        class="join-item btn btn-sm btn-outline border-white/10 text-base-content/70 hover:bg-white/5 hover:text-white">
                        {{ $page }}
                    </a>
                @endif
            @endfor

            {{-- Next --}}
            @if ($paginator->hasMorePages())
                <a href="{{ $paginator->nextPageUrl() }}" data-pagination
                    class="join-item btn btn-sm btn-outline border-white/10 text-base-content/70 hover:bg-white/5 hover:text-white">
                    ›
                </a>
            @else
                <span class="join-item btn btn-sm btn-outline opacity-50 cursor-not-allowed">›</span>
            @endif

        </div>
    </div>
</nav>
