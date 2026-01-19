<?php

namespace Botble\DateIdeas\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class DateIdeaResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'slug' => $this->slug,
            'description' => $this->description,
            'priceRange' => $this->price_range->label(),
            'address' => $this->address,
            'thumbnail' => $this->image,
            'categories' => $this->categories->map(fn($c) => [
                'name' => $c->name,
            ]),
            'moods' => $this->moods->map(fn($m) => [
                'name' => $m->name,
            ]),
        ];
    }
}
