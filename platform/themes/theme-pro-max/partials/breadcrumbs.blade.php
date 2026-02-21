<header class="relative bg-secondary pt-40 pb-20 mb-8">
    <div class="absolute inset-0 overflow-hidden">
        <!-- Placeholder Background Image -->
        <img src="https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?q=80&w=2070&auto=format&fit=crop"
            alt="Background" class="w-full h-full object-cover opacity-20">
        <div class="absolute inset-0 bg-gradient-to-b from-transparent to-base-100"></div>
    </div>
    <div class="relative max-w-6xl mx-auto px-6 text-center z-10">
        <h1 class="text-4xl md:text-5xl font-heading font-bold mb-4 text-white">
            {{ Theme::get('section-name') ?: SeoHelper::getTitle() }}
        </h1>
        <div class="text-sm breadcrumbs justify-center flex text-base-content/70">
            <ul>
                @foreach (Theme::breadcrumb()->getCrumbs() as $i => $crumb)
                    @if ($crumb['label'])
                        <li>
                            @if (!$loop->last && $crumb['url'])
                                <a href="{{ $crumb['url'] }}"
                                    class="hover:text-primary transition-colors">{{ $crumb['label'] }}</a>
                            @else
                                <span class="text-primary font-bold">{{ $crumb['label'] }}</span>
                            @endif
                        </li>
                    @endif
                @endforeach
            </ul>
        </div>
</header>
