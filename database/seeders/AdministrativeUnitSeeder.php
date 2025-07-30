<?php

namespace Database\Seeders;

use Botble\Base\Supports\BaseSeeder;
use Botble\Widget\Database\Traits\HasWidgetSeeder;
use Botble\Widget\Widgets\CoreSimpleMenu;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class AdministrativeUnitSeeder extends BaseSeeder
{
    public function run(): void
    {
        $path = database_path('seeders/files/general/dvhcvn.json');
        $json = File::get($path);
        $data = json_decode($json, true);
        foreach ($data['data'] as $level1) {
            // Insert province
            $provinceId = DB::table('au_provinces')->insertGetId([
                'code' => $level1['level1_id'],
                'name' => $level1['name'],
                'type' => $level1['type'],
                'created_at' => now(),
                'updated_at' => now(),
            ]);

            // Loop districts
            foreach ($level1['level2s'] as $level2) {
                $districtId = DB::table('au_districts')->insertGetId([
                    'code' => $level2['level2_id'],
                    'name' => $level2['name'],
                    'type' => $level2['type'],
                    'province_id' => $provinceId,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);

                // Loop wards
                foreach ($level2['level3s'] as $level3) {
                    DB::table('au_wards')->insert([
                        'code' => $level3['level3_id'],
                        'name' => $level3['name'],
                        'type' => $level3['type'],
                        'district_id' => $districtId,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                }
            }
        }
    }
}
