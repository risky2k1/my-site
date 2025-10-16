<?php

namespace Botble\Timeline\Forms;

use Botble\Base\Forms\FieldOptions\HiddenFieldOption;
use Botble\Base\Forms\FieldOptions\NameFieldOption;
use Botble\Base\Forms\FieldOptions\NumberFieldOption;
use Botble\Base\Forms\FieldOptions\StatusFieldOption;
use Botble\Base\Forms\FieldOptions\TextareaFieldOption;
use Botble\Base\Forms\Fields\HiddenField;
use Botble\Base\Forms\Fields\NumberField;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\FormAbstract;
use Botble\Blog\Models\Category;
use Botble\Timeline\Http\Requests\TimelineRequest;
use Botble\Timeline\Models\Timeline;
use Botble\Timeline\Models\TimelineCategory;

class TimelineCategoryForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(TimelineCategory::class)
            ->setValidatorClass(TimelineRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required())
            ->add('description',
                TextareaField::class,
                TextareaFieldOption::make()
                    ->label('Description')
                    ->placeholder(trans('core/base::forms.description_placeholder'))
                    ->required())
            ->add('status', SelectField::class, StatusFieldOption::make())
            /*->add(
                'order',
                NumberField::class,
                NumberFieldOption::make()
                    ->label(trans('plugins/contact::contact.custom_field.order'))
                    ->required()
                    ->defaultValue(999)
            )*/
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

                        return TimelineCategory::query()
                                ->latest('order')
                                ->value('order') + 1;
                    })
            )
            ->setBreakFieldPoint('status');
    }
}
