<?php

namespace Botble\DateIdeas\Http\Controllers\Ajax;

use Botble\Base\Http\Controllers\BaseController;
use Botble\DateIdeas\Supports\FilterPlace;
use Botble\DateIdeas\Repositories\Interfaces\PlaceInterface;
use Illuminate\Http\Request;
use Botble\Theme\Facades\Theme;
class PublicController extends BaseController
{
    public function filterPlaces(Request $request, PlaceInterface $placeRepository)
    {
        $filters = FilterPlace::setFilters($request->input());

        $filters['select'] = ['id', 'name', 'description', 'address', 'price_range', 'image', 'au_city_id', 'au_commune_id'];

        $data = $placeRepository->filterPlaces($filters);

        $view = Theme::getThemeNamespace() . '::views.date-ideas.partials.place-items';

        return response()->json([
            'html' => view($view, [
                'places' => $data,
            ])->render(),
        
            'meta' => [
                'current_page' => $data->currentPage(),
                'last_page' => $data->lastPage(),
                'has_more' => $data->hasMorePages(),
            ],
        ]);
    }

    public function placeDetail(Request $request, PlaceInterface $placeRepository)
    {
        $place = $placeRepository->findOrFail($request->input('id'));

        return response()->json([
            'html' => view(Theme::getThemeNamespace() . '::views.date-ideas.partials.place-modal-detail', [
                'place' => $place,
            ])->render(),
        ]);
    }
}