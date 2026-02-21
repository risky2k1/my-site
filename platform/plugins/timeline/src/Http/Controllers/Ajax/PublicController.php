<?php

namespace Botble\Timeline\Http\Controllers\Ajax;

use Botble\Base\Http\Controllers\BaseController;
use Botble\Timeline\Repositories\Interfaces\TimelineInterface;
use Illuminate\Http\Request;
use Botble\Theme\Facades\Theme;
use Botble\Timeline\Models\TimelineItem;

class PublicController extends BaseController
{
    public function getTimelines(Request $request)
    {
        $page = (int) $request->input('page', 1);

        $timelineItems = TimelineItem::query()
            ->select('id','title','description','content','date', 'order','icon')
            ->wherePublished()
            ->where('timeline_id', 1)
            ->orderByRaw('CASE WHEN `order` > 0 THEN 0 ELSE 1 END')
            ->orderByRaw('CASE WHEN `date` IS NOT NULL THEN 0 ELSE 1 END')
            ->orderBy('order', 'asc')
            ->orderBy('date', 'asc')
            ->orderBy('id', 'asc')
            ->paginate(5, ['*'], 'page', $page);

        

        // 3️⃣ Render HTML items
        $html = view(Theme::getThemeNamespace() . '::views.timeline.partials.timeline-items', [
            'timelineItems' => $timelineItems,
        ])->render();

        return response()->json([
            'html' => $html,
            'meta' => [
                'current_page' => $timelineItems->currentPage(),
                'last_page' => $timelineItems->lastPage(),
                'has_more' => $timelineItems->hasMorePages(),
                'total' => $timelineItems->total(),
            ],
        ]);
    }
}