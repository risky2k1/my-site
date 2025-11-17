<?php

namespace Botble\DateIdeas\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\DateIdeas\Forms\PlaceReviewForm;
use Botble\DateIdeas\Http\Requests\DateIdeasRequest;
use Botble\DateIdeas\Models\DateIdeas;
use Botble\Base\Http\Controllers\BaseController;
use Botble\DateIdeas\Models\PlaceReview;
use Botble\DateIdeas\Tables\DateIdeasTable;
use Botble\DateIdeas\Forms\DateIdeasForm;
use Botble\DateIdeas\Tables\PlaceReviewTable;

class PlaceReviewController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans(trans('plugins/date-ideas::date-ideas.review.name')), route('date-ideas.place-review.index'));
    }

    public function index(PlaceReviewTable $table)
    {
        $this->pageTitle(trans('plugins/date-ideas::date-ideas.review.name'));

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

    public function edit(PlaceReview $placeReview)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $placeReview->name]));

        return PlaceReviewForm::createFromModel($placeReview)->renderForm();
    }

    public function update(PlaceReview $placeReview, DateIdeasRequest $request)
    {
        DateIdeasForm::createFromModel($placeReview)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('date-ideas.place-review.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(PlaceReview $placeReview)
    {
        return DeleteResourceAction::make($placeReview);
    }
}
