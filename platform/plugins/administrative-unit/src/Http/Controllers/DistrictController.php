<?php

namespace Botble\AdministrativeUnit\Http\Controllers;

use Botble\AdministrativeUnit\Tables\DistrictTable;
use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\AdministrativeUnit\Http\Requests\AdministrativeUnitRequest;
use Botble\AdministrativeUnit\Models\AdministrativeUnit;
use Botble\Base\Http\Controllers\BaseController;
use Botble\AdministrativeUnit\Tables\AdministrativeUnitTable;
use Botble\AdministrativeUnit\Forms\AdministrativeUnitForm;

class DistrictController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans(trans('plugins/administrative-unit::administrative-unit.districts')), route('administrative-unit.district.index'));
    }

    public function index(DistrictTable $table)
    {
        $this->pageTitle(trans('plugins/administrative-unit::administrative-unit.districts'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/administrative unit::administrative-unit.create'));

        return AdministrativeUnitForm::create()->renderForm();
    }

    public function store(AdministrativeUnitRequest $request)
    {
        $form = AdministrativeUnitForm::create()->setRequest($request);

        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('administrative-unit.index'))
            ->setNextUrl(route('administrative-unit.edit', $form->getModel()->getKey()))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(AdministrativeUnit $administrativeUnit)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $administrativeUnit->name]));

        return AdministrativeUnitForm::createFromModel($administrativeUnit)->renderForm();
    }

    public function update(AdministrativeUnit $administrativeUnit, AdministrativeUnitRequest $request)
    {
        AdministrativeUnitForm::createFromModel($administrativeUnit)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('administrative-unit.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(AdministrativeUnit $administrativeUnit)
    {
        return DeleteResourceAction::make($administrativeUnit);
    }

    public function provinces(AdministrativeUnitTable $table)
    {

    }
}
