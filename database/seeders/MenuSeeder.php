<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;
use Botble\Language\Facades\Language;
use Botble\Language\Models\LanguageMeta;
use Botble\Menu\Database\Traits\HasMenuSeeder;
use Botble\Menu\Facades\Menu;
use Botble\Menu\Models\Menu as MenuModel;
use Botble\Menu\Models\MenuLocation;
use Botble\Menu\Models\MenuNode;
use Botble\Page\Database\Traits\HasPageSeeder;
use Botble\Page\Models\Page;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;

class MenuSeeder extends BaseSeeder
{
    use HasPageSeeder;
    use HasBlogSeeder;

    public function run(): void
    {
        $data = [
            [
                'name' => 'Main menu',
                'slug' => 'main-menu',
                'location' => 'main-menu',
                'items' => [
                    [
                        'title' => 'Trang chủ',
                        'url' => '/',
                    ],
                    [
                        'title' => 'Blog',
                        'reference_id' => $this->getPageId('Blog'),
                        'reference_type' => Page::class,
                    ],
                    [
                        'title' => 'Favorites',
                        'url' => '/favorites',
                    ],

                    [
                        'title' => 'Tìm hiểu thêm',
                        'url' => '/#about',
                    ],
                    [
                        'title' => 'Liên hệ',
                        'url' => '/#contact',
                    ],
                    [
                        'title' => 'Hành trình của chúng tôi',
                        'reference_id' => $this->getPageId('Hành trình của chúng tôi'),
                        'reference_type' => Page::class,
                        'template' => 'timeline',
                    ],
                ],
            ],
            [
                'name' => 'Footer menu',
                'slug' => 'footer-menu',
                'items' => [
                    [
                        'title' => 'Trang chủ',
                        'url' => '/',
                        'css_class' => 'link-light link-underline-opacity-0 link-underline-opacity-75-hover',
                    ],
                    [
                        'title' => 'Blog',
                        'reference_id' => $this->getPageId('Blog'),
                        'reference_type' => Page::class,
                        'css_class' => 'link-light link-underline-opacity-0 link-underline-opacity-75-hover',
                    ],
                    [
                        'title' => 'Favorites',
                        'url' => '/favorites',
                        'css_class' => 'link-light link-underline-opacity-0 link-underline-opacity-75-hover',
                    ],
                    [
                        'title' => 'Hành trình của chúng tôi',
                        'reference_id' => $this->getPageId('Hành trình của chúng tôi'),
                        'reference_type' => Page::class,
                        'template' => 'timeline',
                        'css_class' => 'link-light link-underline-opacity-0 link-underline-opacity-75-hover',
                    ],
                ],
            ],
        ];

        $this->createMenus($data);
    }

    protected function createMenus(array $data, bool $truncate = true): void
    {
        if ($truncate) {
            MenuModel::query()->truncate();
            MenuLocation::query()->truncate();
            MenuNode::query()->truncate();
        }
        $supportedLocales = Language::getSupportedLocales();

        foreach ($data as $item) {
            $item['slug'] = Str::slug($item['name']);

            /**
             * @var MenuModel $menu
             */
            $menu = MenuModel::query()->create(Arr::except($item, ['items', 'location']));

            if (isset($item['location'])) {
                /**
                 * @var MenuLocation $menuLocation
                 */
                $menuLocation = MenuLocation::query()->create([
                    'menu_id' => $menu->getKey(),
                    'location' => $item['location'],
                ]);

                if (is_plugin_active('language')) {
                    foreach ($supportedLocales as $locale=>$data) {
                        LanguageMeta::saveMetaData($menuLocation, $locale);
                    }
                }
            }

            foreach ($item['items'] as $position => $menuNode) {
                $this->createMenuNode($position, $menuNode, $menu->getKey());
            }

            if (is_plugin_active('language')) {
                foreach ($supportedLocales as $locale=>$data) {
                    LanguageMeta::saveMetaData($menu, $locale);
                }
            }

            $this->createMetadata($menu, $item);
        }

        Menu::clearCacheMenuItems();
    }

    protected function createMenuNode(int $position, array $menuNode, int|string $menuId, int|string $parentId = 0): void
    {
        $menuNode['menu_id'] = $menuId;
        $menuNode['parent_id'] = $parentId;
        $menuNode['position'] = $position;

        if (isset($menuNode['url'])) {
            $menuNode['url'] = str_replace(url(''), '', $menuNode['url']);
        }

        if (Arr::has($menuNode, 'children') && ! empty($menuNode['children'])) {
            $children = $menuNode['children'];
            $menuNode['has_child'] = true;
        } else {
            $children = [];
            $menuNode['has_child'] = false;
        }

        Arr::forget($menuNode, 'children');

        /**
         * @var MenuNode $createdNode
         */
        $createdNode = MenuNode::query()->create($menuNode);

        $this->createMetadata($createdNode, $menuNode);

        if ($children) {
            foreach ($children as $childPosition => $child) {
                $this->createMenuNode($childPosition, $child, $menuId, $createdNode->getKey());
            }
        }
    }
}
