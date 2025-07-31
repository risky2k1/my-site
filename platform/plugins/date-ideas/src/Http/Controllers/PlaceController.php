<?php

namespace Botble\DateIdeas\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\DateIdeas\Forms\PlaceForm;
use Botble\DateIdeas\Http\Requests\DateIdeasRequest;
use Botble\DateIdeas\Models\DateIdeas;
use Botble\Base\Http\Controllers\BaseController;
use Botble\DateIdeas\Models\Place;
use Botble\DateIdeas\Tables\DateIdeasTable;
use Botble\DateIdeas\Forms\DateIdeasForm;
use Botble\DateIdeas\Tables\PlaceTable;

class PlaceController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans(trans('plugins/date-ideas::date-ideas.places')), route('date-ideas.place.index'));
    }

    public function index(PlaceTable $table)
    {
        $this->pageTitle(trans('plugins/date-ideas::date-ideas.name'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/date-ideas::date-ideas.create'));

        return PlaceForm::create()->renderForm();
    }

    public function store(DateIdeasRequest $request)
    {
        $form = PlaceForm::create()->setRequest($request);

        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('date-ideas.place.index'))
            ->setNextUrl(route('date-ideas.place.edit', $form->getModel()->getKey()))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(Place $place)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $place->name]));

        return PlaceForm::createFromModel($place)->renderForm();
    }

    public function update(Place $place, DateIdeasRequest $request)
    {
        PlaceForm::createFromModel($place)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('date-ideas.place.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(Place $place)
    {
        return DeleteResourceAction::make($place);
    }
}
