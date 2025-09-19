<?php

namespace Botble\DateIdeas\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\DateIdeas\Forms\PlaceMoodForm;
use Botble\DateIdeas\Http\Requests\DateIdeasRequest;
use Botble\DateIdeas\Models\DateIdeas;
use Botble\Base\Http\Controllers\BaseController;
use Botble\DateIdeas\Models\PlaceMood;
use Botble\DateIdeas\Tables\DateIdeasTable;
use Botble\DateIdeas\Forms\DateIdeasForm;
use Botble\DateIdeas\Tables\PlaceMoodTable;

class PlaceMoodController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans(trans('plugins/date-ideas::date-ideas.moods')), route('date-ideas.place-mood.index'));
    }

    public function index(PlaceMoodTable $table)
    {
        $this->pageTitle(trans('plugins/date-ideas::date-ideas.moods'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/date-ideas::date-ideas.create'));

        return PlaceMoodForm::create()->renderForm();
    }

    public function store(DateIdeasRequest $request)
    {
        $form = PlaceMoodForm::create()->setRequest($request);

        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('date-ideas.place-mood.index'))
            ->setNextUrl(route('date-ideas.place-mood.edit', $form->getModel()->getKey()))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(PlaceMood $placeMood)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $placeMood->name]));

        return PlaceMoodForm::createFromModel($placeMood)->renderForm();
    }

    public function update(PlaceMood $placeMood, DateIdeasRequest $request)
    {
        PlaceMoodForm::createFromModel($placeMood)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('date-ideas.place-mood.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(PlaceMood $placeMood)
    {
        return DeleteResourceAction::make($placeMood);
    }
}
