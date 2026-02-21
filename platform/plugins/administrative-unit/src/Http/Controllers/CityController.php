<?php

namespace Botble\AdministrativeUnit\Http\Controllers;

use Botble\AdministrativeUnit\Forms\CityForm;
use Botble\AdministrativeUnit\Models\City;
use Botble\AdministrativeUnit\Tables\CityTable;
use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\AdministrativeUnit\Http\Requests\AdministrativeUnitRequest;
use Botble\Base\Http\Controllers\BaseController;

class CityController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans(trans('plugins/administrative-unit::administrative-unit.cities')), route('administrative-unit.city.index'));
    }

    public function index(CityTable $table): \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View|\Symfony\Component\HttpFoundation\Response
    {
        $this->pageTitle(trans('plugins/administrative-unit::administrative-unit.cities'));
        return $table->renderTable();
    }

    public function edit(City $city)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $city->name]));

        return CityForm::createFromModel($city)->renderForm();
    }
}
