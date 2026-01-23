<?php

namespace Botble\DateIdeas\Supports;

use Botble\Base\Enums\BaseStatusEnum;

class FilterPlace
{
    public static function setFilters(array $request): array
    {
        if (isset($request['order'])) {
            $request['order'] = strtolower($request['order']);
        }

        return [
            'page' => $request['page'] ?? 1,
            'per_page' => $request['per_page'] ?? 10,
            'search' => $request['search'] ?? null,
            'exclude' => $request['exclude'] ?? null,
            'include' => $request['include'] ?? null,
            'order' => isset($request['order']) && in_array($request['order'], ['asc', 'desc']) ? $request['order'] : 'desc',
            'order_by' => $request['order_by'] ?? 'created_at',
            'status' => BaseStatusEnum::PUBLISHED,
            'categories' => $request['category_ids'] ?? null,
            'categories_exclude' => $request['categories_exclude'] ?? null,
            'moods' => $request['mood_ids'] ?? null,
            'moods_exclude' => $request['moods_exclude'] ?? null,
            'price_range' => $request['price_ids'] ?? null,
            'price_range_exclude' => $request['price_range_exclude'] ?? null,
            'city' => $request['city_ids'] ?? null,
            'rating' => $request['rating_ids'] ?? null,
        ];
    }
}
