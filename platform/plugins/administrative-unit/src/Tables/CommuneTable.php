<?php

namespace Botble\AdministrativeUnit\Tables;

use Botble\AdministrativeUnit\Models\City;
use Botble\AdministrativeUnit\Models\Commune;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\Actions\EditAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Botble\Table\BulkChanges\CreatedAtBulkChange;
use Botble\Table\BulkChanges\NameBulkChange;
use Botble\Table\BulkChanges\StatusBulkChange;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\FormattedColumn;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\NameColumn;
use Botble\Table\Columns\StatusColumn;
use Botble\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;
use Botble\Base\Facades\Html;

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
                FormattedColumn::make('city_id')
                    ->title(trans('plugins/administrative-unit::administrative-unit.cities'))
                    ->width(150)
                    ->orderable(false)
                    ->searchable(false)
                    ->getValueUsing(function (FormattedColumn $column) {
                        return $column->getItem()->city->name;
                    })
                    ->withEmptyState(),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->with([
                        'city',
                    ])->select([
                        'id',
                        'name',
                        'created_at',
                        'city_id',
                        'status',
                    ])
                    ->orderBy('id');

            });
    }
}
