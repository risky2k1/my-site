@foreach ($timelineItems as $index => $item)
    @include(Theme::getThemeNamespace() . '::views.timeline.partials.timeline-item', [
        'side' => ($timelineItems->firstItem() + $index) % 2 === 0 ? 'right' : 'left',
        'date' => $item->date,
        'title' => $item->title,
        'description' => $item->description,
        'icon' => $item->icon,
        'color' => $item->color,
        'timelineItem' => $item,
    ])
@endforeach
