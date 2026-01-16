<?php

namespace Botble\Timetable\Http\Controllers;

use Botble\Base\Http\Actions\DeleteResourceAction;
use Botble\Timetable\Http\Requests\TimetableRequest;
use Botble\Timetable\Models\TimetableEvent;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Timetable\Tables\TimetableTable;
use Botble\Timetable\Forms\TimetableForm;
use Illuminate\Http\Request;

class TimetableController extends BaseController
{
    public function index()
    {
        $events = TimetableEvent::all()->map(function ($item) {
            return [
                'id' => $item->id,
                'title' => $item->title,
                'start' => $item->start_date->format('Y-m-d') . 'T' . $item->start_time,
                'end' => $item->start_date->format('Y-m-d') . 'T' . $item->end_time,
                'color' => $item->color ?? '#667eea',
                'borderColor' => $item->color ?? '#667eea',
                'extendedProps' => [
                    'room' => $item->room,
                    'teacher' => $item->teacher,
                    'note' => $item->note,
                    'is_recurring' => $item->is_recurring,
                    'start_date' => $item->start_date->toDateString(),
                    'end_date' => $item->end_date?->toDateString(),
                    'weekday' => $item->weekday,
                    'start_time' => $item->start_time,
                    'end_time' => $item->end_time,
                    'color' => $item->color,
                ],
            ];
        });

        return response()->json($events);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'title' => 'required|string|max:255',
            'room' => 'nullable|string|max:120',
            'teacher' => 'nullable|string|max:120',
            'start_date' => 'required|date',
            'end_date' => 'nullable|date',
            'weekday' => 'required|integer|min:0|max:6',
            'start_time' => 'required',
            'end_time' => 'required',
            'color' => 'nullable|string|max:10',
            'note' => 'nullable|string',
            'is_recurring' => 'nullable|boolean',
        ]);

        $event = TimetableEvent::create($data);

        return response()->json([
            'success' => true,
            'event' => $event
        ]);
    }

}
