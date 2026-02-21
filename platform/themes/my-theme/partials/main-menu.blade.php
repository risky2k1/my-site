<ul class="navbar-nav ms-auto mb-2 mb-md-0">
    @foreach ($menu_nodes as $key => $row)
        <li class="nav-item">
            <a class="nav-link fw-medium text-body"
               href="{{ url($row->url) }}"
               @if ($row->target !== '_self')
                   target="{{ $row->target }}"
                @endif
            >
                {{ $row->title }}
            </a>
        </li>
    @endforeach
</ul>
