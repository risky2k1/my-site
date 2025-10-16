<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Page\Models\Page;
use Botble\Theme\Database\Traits\HasThemeOptionSeeder;
use Botble\Theme\Supports\ThemeSupport;

class ThemeOptionSeeder extends BaseSeeder
{
    use HasThemeOptionSeeder;

    public function run(): void
    {
        $this->uploadFiles('general');

        $this->createThemeOptions([
            'site_title' => 'MCS',
            'seo_description' => 'My custom site',
            'copyright' => '©%Y PhmTuns. All rights reserved.',
            'favicon' => $this->filePath('general/favicon.png'),
            'favicon_type' => 'image/png',
            'logo' => $this->filePath('general/logo.png'),
            'website' => 'https://botble.com',
            'contact_email' => 'theloneranger241@gmail.com',
            'site_description' => 'My custom site',
            'phone' => '+(84) 329368007',
            'address' => 'Hà Nội, Việt Nam',
            'cookie_consent_message' => 'Your experience on this site will be improved by allowing cookies ',
            'cookie_consent_learn_more_url' => '/cookie-policy',
            'cookie_consent_learn_more_text' => 'Cookie Policy',
            'homepage_id' => Page::query()->value('id'),
            'blog_page_id' => Page::query()->skip(1)->value('id'),
            'primary_color' => '#AF0F26',
            'primary_font' => 'Roboto',
            'social_links' => ThemeSupport::getDefaultSocialLinksData(),
            'lazy_load_images' => 1,
            'lazy_load_placeholder_image' => $this->filePath('general/preloader.gif'),
        ]);
    }
}
