const mix = require('laravel-mix')
const path = require('path')

const directory = path.basename(path.resolve(__dirname))

const source = `platform/themes/${directory}`
const dist = `public/themes/${directory}`

mix.options({
    processCssUrls: false,
})

mix
    // Tailwind entry
    .postCss(
        `${source}/assets/css/app.css`,
        `${dist}/css`,
        [
            require('tailwindcss')(
                `${source}/tailwind.config.js`
            ),
            require('autoprefixer'),
        ]
    )

    // JS (vanilla)
    .js(
        `${source}/assets/js/script.js`,
        `${dist}/js`
    )

    .disableSuccessNotifications()

if (mix.inProduction()) {
    mix
        .copy(`${dist}/css/app.css`, `${source}/public/css`)
        .copy(`${dist}/js/script.js`, `${source}/public/js`)
}
