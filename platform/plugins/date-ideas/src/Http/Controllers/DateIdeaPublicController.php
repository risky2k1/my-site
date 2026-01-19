<?php

namespace Botble\DateIdeas\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\DateIdeas\Forms\PlaceForm;
use Botble\DateIdeas\Http\Requests\DateIdeasRequest;
use Botble\DateIdeas\Http\Resources\DateIdeaResource;
use Botble\DateIdeas\Models\DateIdeas;
use Botble\Base\Http\Controllers\BaseController;
use Botble\DateIdeas\Models\Place;
use Botble\DateIdeas\Tables\DateIdeasTable;
use Botble\DateIdeas\Forms\DateIdeasForm;
use Botble\DateIdeas\Tables\PlaceTable;
use Illuminate\Http\Request;

class DateIdeaPublicController extends BaseController
{
    public function index(Request $request)
    {
        $query = Place::query()
            ->wherePublished()
            ->with([
                'categories',
                'moods'
            ]);

        // 🔍 Search
        if ($request->filled('q')) {
            $query->where('name', 'LIKE', '%' . $request->input('q') . '%');
        }

        // 🏷 Category filter
        if ($request->filled('category')) {
            $query->whereHas('categories', function ($q) use ($request) {
                $q->where('slug', $request->input('category'));
            });
        }

        // 📍 Location filter
        if ($request->filled('location')) {
            $query->where('location', $request->input('location'));
        }

        // 💰 Price range
        if ($request->filled('min_price')) {
            $query->where('price', '>=', $request->min_price);
        }
        if ($request->filled('max_price')) {
            $query->where('price', '<=', $request->max_price);
        }

        $ideas = $query->paginate(12);

        return response()->json([
            'data' => DateIdeaResource::collection($ideas),
            'meta' => [
                'current_page' => $ideas->currentPage(),
                'last_page' => $ideas->lastPage(),
                'total' => $ideas->total(),
            ],
        ]);
    }

    public function show(string $slug)
    {
        $idea = Place::query()
            ->where('slug', $slug)
            ->wherePublished()
            ->with(['categories', 'media'])
            ->firstOrFail();

        return response()->json([
            'data' => new DateIdeaResource($idea),
        ]);
    }
}
