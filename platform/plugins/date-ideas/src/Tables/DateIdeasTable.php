<?php

namespace Botble\DateIdeas\Tables;

use Botble\DateIdeas\Models\DateIdeas;
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

class DateIdeasTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(DateIdeas::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('date-ideas.create'))
            ->addActions([
                EditAction::make()->route('date-ideas.edit'),
                DeleteAction::make()->route('date-ideas.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('date-ideas.edit'),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('date-ideas.destroy'),
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
