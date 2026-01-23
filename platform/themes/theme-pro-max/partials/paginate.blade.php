<nav role="navigation" aria-label="Pagination" class="flex items-center justify-between border-t border-white/10 pt-4">
    <div class="flex justify-between flex-1 sm:hidden">
        <button class="join-item btn btn-outline btn-sm">{{ __('Previous') }}</button>
        <button class="join-item btn btn-outline btn-sm">{{ __('Next') }}</button>
    </div>
    <div class="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
        <div>
            <p class="text-sm text-base-content/70">    
                {{ __('Showing') }}
                <span class="font-medium text-white">{{ $paginator->currentPage() }}</span>
                {{ __('to') }}
                <span class="font-medium text-white">{{ $paginator->lastPage() }}</span>
                {{ __('of') }}
                <span class="font-medium text-white">{{ $paginator->total() }}</span>
                {{ __('results') }}
            </p>
        </div>
        <div>
            <div class="join">
                <button
                    class="join-item btn btn-sm btn-outline border-white/10 text-base-content/70 hover:bg-white/5 hover:text-white"
                    aria-label="{{ __('Previous') }}">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd"
                            d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
                            clip-rule="evenodd" />
                    </svg>
                </button>

                <button class="join-item btn btn-sm btn-active btn-primary">{{ $paginator->currentPage() }}</button>

                <button
                    class="join-item btn btn-sm btn-outline border-white/10 text-base-content/70 hover:bg-white/5 hover:text-white"
                    aria-label="{{ __('Next') }}">
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
