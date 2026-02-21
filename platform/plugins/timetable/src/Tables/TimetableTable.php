<?php

namespace Botble\Timetable\Tables;

use Botble\Timetable\Models\Timetable;
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
use Botble\Timetable\Models\TimetableEvent;
use Illuminate\Database\Eloquent\Builder;

class TimetableTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(TimetableEvent::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('timetable.create'))
            ->addActions([
                EditAction::make()->route('timetable.edit'),
                DeleteAction::make()->route('timetable.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('timetable.edit'),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('timetable.destroy'),
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
