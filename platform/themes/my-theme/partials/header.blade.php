<!DOCTYPE html>
<html {!! Theme::htmlAttributes() !!}>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>

    <style>
        .whitespace-nowrap {
            color: black;
        }

        body.show-admin-bar nav {
            top: 40px;
        }
    </style>

    {!! Theme::header() !!}
</head>
<body {!! Theme::bodyAttributes() !!}>
{!! apply_filters(THEME_FRONT_BODY, null) !!}

<nav class="navbar navbar-expand-md fixed-top glass-effect border-bottom border-white border-opacity-25 shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold text-primary" href="/">{{ theme_option('site_title') }}</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            {!!
                Menu::renderMenuLocation('main-menu', [
                    'options' => ['class' => 'menu sub-menu--slideLeft'],
                    'view'    => 'main-menu',
                ])
            !!}
        </div>
        {!! Theme::partial('switcher') !!}
    </div>
</nav>
