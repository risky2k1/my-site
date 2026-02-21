<?php

namespace Botble\Timeline\Forms;

use Botble\Base\Forms\FieldOptions\CoreIconFieldOption;
use Botble\Base\Forms\FieldOptions\DatePickerFieldOption;
use Botble\Base\Forms\FieldOptions\EditorFieldOption;
use Botble\Base\Forms\FieldOptions\InputFieldOption;
use Botble\Base\Forms\FieldOptions\MediaImageFieldOption;
use Botble\Base\Forms\FieldOptions\NameFieldOption;
use Botble\Base\Forms\FieldOptions\SelectFieldOption;
use Botble\Base\Forms\FieldOptions\StatusFieldOption;
use Botble\Base\Forms\FieldOptions\TextareaFieldOption;
use Botble\Base\Forms\Fields\CoreIconField;
use Botble\Base\Forms\Fields\DateField;
use Botble\Base\Forms\Fields\DatePickerField;
use Botble\Base\Forms\Fields\EditorField;
use Botble\Base\Forms\Fields\MediaImageField;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\FormAbstract;
use Botble\DateIdeas\Models\Place;
use Botble\Theme\ThemeOption\Fields\IconField;
use Botble\Timeline\Http\Requests\TimelineRequest;
use Botble\Timeline\Models\Timeline;
use Botble\Timeline\Models\TimelineCategory;
use Botble\Timeline\Models\TimelineItem;

class TimelineItemForm extends FormAbstract
{
    public function setup(): void
    {
        $categoryIds = TimelineCategory::query()->pluck('name', 'id')->toArray();
        $timelines = Timeline::query()->pluck('name', 'id')->toArray();
        $placeIds = Place::query()->pluck('name', 'id')->toArray();
        $this
            ->columns(12)
            ->model(TimelineItem::class)
            ->setValidatorClass(TimelineRequest::class)
            ->add('title', TextField::class, NameFieldOption::make()->required())
            ->add('description', TextareaField::class, TextareaFieldOption::make()->label('Description')->placeholder(trans('core/base::forms.description_placeholder'))->required())
            ->add('content', EditorField::class, EditorFieldOption::make()->label('Content')->placeholder(trans('core/base::forms.content_placeholder'))->required())
            ->add('timeline_id', SelectField::class, SelectFieldOption::make()->required()
                ->colspan(4)
                ->label(trans('plugins/timeline::timeline.form.item.timeline_id'))
                ->choices($timelines)
                ->selected($this->getModel()->timeline_id))
            ->add('category_id', SelectField::class, SelectFieldOption::make()->required()
                ->colspan(4)
                ->label(trans('plugins/timeline::timeline.form.item.category_id'))
                ->choices($categoryIds)
                ->selected($this->getModel()->category_id))
            ->add('place_id', SelectField::class, SelectFieldOption::make()->required()
                ->colspan(4)
                ->label(trans('plugins/timeline::timeline.form.item.place_id'))
                ->choices($placeIds)
                ->selected($this->getModel()->place_id))
            ->add('date', DatePickerField::class, DatePickerFieldOption::make()
                ->colspan(4)
                ->label(trans('plugins/timeline::timeline.form.item.date'))
            )
            ->add(
                'icon',
                CoreIconField::class,
                CoreIconFieldOption::make()
                    ->colspan(4)
                    ->helperText(trans('plugins/timeline::timeline.form.item.icon_helper', ['url' => url('https://tabler.io/icons')]))
            )
            ->add(
                'icon2',
                CoreIconField::class,
                CoreIconFieldOption::make()
                    ->colspan(4)
                    ->helperText(trans('plugins/timeline::timeline.form.item.icon_helper', ['url' => url('https://tabler.io/icons')]))
            )
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->add('image', MediaImageField::class, MediaImageFieldOption::make())
            ->setBreakFieldPoint('status');
    }
}
