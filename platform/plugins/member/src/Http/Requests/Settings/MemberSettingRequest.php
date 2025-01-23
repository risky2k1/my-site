<?php

namespace Botble\Member\Http\Requests\Settings;

use Botble\Base\Rules\MediaImageRule;
use Botble\Base\Rules\OnOffRule;
use Botble\Support\Http\Requests\Request;

class MemberSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'member_enabled_login' => [$onOffRule = new OnOffRule()],
            'member_enabled_registration' => [$onOffRule],
            'verify_account_email' => [$onOffRule],
            'member_enable_post_approval' => [$onOffRule],
            'member_default_avatar' => ['nullable', new MediaImageRule()],
        ];
    }
}
