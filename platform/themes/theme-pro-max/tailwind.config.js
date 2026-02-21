module.exports = {
    content: [
        './platform/themes/theme-pro-max/views/**/*.blade.php',
        './platform/themes/theme-pro-max/partials/**/*.blade.php',
        './platform/themes/theme-pro-max/layouts/**/*.blade.php',
        './platform/themes/theme-pro-max/**/*.blade.php',
        './platform/themes/theme-pro-max/assets/js/**/*.js',
    ],
    theme: {
        extend: {
            colors: {
                primary: '#3B82F6',
                secondary: '#1E293B',
                cta: '#2563EB',
                background: '#0F172A',
                text: '#F1F5F9',
                'text-muted': '#94A3B8',
                surface: '#1E293B',
            },
            fontFamily: {
                heading: ['Archivo', 'sans-serif'],
                body: ['Space Grotesk', 'sans-serif'],
            },
            spacing: {
                'xs': '4px',
                'sm': '8px',
                'md': '16px',
                'lg': '24px',
                'xl': '32px',
                '2xl': '48px',
                '3xl': '64px',
            },
            boxShadow: {
                'sm': '0 1px 2px rgba(0,0,0,0.05)',
                'md': '0 4px 6px rgba(0,0,0,0.1)',
                'lg': '0 10px 15px rgba(0,0,0,0.1)',
                'xl': '0 20px 25px rgba(0,0,0,0.15)',
            }
        },
    },
    plugins: [
        require('daisyui'),
    ],
    daisyui: {
        themes: [
            {
                mytheme: {
                    "primary": "#3B82F6",
                    "secondary": "#1E293B",
                    "accent": "#2563EB",
                    "neutral": "#1E293B",
                    "base-100": "#0F172A", // background
                    "base-200": "#1E293B", // surface
                    "info": "#3abff8",
                    "success": "#36d399",
                    "warning": "#fbbd23",
                    "error": "#f87272",
                },
            },
            "light",
            "dark",
        ],
    },
}
