<?php

namespace Botble\DateIdeas\Tables;

use Botble\DateIdeas\Models\DateIdeas;
use Botble\DateIdeas\Models\Place;
use Botble\DateIdeas\Models\PlaceCategory;
use Botble\DateIdeas\Models\PlaceMood;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\Actions\EditAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Botble\Table\BulkChanges\CreatedAtBulkChange;
use Botble\Table\BulkChanges\NameBulkChange;
use Botble\Table\BulkChanges\StatusBulkChange;
use Botble\Table\Columns\Column;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\EnumColumn;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\ImageColumn;
use Botble\Table\Columns\NameColumn;
use Botble\Table\Columns\StatusColumn;
use Botble\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class PlaceTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Place::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('date-ideas.place.create'))
            ->addActions([
                EditAction::make()->route('date-ideas.place.edit'),
                DeleteAction::make()->route('date-ideas.place.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('date-ideas.place.edit'),
                ImageColumn::make(),
                EnumColumn::make('price_range'),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->queryUsing(function (Builder $query) {
                $query->select([
                    'id',
                    'name',
                    'price_range',
                    'created_at',
                    'status',
                ]);
            });
    }
}
