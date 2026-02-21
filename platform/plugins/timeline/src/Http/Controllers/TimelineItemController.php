<?php

namespace Botble\Timeline\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\Timeline\Forms\TimelineCategoryForm;
use Botble\Timeline\Forms\TimelineItemForm;
use Botble\Timeline\Http\Requests\TimelineRequest;
use Botble\Timeline\Models\Timeline;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Timeline\Models\TimelineCategory;
use Botble\Timeline\Models\TimelineItem;
use Botble\Timeline\Tables\TimelineCategoryTable;
use Botble\Timeline\Tables\TimelineItemTable;
use Botble\Timeline\Tables\TimelineTable;
use Botble\Timeline\Forms\TimelineForm;
use Illuminate\Http\Request;

class TimelineItemController extends BaseController
{
    public function __construct()
    {
        $this
            ->breadcrumb()
            ->add(trans(trans('plugins/timeline::timeline.items')), route('timeline-item.index'));
    }

    public function index(TimelineItemTable $table)
    {
        $this->pageTitle(trans('plugins/timeline::timeline.categories'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/timeline::timeline.create'));

        return TimelineItemForm::create()->renderForm();
    }

    public function store(Request $request)
    {
        $form = TimelineItemForm::create()->setRequest($request);

        $form->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('timeline-item.index'))
            ->setNextUrl(route('timeline-item.edit', $form->getModel()->getKey()))
            ->setMessage(trans('core/base::notices.create_success_message'));
    }

    public function edit(TimelineItem $timelineItem)
    {
        $this->pageTitle(trans('core/base::forms.edit_item', ['name' => $timelineItem->title]));

        return TimelineItemForm::createFromModel($timelineItem)->renderForm();
    }

    public function update(TimelineItem $timelineItem, Request $request)
    {
        TimelineItemForm::createFromModel($timelineItem)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('timeline-item.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    public function destroy(TimelineItem $timelineItem)
    {
        return DeleteResourceAction::make($timelineItem);
    }
}
