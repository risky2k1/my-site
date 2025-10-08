@php
    $page = Theme::get('page');
@endphp
@if(!empty($page) )
@else
    @if (Theme::breadcrumb()->getCrumbs())
        <div class="pt-5 mt-5">
            <div class="container">
                <nav class="small text-secondary">
                    @foreach (Theme::breadcrumb()->getCrumbs() as $i => $crumb)
                        @if ($crumb['label'])
                            @if (!$loop->last && $crumb['url'])
                                <a href="{{ $crumb['url'] }}" class="link-secondary text-decoration-none">{{ $crumb['label'] }}</a>
                                <span class="mx-1">/</span>
                            @else
                                <span class="text-dark">{{ $crumb['label'] }}</span>
                            @endif
                        @endif
                    @endforeach
                </nav>
            </div>
        </div>
    @endif
@endif
