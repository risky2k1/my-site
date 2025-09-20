@php
    $page = Theme::get('page');
@endphp
@if(!empty($page) && BaseHelper::isHomepage($page->id))

@else
    @if (Theme::breadcrumb()->getCrumbs())
        {{--<nav aria-label="{{ __('Breadcrumb') }}">
            <ol class="breadcrumb">
                @foreach (Theme::breadcrumb()->getCrumbs() as $i => $crumb)
                    @if ($crumb['label'])
                        <li class="breadcrumb-item {{ $loop->last ? 'active' : '' }}">
                            @if (!$loop->last && $crumb['url'])
                                <a href="{{ $crumb['url'] }}">{{ $crumb['label'] }}</a>
                            @else
                                {{ $crumb['label'] }}
                            @endif
                        </li>
                    @endif
                @endforeach
            </ol>
        </nav>--}}
        <div class="pt-24 pb-8">
            <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
                <nav class="flex space-x-2 text-sm text-gray-500">
                    @foreach (Theme::breadcrumb()->getCrumbs() as $i => $crumb)
                        @if ($crumb['label'])
                            @if (!$loop->last && $crumb['url'])
                                <a href="{{ $crumb['url'] }}" class="hover:text-primary">{{ $crumb['label'] }}</a>
                                <span>/</span>
                            @else
                                <span class="text-gray-900">{{ $crumb['label'] }}</span>
                            @endif
                        @endif
                    @endforeach
                </nav>
            </div>
        </div>
    @endif
@endif
