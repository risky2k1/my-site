<?php

namespace Botble\AdministrativeUnit\Database\Seeders;

use Botble\AdministrativeUnit\Models\City;
use Botble\AdministrativeUnit\Models\Commune;
use Botble\Base\Supports\BaseSeeder;
use Botble\Block\Models\Block;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class AdministrativeUnitSeeder extends BaseSeeder
{
    public function run(): void
    {
        $path = database_path('seeders/files/general/vn_cities_communes.json');
        $json = File::get($path);
        $data = json_decode($json, true);

        Commune::query()->truncate();
        City::query()->truncate();
        foreach ($data as $level1) {
            // Insert province
            $cityId = DB::table('au_cities')->insertGetId([
                'code' => $level1['code'],
                'name' => $level1['name'],
                'type' => $level1['type'],
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            // Loop districts
            foreach ($level1['communes'] as $level2) {
                $communeId = DB::table('au_communes')->insertGetId([
                    'code' => $level2['code'],
                    'name' => $level2['name'],
                    'type' => $level2['type'],
                    'city_id' => $cityId,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }
    }
}
