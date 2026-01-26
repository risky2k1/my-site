{!! Theme::partial('header') !!}

@if (Theme::get('section-name'))
    {!! Theme::partial('breadcrumbs') !!}
@endif

<main class="max-w-7xl mx-auto px-6 pb-24 w-full flex flex-col lg:flex-row gap-8">
    <aside class="w-full lg:w-1/4 flex-shrink-0 left-sidebar-filter" id="left-sidebar-filter">
        <div class="card bg-base-200 border border-white/10 sticky top-24">
            <div class="card-body p-6">
                <div class="flex justify-between items-center mb-6">
                    <h3 class="font-heading font-bold text-lg">Filters</h3>
                    <button class="link link-primary no-underline hover:underline text-sm">Reset</button>
                </div>

                {!! dynamic_sidebar('primary_sidebar') !!}

            </div>
        </div>
    </aside>

    {!! Theme::content() !!}
</main>

{!! Theme::partial('footer') !!}
