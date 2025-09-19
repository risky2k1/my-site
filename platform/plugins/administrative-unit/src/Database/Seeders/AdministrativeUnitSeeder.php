<?php

namespace Botble\Block\Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Block\Models\Block;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class AdministrativeUnitSeeder extends BaseSeeder
{
    public function run(): void
    {
        $path = database_path('seeders/files/general/dvhcvn.json');
        $json = File::get($path);
        $data = json_decode($json, true);
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
