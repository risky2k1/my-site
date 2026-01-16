---
description: Theme Development
---

### Theme Structure

```
/platform/themes/my-theme/
├── assets/               # Source assets (sass, js)
├── config.php            # Theme configuration
├── functions/            # Theme helper functions
├── layouts/              # Layout templates
├── partials/             # Reusable partial views
├── views/                # Page views
├── widgets/              # Theme widgets
├── public/               # Compiled public assets
├── screenshot.png        # Theme preview (1200x900px)
├── theme.json            # Theme metadata
└── webpack.mix.js        # Asset compilation
```

### theme.json Configuration

```json
{
    "id": "vendor/my-theme",
    "name": "My Theme",
    "namespace": "Theme\\MyTheme\\",
    "author": "Your Name",
    "url": "https://yoursite.com",
    "version": "1.0.0",
    "description": "Theme description",
    "required_plugins": ["ecommerce"]
}
```

### config.php Events

```php
return [
    'inherit' => null,  // Parent theme name for child themes

    'events' => [
        'beforeRenderTheme' => function (Theme $theme): void {
            // Register CSS
            $theme->asset()->usePath()->add('theme', 'css/theme.css');

            // Register JS (in footer)
            $theme->asset()->container('footer')->usePath()->add(
                'theme',
                'js/theme.js',
                attributes: ['defer']
            );
        },
    ],
];
```

### Child Theme Development

Create child themes by setting `'inherit' => 'parent-theme'` in config.php:

```php
// platform/themes/my-child-theme/config.php
return [
    'inherit' => 'shofy',  // Parent theme folder name

    'events' => [
        'beforeRenderTheme' => function (Theme $theme): void {
            // Add child theme specific assets
            $theme->asset()->usePath()->add('child-styles', 'css/custom.css');
        },
    ],
];
```

Child themes only need files you want to override. Views are looked up in child theme first, then parent.

### Theme Commands

```bash
# Create new theme
php artisan cms:theme:create my-theme

# Activate theme
php artisan cms:theme:activate my-theme

# Remove theme
php artisan cms:theme:remove my-theme

# Publish theme assets
php artisan cms:theme:assets:publish
```

### Using Theme Facade

```php
use Botble\Theme\Facades\Theme;

// Render a view
Theme::scope('page', $data)->render();

// Load a partial
Theme::partial('header');

// Get theme option
theme_option('logo');

// Add breadcrumb
Theme::breadcrumb()->add('Home', '/')->add('Page', '/page');
```