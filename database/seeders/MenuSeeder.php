<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Database\Traits\HasBlogSeeder;
use Botble\Menu\Database\Traits\HasMenuSeeder;
use Botble\Page\Database\Traits\HasPageSeeder;
use Botble\Page\Models\Page;

class MenuSeeder extends BaseSeeder
{
    use HasMenuSeeder;
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
                        'title' => 'Home',
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
                        'title' => 'About',
                        'url' => '/#about',
                    ],
                    [
                        'title' => 'Contact',
                        'url' => '/#contact',
                    ],
                    [
                        'title' => 'Our Journey',
                        'url' => '/our-journey',
                    ],
                ],
            ],
        ];

        $this->createMenus($data);
    }
}
