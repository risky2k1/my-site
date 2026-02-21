<?php

namespace Botble\DateIdeas\Tables;

use Botble\DateIdeas\Models\DateIdeas;
use Botble\DateIdeas\Models\PlaceCategory;
use Botble\DateIdeas\Models\PlaceMood;
use Botble\DateIdeas\Models\PlaceReview;
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
use Botble\Table\Columns\LinkableColumn;
use Botble\Table\Columns\NameColumn;
use Botble\Table\Columns\StatusColumn;
use Botble\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class PlaceReviewTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(PlaceReview::class)
            ->addActions([
                EditAction::make()->route('date-ideas.place-review.edit'),
                DeleteAction::make()->route('date-ideas.place-review.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                LinkableColumn::make('place_id')
                    ->label(trans('plugins/date-ideas::date-ideas.places'))
                    ->orderable(false)
                    ->searchable(false)
                    ->getValueUsing(function (LinkableColumn $column) {
                        $model = $column->getItem();

                        return $model->place?->name ?: '-';
                    })
                    ->urlUsing(function (LinkableColumn $column) {
                        $model = $column->getItem();

                        return route('date-ideas.place.edit', $model->place_id);
                    }),
                LinkableColumn::make('user_id')
                    ->label(trans('plugins/date-ideas::date-ideas.review.user'))
                    ->orderable(false)
                    ->searchable(false)
                    ->getValueUsing(function (LinkableColumn $column) {
                        $model = $column->getItem();

                        return $model->user?->name ?: '-';
                    })
                    ->urlUsing(function (LinkableColumn $column) {
                        $model = $column->getItem();

                        return route('member.edit', $model->user_id);
                    }),
                FormattedColumn::make('rating')
                    ->title(trans('plugins/date-ideas::date-ideas.review.rating'))
                    ,
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->queryUsing(function (Builder $query) {
                $query->select([
                    'id',
                    'place_id',
                    'user_id',
                    'rating',
                    'created_at',
                    'status',
                ]);
            });
    }
}
