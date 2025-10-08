<?php

namespace Botble\Timeline\Tables;

use Botble\Timeline\Models\Timeline;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\Actions\EditAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Botble\Table\BulkChanges\CreatedAtBulkChange;
use Botble\Table\BulkChanges\NameBulkChange;
use Botble\Table\BulkChanges\StatusBulkChange;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\NameColumn;
use Botble\Table\Columns\StatusColumn;
use Botble\Table\HeaderActions\CreateHeaderAction;
use Botble\Timeline\Models\TimelineCategory;
use Illuminate\Database\Eloquent\Builder;

class TimelineCategoryTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(TimelineCategory::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('timeline-category.create'))
            ->addActions([
                EditAction::make()->route('timeline-category.edit'),
                DeleteAction::make()->route('timeline-category.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('timeline-category.edit'),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('timeline-category.destroy'),
            ])
            ->addBulkChanges([
                NameBulkChange::make(),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                $query->select([
                    'id',
                    'name',
                    'created_at',
                    'status',
                ]);
            });
    }
}
