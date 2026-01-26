<!-- Place -->
@foreach ($places as $place)
    @include(Theme::getThemeNamespace() . '::views.date-ideas.partials.place-item', [
        'place' => $place,
    ])
@endforeach
