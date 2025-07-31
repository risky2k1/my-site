<?php

namespace Botble\DateIdeas\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\DateIdeas\Http\Requests\DateIdeasRequest;
use Botble\DateIdeas\Models\DateIdeas;
use Botble\Base\Http\Controllers\BaseController;
use Botble\DateIdeas\Tables\DateIdeasTable;
use Botble\DateIdeas\Forms\DateIdeasForm;

class PlaceReviewController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans(trans('plugins/date ideas::date-ideas.name')), route('date-ideas.place-review.index'));
    }

    public function index(DateIdeasTable $table)
    {
        $this->pageTitle(trans('plugins/date ideas::date-ideas.name'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/date ideas::date-ideas.create'));

        return DateIdeasForm::create()->renderForm();
    }

    public function store(DateIdeasRequest $request)
    {
        $form = DateIdeasForm::create()->setRequest($request);

        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('date-ideas.place-review.index'))
            ->setNextUrl(route('date-ideas.place-review.edit', $form->getModel()->getKey()))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(DateIdeas $dateIdeas)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $dateIdeas->name]));

        return DateIdeasForm::createFromModel($dateIdeas)->renderForm();
    }

    public function update(DateIdeas $dateIdeas, DateIdeasRequest $request)
    {
        DateIdeasForm::createFromModel($dateIdeas)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('date-ideas.place-review.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(DateIdeas $dateIdeas)
    {
        return DeleteResourceAction::make($dateIdeas);
    }
}
