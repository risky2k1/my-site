<?php

namespace Botble\FavoriteItems\Tables;

use Botble\FavoriteItems\Models\FavoriteItems;
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

class FavoriteItemsTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(FavoriteItems::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('favorite-items.create'))
            ->addActions([
                EditAction::make()->route('favorite-items.edit'),
                DeleteAction::make()->route('favorite-items.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('favorite-items.edit'),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('favorite-items.destroy'),
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
