<?php

use Botble\Theme\Events\RenderingThemeOptionSettings;
use Botble\Theme\Facades\ThemeOption;
use Botble\Theme\ThemeOption\Fields\IconField;
use Botble\Theme\ThemeOption\Fields\RepeaterField;
use Botble\Theme\ThemeOption\ThemeOptionSection;
use Botble\Theme\ThemeOption\Fields\TextField;
use Botble\Theme\ThemeOption\Fields\MediaImageField;

app('events')->listen(RenderingThemeOptionSettings::class, function (): void {
    ThemeOption::setSection(
        ThemeOptionSection::make('opt-text-portfolio-general')
            ->title(__('Portfolio'))
            ->description(__('Portfolio settings'))
            ->icon('ti ti-home')
            ->priority(0)
            ->fields([
                TextField::make()
                    ->name('my_name')
                    ->label(__('My name'))
                    ->defaultValue('Phm Min Tuns')
                    ->helperText(__('My name to display!')),
                TextField::make()
                    ->name('my_address')
                    ->label(__('My address'))
                    ->defaultValue('VIET NAM')
                    ->helperText(__('My address!')),
                TextField::make()
                    ->name('my_name')
                    ->label(__('My name'))
                    ->defaultValue('Phm Min Tuns')
                    ->helperText(__('My name to display!')),
                RepeaterField::make()
                    ->name('my_skills')
                    ->label(__('My skills'))
                    ->fields([
                        TextField::make()
                            ->name('skill_name')
                            ->label(__('Skill name')),
                        IconField::make()
                            ->name('my_skill_icon')
                            ->label(__('Skill Icon'))
                            ->defaultValue('ti ti-brand-facebook')
                    ])
            ])
    );
});
