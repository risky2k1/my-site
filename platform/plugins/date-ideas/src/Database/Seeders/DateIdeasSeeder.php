<?php

namespace Botble\DateIdeas\Database\Seeders;

use App\Models\User;
use Botble\Base\Supports\BaseSeeder;
use Botble\Block\Models\Block;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Botble\DateIdeas\Models\Place;
use Botble\DateIdeas\Models\PlaceCategory;
use Botble\DateIdeas\Models\PlaceMood;
use Botble\DateIdeas\Models\PlaceReview;
use Botble\Page\Database\Traits\HasPageSeeder;
use Illuminate\Support\Arr;

class DateIdeasSeeder extends BaseSeeder
{
    public function run(): void
    {
        Place::query()->delete();
        PlaceMood::query()->delete();
        PlaceCategory::query()->delete();
        PlaceReview::query()->delete();
        $faker = $this->fake();
        // Seed Place Categories
        $categories = [];
        foreach (['Ăn uống', 'Coffee', 'Vui chơi', 'Dã ngoại', 'Xem phim'] as $name) {
            $categories[] = PlaceCategory::create([
                'name' => $name,
                'status' => 'published',
            ]);
        }

        // Seed Moods
        $moods = [];
        foreach (['Lãng mạn', 'Chill', 'Vui nhộn', 'Phiêu lưu'] as $name) {
            $moods[] = PlaceMood::create([
                'name' => $name,
                'status' => 'published',
            ]);
        }

        // Seed Places
        $places = [];
        for ($i = 1; $i <= 20; $i++) {
            $place = Place::create([
                'name' => $faker->company . ' ' . $faker->city,
                'description' => $faker->paragraph(3),
                'address' => $faker->address,
                'latitude' => $faker->latitude(10, 21),
                'longitude' => $faker->longitude(102, 109),
                'price_range' => Arr::random(['low', 'medium', 'high']),
                'image' => $faker->imageUrl(640, 480, 'city', true, 'Place'),
                'status' => 'published',
            ]);

            // Attach categories (1-2 category)
            $place->categories()->sync(
                collect($categories)->random(rand(1, 2))->pluck('id')->toArray()
            );

            // Attach moods (1-2 mood)
            $place->moods()->sync(
                collect($moods)->random(rand(1, 2))->pluck('id')->toArray()
            );

            $places[] = $place;
        }

        foreach ($places as $place) {
            for ($i = 1; $i <= rand(2, 5); $i++) {
                PlaceReview::create([
                    'place_id' => $place->id,
                    'user_id' => User::query()->inRandomOrder()->first()->id ?? 1,
                    'rating' => rand(3, 5),
                    'comment' => $faker->sentence(10),
                    'status' => 'published',
                ]);
            }
        }

        $this->command->info('✅ DateIdeasSeeder đã seed dữ liệu mẫu thành công!');
    }
}
