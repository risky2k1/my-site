<!DOCTYPE html>
<html {!! Theme::htmlAttributes() !!}>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            primary: "#667eea",
                            secondary: "#764ba2",
                            accent: "#f093fb",
                        },
                    },
                },
            };
        </script>
        <script defer src="https://unpkg.com/alpinejs@3.15.0/dist/cdn.min.js"></script>

        <style>
            .whitespace-nowrap{
                color: black;
            }
        </style>

        {!! Theme::header() !!}
    </head>
    <body {!! Theme::bodyAttributes() !!}>
        {!! apply_filters(THEME_FRONT_BODY, null) !!}

        {{--<nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="{{ BaseHelper::getHomepageUrl() }}">
                    @if($logo = Theme::getLogo())
                        {{ Theme::getLogoImage(maxHeight: 50) }}
                    @else
                        {{ theme_option('site_title', 'Your Site') }}
                    @endif
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    {!! Menu::renderMenuLocation('main-menu', [
                        'options' => ['class' => 'navbar-nav ms-auto'],
                        'view' => 'main-menu',
                    ]) !!}
                </div>
            </div>
        </nav>--}}

        <nav class="fixed w-full top-0 z-50 glass-effect border-b border-white/20">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="flex justify-between items-center py-4">
                    <div class="text-2xl font-bold text-primary">Portfolio</div>
                    <div class="flex items-center">
                        <div class="hidden md:flex space-x-8 me-3">
                            {!!
                                Menu::renderMenuLocation('main-menu', [
                                    'options' => ['class' => 'menu sub-menu--slideLeft'],
                                    'view'    => 'main-menu',
                                ])
                            !!}
                        </div>
                        <button class="md:hidden text-gray-700">
                            <i class="fas fa-bars text-xl"></i>
                        </button>

                        {{--thêm vào đây dropdown đổi cờ--}}
                        {!! Theme::partial('switcher') !!}
                    </div>
                </div>
            </div>
        </nav>
