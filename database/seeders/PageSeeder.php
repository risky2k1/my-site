<?php

namespace Database\Seeders;

use Botble\Base\Facades\Html;
use Botble\Base\Supports\BaseSeeder;
use Botble\Blog\Models\Category;
use Botble\CookieConsent\Database\Traits\HasCookieConsentSeeder;
use Botble\Page\Database\Traits\HasPageSeeder;

class PageSeeder extends BaseSeeder
{
    use HasPageSeeder;
    use HasCookieConsentSeeder;

    public function run(): void
    {
        $this->truncatePages();

        $pages = [
            [
                'name' => 'Homepage',
                'content' => Html::tag('div', '[homepage enable_lazy_loading="yes"][/homepage]'),
            ],
            [
                'name' => 'Blog',
                'content' => '---',
            ],
            [
                'name' => 'Timeline',
                'content' => Html::tag('div', '[timeline enable_lazy_loading="yes"][/timeline]'),
            ],
            [
                'name' => 'Date Ideas',
                'content' => Html::tag('div', '[date-ideas enable_lazy_loading="yes"][/date-ideas]'),
            ],
            [
                'name' => 'Contact',
                'content' => Html::tag('div', '[portfolio-contact enable_lazy_loading="yes"][/portfolio-contact]'),
            ],
        ];

        $this->createPages($pages);
    }
}
