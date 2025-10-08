<?php

namespace Botble\Timeline\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\Timeline\Http\Requests\TimelineRequest;
use Botble\Timeline\Models\Timeline;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Timeline\Tables\TimelineTable;
use Botble\Timeline\Forms\TimelineForm;

class TimelineCategoryController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans(trans('plugins/timeline::timeline.categories')), route('timeline-category.index'));
    }

    public function index(TimelineTable $table)
    {
        $this->pageTitle(trans('plugins/timeline::timeline.categories'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/timeline::timeline.create'));

        return TimelineForm::create()->renderForm();
    }

    public function store(TimelineRequest $request)
    {
        $form = TimelineForm::create()->setRequest($request);

        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('timeline-category.index'))
            ->setNextUrl(route('timeline-category.edit', $form->getModel()->getKey()))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(Timeline $timeline)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $timeline->name]));

        return TimelineForm::createFromModel($timeline)->renderForm();
    }

    public function update(Timeline $timeline, TimelineRequest $request)
    {
        TimelineForm::createFromModel($timeline)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('timeline-category.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(Timeline $timeline)
    {
        return DeleteResourceAction::make($timeline);
    }
}
