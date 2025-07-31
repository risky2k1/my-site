<?php

namespace Botble\DateIdeas\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\DateIdeas\Forms\PlaceCategoryForm;
use Botble\DateIdeas\Http\Requests\DateIdeasRequest;
use Botble\DateIdeas\Models\DateIdeas;
use Botble\Base\Http\Controllers\BaseController;
use Botble\DateIdeas\Models\PlaceCategory;
use Botble\DateIdeas\Tables\DateIdeasTable;
use Botble\DateIdeas\Forms\DateIdeasForm;
use Botble\DateIdeas\Tables\PlaceCategoryTable;

class PlaceCategoryController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans(trans('plugins/date-ideas::date-ideas.place_category')), route('date-ideas.place-category.index'));
    }

    public function index(PlaceCategoryTable $table)
    {
        $this->pageTitle(trans('plugins/date-ideas::date-ideas.place_category'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/date-ideas::date-ideas.create'));

        return PlaceCategoryForm::create()->renderForm();
    }

    public function store(DateIdeasRequest $request)
    {
        $form = PlaceCategoryForm::create()->setRequest($request);

        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('date-ideas.place-category.index'))
            ->setNextUrl(route('date-ideas.place-category.edit', $form->getModel()->getKey()))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(PlaceCategory $placeCategory)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $placeCategory->name]));

        return PlaceCategoryForm::createFromModel($placeCategory)->renderForm();
    }

    public function update(PlaceCategory $placeCategory, DateIdeasRequest $request)
    {
        PlaceCategoryForm::createFromModel($placeCategory)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('date-ideas.place-category.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(PlaceCategory $placeCategory)
    {
        return DeleteResourceAction::make($placeCategory);
    }
}
