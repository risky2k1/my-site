<?php

namespace Botble\Timeline\Tables;

use Botble\Table\Columns\LinkableColumn;
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
use Botble\Timeline\Models\TimelineItem;
use Illuminate\Database\Eloquent\Builder;

class TimelineItemTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(TimelineItem::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('timeline-item.create'))
            ->addActions([
                EditAction::make()->route('timeline-item.edit'),
                DeleteAction::make()->route('timeline-item.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                LinkableColumn::make('title')->route('timeline-item.edit'),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('timeline-item.destroy'),
            ])
            ->addBulkChanges([
                NameBulkChange::make(),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                $query->select([
                    'id',
                    'title',
                    'created_at',
                    'order',
                    'status',
                ]);
            });
    }
}
