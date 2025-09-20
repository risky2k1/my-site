{{--<ul {!! BaseHelper::clean($options) !!}>--}}
    @foreach ($menu_nodes as $key => $row)
        <a
            href="{{ url($row->url) }}"
            @if ($row->target !== '_self')
                target="{{ $row->target }}"
            @endif
            class="text-gray-700 hover:text-primary transition-colors font-medium"
        >{{ $row->title }}</a
        >
    @endforeach
{{--</ul>--}}

