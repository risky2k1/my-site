<!DOCTYPE html>
<html {!! Theme::htmlAttributes() !!}>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=5, user-scalable=1" name="viewport"/>

    <style>
        :root {
            --primary-color: {{ theme_option('primary_color', '#ff2b4a') }};
        }
    </style>

    {!! Theme::header() !!}
</head>
<body {!! Theme::bodyAttributes() !!}>
{!! apply_filters(THEME_FRONT_BODY, null) !!}
<!--Preloader-->
<div class="preloader">
    <div class="loader "></div>
</div>
<!--Preloader-->

<!--Navbar Start-->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <!-- LOGO -->
        <a class="navbar-brand logo" href="/">
            Tuns
        </a>

        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="navbar-collapse collapse" id="navbarCollapse">
            {!! Menu::renderMenuLocation('main-menu', [ 'options' => [], 'theme'   => true, 'view' => 'menu', ]) !!}
            {!! apply_filters('language_switcher') !!}
        </div>
    </div>
</nav>
<!--Navbar End-->
