<div class="col-md-6">
    <div class="h4 fw-bold text-primary mb-2">{{ theme_option('site_title') }}</div>
    <p class="text-white-50 mb-3">{{ theme_option('site_description') }}</p>
    <div class="d-flex gap-3">
        @if ($socialLinks = Theme::getSocialLinks())
            @foreach($socialLinks as $socialLink)
                @continue(! $icon = $socialLink->getIconHtml())
                <a {{ $socialLink->getAttributes() }} class="text-white-50">
                    {{ $icon }}
                </a>
            @endforeach
        @endif
    </div>
</div>

