<!DOCTYPE html>
<html {!! Theme::htmlAttributes() !!}>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    {!! Theme::header() !!}
</head>

<body {!! Theme::bodyAttributes() !!}>
    {!! apply_filters(THEME_FRONT_BODY, null) !!}

    <nav class="fixed top-0 left-0 right-0 z-50 bg-white/90 backdrop-blur-md shadow-sm">
        <div class="container-custom">
            <div class="flex items-center justify-between h-16">
                <a href="{{ BaseHelper::getHomepageUrl() }}" class="text-2xl font-bold text-primary-600">
                    @if($logo = Theme::getLogo())
                    {{ Theme::getLogoImage(maxHeight: 40) }}
                    @else
                    {{ theme_option('site_title', 'Portfolio') }}
                    @endif
                </a>

                <div class="hidden md:flex items-center gap-6">
                    {!! Menu::renderMenuLocation('main-menu', [
                        'options' => ['class' => 'flex items-center gap-6'],
                        'view'    => 'main-menu',
                    ]) !!}

                    {!! Theme::partial('language-switcher') !!}
                </div>
            </div>
        </div>
    </nav>

    <div class="pt-16">