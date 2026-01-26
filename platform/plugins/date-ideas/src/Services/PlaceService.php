<?php

namespace Botble\DateIdeas\Services;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Facades\AdminHelper;
use Botble\Base\Supports\Helper;
use Botble\Blog\Models\Category;
use Botble\Blog\Models\Post;
use Botble\Blog\Models\Tag;
use Botble\Blog\Repositories\Interfaces\PostInterface;
use Botble\DateIdeas\Models\Place;
use Botble\Media\Facades\RvMedia;
use Botble\SeoHelper\Facades\SeoHelper;
use Botble\SeoHelper\SeoOpenGraph;
use Botble\Slug\Models\Slug;
use Botble\Theme\Facades\AdminBar;
use Botble\Theme\Facades\Theme;
use Illuminate\Database\Query\Builder;
use Illuminate\Support\Arr;

class PlaceService
{
    public function handleFrontRoutes(Slug|array $slug): Slug|array|Builder
    {
        if (! $slug instanceof Slug) {
            return $slug;
        }

        $condition = [
            'id' => $slug->reference_id,
            'status' => BaseStatusEnum::PUBLISHED,
        ];

        if (AdminHelper::isPreviewing()) {
            Arr::forget($condition, 'status');
        }

        switch ($slug->reference_type) {
            case Place::class:
                /**
                 * @var Place $place
                 */
                $place = Place::query()
                    ->where($condition)
                    ->with(['categories', 'moods', 'slugable'])
                    ->firstOrFail();

                // Helper::handleViewCount($place, 'viewed_place');

                SeoHelper::setTitle($place->name)
                    ->setDescription($place->description);

                $meta = new SeoOpenGraph();
                if ($place->image) {
                    $meta->setImage(RvMedia::getImageUrl($place->image));
                }
                $meta->setDescription($place->description);
                $meta->setUrl($place->url);
                $meta->setTitle($place->name);
                $meta->setType('article');

                SeoHelper::setSeoOpenGraph($meta);

                SeoHelper::meta()->setUrl($place->url);

                // if (function_exists('admin_bar')) {
                //     AdminBar::registerLink(
                //         trans('plugins/blog::posts.edit_this_post'),
                //         route('posts.edit', $post->getKey()),
                //         null,
                //         'posts.edit'
                //     );
                // }

                // if (function_exists('shortcode')) {
                //     shortcode()->getCompiler()->setEditLink(route('posts.edit', $post->id), 'posts.edit');
                // }

                $category = $place->categories->sortByDesc('id')->first();
                if ($category) {
                    Theme::breadcrumb()->add($category->name, $category->url);
                }

                Theme::breadcrumb()->add($place->name, $place->url);
                
                Theme::set('section-name', $place->name);

                do_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, PLACE_MODULE_SCREEN_NAME, $place);

                return [
                    'view' => 'date-ideas.show',
                    'default_view' => 'plugins/date-ideas::themes.place',
                    'data' => compact('place'),
                    'slug' => $place->slug,
                ];
        }

        return $slug;
    }
}
