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
        
        return view($view, [
            'places' => $data,
        ])->render();
    }
}