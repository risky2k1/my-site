<?php

namespace Database\Seeders;

use Botble\ACL\Models\Role;
use Botble\ACL\Models\User;
use Botble\ACL\Services\ActivateUserService;
use Botble\Base\Supports\BaseSeeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Schema;

class CustomUserSeeder extends BaseSeeder
{
    public function run(): void
    {
        Schema::disableForeignKeyConstraints();

        User::query()->truncate();
        Role::query()->truncate();
        DB::table('role_users')->truncate();
        DB::table('activations')->truncate();

        $faker = $this->fake();

        $data = [
            'first_name' => 'Phm',
            'last_name' => 'Tuns',
            'email' => 'theloneranger241@gmail.com',
            'username' => config('core.base.general.demo.account.username'),
            'password' => config('core.base.general.demo.account.password'),
            'super_user' => 1,
            'manage_supers' => 1,
        ];

        $data2 = [
            'first_name' => 'HT',
            'last_name' => "Ngan",
            'email' => $faker->companyEmail(),
            'username' => 'htngan2203',
            'password' => '22032004',
            'super_user' => 1,
            'manage_supers' => 1,
        ];

        if (File::isDirectory(database_path('seeders/files/users'))) {
            $files = $this->uploadFiles('users');

            if ($files) {
                $data['avatar_id'] = $files[0]['data']->id;
            }
        }

        $superuser = $this->createUser($data);
        $superuser2 = $this->createUser($data2);

        $permissions = (new Role())->getAvailablePermissions();

        $permissions = array_map(function () {
            return true;
        }, $permissions);

        Role::query()->forceCreate([
            'name' => 'Admin',
            'slug' => 'admin',
            'description' => 'Admin users role',
            'permissions' => $permissions,
            'is_default' => true,
            'created_by' => $superuser->getKey(),
            'updated_by' => $superuser->getKey(),
        ]);
    }

    protected function createUser(array $data): User
    {
        $user = new User();
        $user->forceFill($data);
        $user->save();

        app(ActivateUserService::class)->activate($user);

        return $user;
    }
}
