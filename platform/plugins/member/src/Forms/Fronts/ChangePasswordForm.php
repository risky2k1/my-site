<?php

namespace Botble\Member\Forms\Fronts;

use Botble\Base\Forms\FieldOptions\HtmlFieldOption;
use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\Fields\HtmlField;
use Botble\Base\Forms\FormAbstract;
use Botble\Member\Http\Requests\UpdatePasswordRequest;

class ChangePasswordForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->setMethod('PUT')
            ->setValidatorClass(UpdatePasswordRequest::class)
            ->setFormOption('template', 'core/base::forms.form-content-only')
            ->setUrl(route('public.member.post.security'))
            ->add(
                'old_password',
                'password',
                TextFieldOption::make()
                    ->label(trans('plugins/member::dashboard.current_password'))
                    ->required()
                    ->maxLength(60)
            )
            ->add(
                'password',
                'password',
                TextFieldOption::make()
                    ->label(trans('plugins/member::dashboard.password_new'))
                    ->required()
                    ->maxLength(60)
            )
            ->add(
                'password_confirmation',
                'password',
                TextFieldOption::make()
                    ->label(trans('plugins/member::dashboard.password_new_confirmation'))
                    ->required()
                    ->maxLength(60)
            )
            ->add(
                'submit',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->view('plugins/member::includes.submit', [
                        'label' => trans('plugins/member::dashboard.password_update_btn'),
                    ])
            );
    }
}
