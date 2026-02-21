<?php

namespace Botble\AdministrativeUnit\Forms;

use Botble\AdministrativeUnit\Models\District;
use Botble\Base\Forms\FieldOptions\NameFieldOption;
use Botble\Base\Forms\FieldOptions\StatusFieldOption;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\FormAbstract;
use Botble\AdministrativeUnit\Http\Requests\AdministrativeUnitRequest;
use Botble\AdministrativeUnit\Models\AdministrativeUnit;

class DistrictForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(District::class)
            ->setValidatorClass(AdministrativeUnitRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required())
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->setBreakFieldPoint('status');
    }
}
