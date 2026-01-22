const mix = require('laravel-mix')
const path = require('path')

let directory = path.basename(path.resolve(__dirname))

const source = 'platform/themes/' + directory
const dist = 'public/themes/' + directory

mix.options({ processCssUrls: false, })

mix
    .js(source + '/assets/js/main.js', dist + '/js')
    .postCss(source + '/assets/css/tailwind.css', dist + '/css', [
        require('tailwindcss')(`${source}/tailwind.config.js`),
        require('autoprefixer'),
    ])
    .disableSuccessNotifications()

if (mix.inProduction()) {
    mix
        .copy(dist + '/css/tailwind.css', source + '/public/css')
        .copy(dist + '/js/main.js', source + '/public/js')
}
