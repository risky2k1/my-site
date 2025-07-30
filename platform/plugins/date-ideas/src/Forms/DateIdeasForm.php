<?php

namespace Botble\DateIdeas\Forms;

use Botble\Base\Forms\FieldOptions\NameFieldOption;
use Botble\Base\Forms\FieldOptions\StatusFieldOption;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\FormAbstract;
use Botble\DateIdeas\Http\Requests\DateIdeasRequest;
use Botble\DateIdeas\Models\DateIdeas;

class DateIdeasForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(DateIdeas::class)
            ->setValidatorClass(DateIdeasRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required())
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->setBreakFieldPoint('status');
    }
}
