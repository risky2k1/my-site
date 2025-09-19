<?php

namespace Botble\AdministrativeUnit\Http\Controllers;

use Botble\AdministrativeUnit\Forms\CommuneForm;
use Botble\AdministrativeUnit\Models\Commune;
use Botble\AdministrativeUnit\Tables\CommuneTable;
use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\AdministrativeUnit\Http\Requests\AdministrativeUnitRequest;
use Botble\Base\Http\Controllers\BaseController;

class CommuneController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans(trans('plugins/administrative-unit::administrative-unit.communes')), route('administrative-unit.commune.index'));
    }

    public function index(CommuneTable $table)
    {
        $this->pageTitle(trans('plugins/administrative-unit::administrative-unit.communes'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/administrative unit::administrative-unit.create'));

        return CommuneForm::create()->renderForm();
    }

    public function store(AdministrativeUnitRequest $request)
    {
        $form = CommuneForm::create()->setRequest($request);

        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('administrative-unit.commune.index'))
            ->setNextUrl(route('administrative-unit.commune.edit', $form->getModel()->getKey()))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(Commune $commune)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $commune->name]));

        return CommuneForm::createFromModel($commune)->renderForm();
    }

    public function update(Commune $commune, AdministrativeUnitRequest $request)
    {
        CommuneForm::createFromModel($commune)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('administrative-unit.commune.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(Commune $commune)
    {
        return DeleteResourceAction::make($commune);
    }
}
