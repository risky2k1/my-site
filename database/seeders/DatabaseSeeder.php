<?php

namespace Database\Seeders;

use Botble\ACL\Database\Seeders\UserSeeder;
use Botble\AdministrativeUnit\Database\Seeders\AdministrativeUnitSeeder;
use Botble\Base\Facades\BaseHelper;
use Botble\Base\Supports\BaseSeeder;
use Botble\Block\Database\Seeders\StaticBlockSeeder;
use Botble\Contact\Database\Seeders\ContactSeeder;
use Botble\DateIdeas\Database\Seeders\DateIdeasSeeder;
use Botble\Language\Database\Seeders\LanguageSeeder;
use Botble\Timeline\Database\Seeders\TimelineSeeder;

class DatabaseSeeder extends BaseSeeder
{
    public function run(): void
    {
        $this->prepareRun();

        BaseHelper::maximumExecutionTimeAndMemoryLimit();

        $this->call(CustomUserSeeder::class);

        $this->when(is_plugin_active('language'), fn () => $this->call(LanguageSeeder::class));

        $this->call(PageSeeder::class);

        $this->when(is_plugin_active('blog'), fn () => $this->call(BlogSeeder::class));
        $this->when(is_plugin_active('gallery'), fn () => $this->call(GallerySeeder::class));
        $this->when(is_plugin_active('member'), fn () => $this->call(MemberSeeder::class));
        $this->when(is_plugin_active('contact'), fn () => $this->call(ContactSeeder::class));
        $this->when(is_plugin_active('block'), fn () => $this->call(StaticBlockSeeder::class));
        $this->when(is_plugin_active('custom-field'), fn () => $this->call(CustomFieldSeeder::class));
        $this->when(is_plugin_active('blog'), fn () => $this->call(MenuSeeder::class));

        $this->when(is_plugin_active('administrative-unit'), fn () => $this->call(AdministrativeUnitSeeder::class));
        $this->when(is_plugin_active('date-ideas'), fn () => $this->call(DateIdeasSeeder::class));
        $this->when(is_plugin_active('timeline'), fn () => $this->call(TimelineSeeder::class));

        $this->call([
            CommentSeeder::class,
            WidgetSeeder::class,
            ThemeOptionSeeder::class,
        ]);

        $this->finished();
    }
}
