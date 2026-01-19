let mix = require('laravel-mix')

const path = require('path')

mix
    .setPublicPath('public')
    .js('assets/js/app.js', 'js')
    .vue({ version: 3 })
    .postCss('assets/css/app.css', 'css', [
        require('tailwindcss'),
        require('autoprefixer'),
    ])
    .options({
        processCssUrls: false
    })
