<?php

namespace Botble\Timeline\Forms;

use Botble\Base\Forms\FieldOptions\DatePickerFieldOption;
use Botble\Base\Forms\FieldOptions\MediaImageFieldOption;
use Botble\Base\Forms\FieldOptions\NameFieldOption;
use Botble\Base\Forms\FieldOptions\NumberFieldOption;
use Botble\Base\Forms\FieldOptions\StatusFieldOption;
use Botble\Base\Forms\FieldOptions\TextareaFieldOption;
use Botble\Base\Forms\Fields\DatePickerField;
use Botble\Base\Forms\Fields\MediaImageField;
use Botble\Base\Forms\Fields\NumberField;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\FormAbstract;
use Botble\Timeline\Http\Requests\TimelineRequest;
use Botble\Timeline\Models\Timeline;
use Botble\Timeline\Models\TimelineCategory;

class TimelineForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(Timeline::class)
            ->setValidatorClass(TimelineRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required())
            ->add('description',
                TextareaField::class,
                TextareaFieldOption::make()
                    ->label('Description')
                    ->placeholder(trans('core/base::forms.description_placeholder'))
                    ->required())
            ->add('start_date', DatePickerField::class, DatePickerFieldOption::make()
                ->label(trans('plugins/timeline::timeline.form.timeline.start_date'))
            )
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->add('image', MediaImageField::class, MediaImageFieldOption::make())
            ->add(
                'order',
                NumberField::class,
                NumberFieldOption::make()
                    ->label(trans('plugins/contact::contact.custom_field.order'))
                    ->required()
                    ->value(function () {
                        if ($this->getModel()->exists) {
                            return $this->getModel()->order;
                        }

                        return Timeline::query()
                                ->latest('order')
                                ->value('order') + 1;
                    })
            )
            ->setBreakFieldPoint('status');
    }
}
