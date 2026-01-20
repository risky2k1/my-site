module.exports = {
    content: [
        './platform/themes/theme-26/views/**/*.blade.php',
        './platform/themes/theme-26/partials/**/*.blade.php',
        './platform/themes/theme-26/layouts/**/*.blade.php',
        './platform/themes/theme-26/**/*.blade.php',
        './platform/themes/theme-26/assets/js/**/*.js',
    ],
    theme: {
        extend: {
            colors: {
                primary: {
                    50: '#f0f9ff',
                    100: '#e0f2fe',
                    200: '#bae6fd',
                    300: '#7dd3fc',
                    400: '#38bdf8',
                    500: '#0ea5e9',
                    600: '#0284c7',
                    700: '#0369a1',
                    800: '#075985',
                    900: '#0c4a6e',
                },
            },
            fontFamily: {
                sans: ['Inter', 'system-ui', 'sans-serif'],
            },
        },
    },
    plugins: [
        require('@tailwindcss/forms'),
        require('@tailwindcss/typography'),
    ],
}
