<?php

namespace Botble\AdministrativeUnit\Http\Controllers;

use Botble\AdministrativeUnit\Models\Province;
use Botble\AdministrativeUnit\Tables\ProvincesTable;
use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\AdministrativeUnit\Http\Requests\AdministrativeUnitRequest;
use Botble\AdministrativeUnit\Models\AdministrativeUnit;
use Botble\Base\Http\Controllers\BaseController;
use Botble\AdministrativeUnit\Tables\AdministrativeUnitTable;
use Botble\AdministrativeUnit\Forms\AdministrativeUnitForm;

class ProvinceController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans(trans('plugins/administrative-unit::administrative-unit.provinces')), route('administrative-unit.province.index'));
    }

    public function index(ProvincesTable $table): \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View|\Symfony\Component\HttpFoundation\Response
    {
        $this->pageTitle(trans('plugins/administrative-unit::administrative-unit.provinces'));
        return $table->renderTable();
    }

    public function edit(Province $province)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $province->name]));

        return AdministrativeUnitForm::createFromModel($province)->renderForm();
    }
}
