<?php

use Botble\DateIdeas\Repositories\Interfaces\PlaceInterface;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;
use Illuminate\Support\Collection;
use Botble\Media\Facades\RvMedia;
use Botble\DateIdeas\Models\Place;
use Botble\Theme\Facades\Theme;

function get_all_places(bool $active = true, int $perPage = 12): Collection|LengthAwarePaginator
{
    return app(PlaceInterface::class)->getAllPlaces($perPage, $active);
}

if (! function_exists('render_place_gallery')) {
    function render_place_gallery(Place $place): string
    {
        if(!$place) {
            return 404;
        }

        $galleries = gallery_meta_data($place);

        if (empty($galleries)) {
            return RvMedia::getImageUrl($place->image);
        }

        Theme::asset()
            ->container('footer')
            ->usePath(false)
            ->add('lightgallery.css', 'https://cdn.jsdelivr.net/npm/lightgallery@2.9.0/css/lightgallery-bundle.min.css')
            ->add('lightgallery.js', 'https://cdn.jsdelivr.net/npm/lightgallery@2.9.0/lightgallery.umd.min.js')
            ->add('lightgallery.init', asset('vendor/core/plugins/date-ideas/js/lightgallery.js'));


        return view('plugins/date-ideas::partials.gallery', compact('galleries'))->render();
    }
}