<?php

namespace Botble\Timetable\Forms;

use Botble\Base\Forms\FieldOptions\NameFieldOption;
use Botble\Base\Forms\FieldOptions\StatusFieldOption;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\FormAbstract;
use Botble\Timetable\Http\Requests\TimetableRequest;
use Botble\Timetable\Models\Timetable;

class TimetableForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(Timetable::class)
            ->setValidatorClass(TimetableRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required())
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->setBreakFieldPoint('status');
    }
}
