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
            'site_title' => 'Just My Site',
            'seo_description' => 'Just a site about mine!',
            'copyright' => '©%Y Your Company. All rights reserved.',
            'favicon' => $this->filePath('general/favicon.png'),
            'logo' => $this->filePath('general/logo.png'),
            'website' => 'https://botble.com',
            'contact_email' => 'support@company.com',
            'site_description' => 'Just a site about mine!',
            'phone' => '+(123) 345-6789',
            'address' => '214 West Arnold St. New York, NY 10002',
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
            'my_name' => 'PhmTuns',
            'my_address' => 'Việt Nam',
            'my_skills' => [
                [
                    ['key' => 'skill_name', 'value' => 'HTML'],
                    ['key' => 'my_skill_icon', 'value' => 'ti ti-html'],
                ], [
                    ['key' => 'skill_name', 'value' => 'CSS'],
                    ['key' => 'my_skill_icon', 'value' => 'ti ti-file-type-css'],
                ], [
                    ['key' => 'skill_name', 'value' => 'JAVASCRIPT'],
                    ['key' => 'my_skill_icon', 'value' => 'ti ti-file-type-js'],
                ], [
                    ['key' => 'skill_name', 'value' => 'LARAVEL'],
                    ['key' => 'my_skill_icon', 'value' => 'ti ti-brand-laravel'],
                ], [
                    ['key' => 'skill_name', 'value' => 'PYTHON'],
                    ['key' => 'my_skill_icon', 'value' => 'ti ti-brand-python'],
                ], [
                    ['key' => 'skill_name', 'value' => 'GOLANG'],
                    ['key' => 'my_skill_icon', 'value' => 'ti ti-brand-golang'],
                ], [
                    ['key' => 'skill_name', 'value' => 'VUEJS'],
                    ['key' => 'my_skill_icon', 'value' => 'ti ti-brand-vue'],
                ], [
                    ['key' => 'skill_name', 'value' => 'DOCKER'],
                    ['key' => 'my_skill_icon', 'value' => 'ti ti-brand-docker'],
                ], [
                    ['key' => 'skill_name', 'value' => 'AWS'],
                    ['key' => 'my_skill_icon', 'value' => 'ti ti-brand-aws'],
                ], [
                    ['key' => 'skill_name', 'value' => 'LINUX - UBUNTU'],
                    ['key' => 'my_skill_icon', 'value' => 'ti ti-brand-ubuntu'],
                ]
            ]
        ]);
    }
}
