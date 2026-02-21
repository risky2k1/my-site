<?php

namespace Botble\DateIdeas\Tables;

use Botble\DateIdeas\Models\DateIdeas;
use Botble\DateIdeas\Models\PlaceCategory;
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

class PlaceCategoryTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(PlaceCategory::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('date-ideas.place-category.create'))
            ->addActions([
                EditAction::make()->route('date-ideas.place-category.edit'),
                DeleteAction::make()->route('date-ideas.place-category.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('date-ideas.place-category.edit'),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
//            ->addBulkActions([
//                DeleteBulkAction::make()->permission('date-ideas.place-category.destroy'),
//            ])
//            ->addBulkChanges([
//                NameBulkChange::make(),
//                StatusBulkChange::make(),
//                CreatedAtBulkChange::make(),
//            ])
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
