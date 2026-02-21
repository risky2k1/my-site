<!DOCTYPE html>
<html {!! Theme::htmlAttributes() !!}>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    {!! Theme::header() !!}
</head>

<body {!! Theme::bodyAttributes() !!}>
    {!! apply_filters(THEME_FRONT_BODY, null) !!}

    <nav class="fixed top-4 left-4 right-4 z-50">
        <div
            class="navbar max-w-6xl mx-auto bg-base-200/80 backdrop-blur-md border border-white/10 rounded-2xl px-6 shadow-lg">
            <div class="navbar-start">
                @if ($logo = Theme::getLogo())
                    {{ Theme::getLogoImage(maxHeight: 50) }}
                @else
                    <a href="{{ Theme::getHomepageUrl() }}"
                        class="text-xl font-heading font-bold text-white tracking-tight">
                        {{ theme_option('site_title', 'Your Site') }}
                    </a>
                @endif

            </div>
            <div class="navbar-center hidden md:flex">
                {!! Menu::renderMenuLocation('main-menu', [
                    'options' => ['class' => 'menu menu-horizontal px-1 gap-2'],
                    'view' => 'main-menu',
                ]) !!}
            </div>
            <div class="navbar-end gap-2">
                {{-- Language Switcher --}}
                {!! Theme::partial('switcher') !!}


                <!-- Mobile Menu Button -->
                <div class="dropdown dropdown-end md:hidden">
                    <label tabindex="0" class="btn btn-ghost btn-circle text-white">
                        {!! BaseHelper::renderIcon('ti ti-menu-2', null, ['class' => 'w-6 h-6']) !!}
                    </label>

                    {!! Menu::renderMenuLocation('main-menu', [
                        'options' => [
                            'class' => 'menu menu-sm dropdown-content mt-3 z-[1] p-2 shadow bg-base-200 rounded-box w-52 border border-white/10',
                            'z-index' => 0,
                        ],
                        'view' => 'main-menu',
                    ]) !!}
                </div>
            </div>
        </div>
    </nav>
