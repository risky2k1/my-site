---
description: Plugin Development
---

### Learning Resources

::: tip Study Existing Plugins
Before creating new plugins, study example plugins from the community:
- **FriendsOfBotble**: https://github.com/orgs/FriendsOfBotble/repositories
- Contains well-structured plugins demonstrating best practices
- Examples: fob-comment, fob-wishlist, fob-compare, fob-faq, etc.
:::

### Plugin Structure

```
/platform/plugins/my-plugin/
├── config/
├── database/migrations/
├── resources/
│   ├── lang/
│   ├── views/
│   ├── js/
│   └── sass/
├── routes/
├── src/
│   ├── Database/
│   ├── Enums/
│   ├── Forms/
│   ├── Http/
│   │   ├── Controllers/
│   │   └── Requests/
│   ├── Models/
│   ├── Providers/
│   ├── Repositories/
│   ├── Services/
│   ├── Tables/
│   └── Plugin.php
└── plugin.json
```

### Creating a Plugin

```bash
# Create new plugin scaffold
php artisan cms:plugin:create my-plugin

# Activate plugin
php artisan cms:plugin:activate my-plugin

# Deactivate plugin
php artisan cms:plugin:deactivate my-plugin
```

### Plugin.php Lifecycle

```php
class Plugin extends PluginOperationAbstract
{
    public static function activate(): void
    {
        // Run when plugin is activated
        // Create tables, seed data, register permissions
    }

    public static function deactivate(): void
    {
        // Run when plugin is deactivated
        // Clean up if needed
    }

    public static function remove(): void
    {
        // Run when plugin is removed
        // Drop tables, clean up data
    }
}
```

### plugin.json Configuration

```json
{
    "id": "vendor/my-plugin",
    "name": "My Plugin",
    "namespace": "Vendor\\MyPlugin\\",
    "provider": "Vendor\\MyPlugin\\Providers\\MyPluginServiceProvider",
    "author": "Your Name",
    "url": "https://yoursite.com",
    "version": "1.0.0",
    "description": "Plugin description",
    "required_plugins": ["ecommerce"]
}
```

### Service Provider Pattern

```php
class MyPluginServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        // Load routes
        $this->loadRoutesFrom(__DIR__ . '/../../routes/web.php');

        // Load views
        $this->loadViewsFrom(__DIR__ . '/../../resources/views', 'my-plugin');

        // Load translations
        $this->loadTranslationsFrom(__DIR__ . '/../../resources/lang', 'plugins/my-plugin');

        // Register dashboard menu
        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-plugins-my-plugin',
                    'priority' => 5,
                    'name' => 'My Plugin',
                    'icon' => 'ti ti-box',
                    'url' => route('my-plugin.index'),
                    'permissions' => ['my-plugin.index'],
                ]);
        });
    }
}
```