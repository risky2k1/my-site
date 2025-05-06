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
                'content' =>
                    Html::tag('div', '[homepage-banner][/homepage-banner]') .
                    Html::tag('div', '[homepage-about-section][/homepage-about-section]') .
                    Html::tag('div', '[homepage-service-section][/homepage-service-section]') .
                    Html::tag('div', '[homepage-stat-section][/homepage-stat-section]') .
                    Html::tag('div', '[homepage-portfolio-section][/homepage-portfolio-section]') .
                    Html::tag('div', '[homepage-blog-section][/homepage-blog-section]') .
                    Html::tag('div', '[homepage-testimonials-section][/homepage-testimonials-section]') .
                    Html::tag('div', '[homepage-contact-section][/homepage-contact-section]')
                ,
            ],
            [
                'name' => 'Blog',
                'content' => '---',
            ],
            [
                'name' => 'Contact',
                'content' => Html::tag(
                        'p',
                        'Address: North Link Building, 10 Admiralty Street, 757695 Singapore'
                    ) .
                    Html::tag('p', 'Hotline: 18006268') .
                    Html::tag('p', 'Email: contact@botble.com') .
                    Html::tag(
                        'p',
                        '[google-map]North Link Building, 10 Admiralty Street, 757695 Singapore[/google-map]'
                    ) .
                    Html::tag('p', 'For the fastest reply, please use the contact form below.') .
                    Html::tag('p', '[contact-form][/contact-form]'),
            ],
            [
                'name' => $this->getCookieConsentPageName(),
                'content' => $this->getCookieConsentPageContent(),
            ],
            [
                'name' => 'Galleries',
                'content' => '<div>[gallery title="Galleries" enable_lazy_loading="yes"][/gallery]</div>',
            ],
        ];

        $this->createPages($pages);
    }
}
