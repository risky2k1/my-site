<?php

namespace Botble\FavoriteItems\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\FavoriteItems\Http\Requests\FavoriteItemsRequest;
use Botble\FavoriteItems\Models\FavoriteItems;
use Botble\Base\Http\Controllers\BaseController;
use Botble\FavoriteItems\Tables\FavoriteItemsTable;
use Botble\FavoriteItems\Forms\FavoriteItemsForm;

class FavoriteItemsController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans(trans('plugins/favorite items::favorite-items.name')), route('favorite-items.index'));
    }

    public function index(FavoriteItemsTable $table)
    {
        $this->pageTitle(trans('plugins/favorite items::favorite-items.name'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/favorite items::favorite-items.create'));

        return FavoriteItemsForm::create()->renderForm();
    }

    public function store(FavoriteItemsRequest $request)
    {
        $form = FavoriteItemsForm::create()->setRequest($request);

        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('favorite-items.index'))
            ->setNextUrl(route('favorite-items.edit', $form->getModel()->getKey()))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(FavoriteItems $favoriteItems)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $favoriteItems->name]));

        return FavoriteItemsForm::createFromModel($favoriteItems)->renderForm();
    }

    public function update(FavoriteItems $favoriteItems, FavoriteItemsRequest $request)
    {
        FavoriteItemsForm::createFromModel($favoriteItems)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('favorite-items.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(FavoriteItems $favoriteItems)
    {
        return DeleteResourceAction::make($favoriteItems);
    }
}
