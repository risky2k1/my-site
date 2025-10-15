<?php

namespace Botble\Timeline\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\Timeline\Forms\TimelineCategoryForm;
use Botble\Timeline\Http\Requests\TimelineRequest;
use Botble\Timeline\Models\Timeline;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Timeline\Models\TimelineCategory;
use Botble\Timeline\Tables\TimelineCategoryTable;
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

    public function index(TimelineCategoryTable $table)
    {
        $this->pageTitle(trans('plugins/timeline::timeline.categories'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/timeline::timeline.create'));

        return TimelineCategoryForm::create()->renderForm();
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

    public function edit(TimelineCategory $timelineCategory)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $timelineCategory->name]));

        return TimelineForm::createFromModel($timelineCategory)->renderForm();
    }

    public function update(TimelineCategory $timelineCategory, TimelineRequest $request)
    {
        TimelineForm::createFromModel($timelineCategory)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('timeline-category.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(TimelineCategory $timelineCategory)
    {
        return DeleteResourceAction::make($timelineCategory);
    }
}
