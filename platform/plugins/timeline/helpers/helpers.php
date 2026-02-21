<?php

use Botble\Gallery\Models\GalleryMeta;
use Botble\Timeline\Models\TimelineItem;
use Botble\Base\Facades\BaseHelper;
use Botble\Media\Facades\RvMedia;
use Botble\Theme\Facades\Theme;
//
if (! function_exists('get_timeline_item_gallery')) {
    function get_timeline_item_gallery(TimelineItem $timelineItem, array $select = ['gallery_meta.id', 'gallery_meta.images']): array
    {
        

        $meta = GalleryMeta::query()
            ->where([
                'reference_id' => $timelineItem->getKey(),
                'reference_type' => $timelineItem::class,
            ])
            ->select($select)
            ->first();

        if (! empty($meta)) {
            $images = $meta->images;
            if (is_string($images)) {
                $images = json_decode($images, true);
            }

            return collect($images)->map(function ($item) {
                return [
                    'src' => RvMedia::getImageUrl($item['img']),
                    'thumb' => RvMedia::getImageUrl($item['img']),
                    'subHtml' => $item['description']
                        ? '<p class="text-sm opacity-80">' . BaseHelper::clean($item['description']) . '</p>'
                        : '',
                ];
            })->values()->toArray();
        }

        return [];
    }
}