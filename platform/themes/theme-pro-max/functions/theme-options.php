<?php

use Botble\Theme\Events\RenderingThemeOptionSettings;
use Botble\Theme\Facades\ThemeOption;
use Botble\Theme\ThemeOption\ThemeOptionSection;
use Botble\Theme\ThemeOption\Fields\TextField;
use Botble\Theme\ThemeOption\Fields\RepeaterField;
use Botble\Theme\ThemeOption\Fields\IconField;

app()->booted(function () {
    theme_option()
        ->setField([
            'id' => 'primary_color',
            'section_id' => 'opt-text-subsection-general',
            'type' => 'customColor',
            'label' => __('Primary color'),
            'attributes' => [
                'name' => 'primary_color',
                'value' => '#ff2b4a',
            ],
        ]);
});

app('events')->listen(RenderingThemeOptionSettings::class, function (): void {
    ThemeOption::setSection(
        ThemeOptionSection::make('opt-homepage-subsection-skills')
            ->title(__('Skills'))
            ->description(__('Skills settings'))
            ->icon('ti ti-code')
            ->priority(1)
            ->fields([
                RepeaterField::make()
                    ->name('your_skills')
                    ->label(__('Your skills'))
                    ->fields([
                        TextField::make()
                            ->name('skill_name')
                            ->label(__('Skill name')),
                        IconField::make()
                            ->name('skill_icon')
                            ->label(__('Skill icon'))
                            ->defaultValue('ti ti-code')
                    ])
            ])
    );

 
});