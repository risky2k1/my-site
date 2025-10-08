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
use Illuminate\Database\Eloquent\Builder;

class TimelineTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Timeline::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('timeline.create'))
            ->addActions([
                EditAction::make()->route('timeline.edit'),
                DeleteAction::make()->route('timeline.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('timeline.edit'),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('timeline.destroy'),
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
                    'status',
                ]);
            });
    }
}
