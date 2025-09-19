<?php

namespace Botble\AdministrativeUnit\Tables;

use Botble\AdministrativeUnit\Models\Commune;
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

class CommuneTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Commune::class)
            ->addActions([
                EditAction::make()->route('administrative-unit.commune.edit'),
            ])
            ->addColumns([
                IdColumn::make(),
                NameColumn::make(),
                CreatedAtColumn::make(),
                StatusColumn::make(),
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
