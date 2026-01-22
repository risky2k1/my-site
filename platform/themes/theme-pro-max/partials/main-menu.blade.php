<ul {!! BaseHelper::clean($options) !!}>
    @foreach ($menu_nodes as $key => $row)
        <li @class([
            'dropdown' => $row->has_child,
            $row->css_class,
        ])>
            <a @class([
                'font-medium hover:text-primary transition-colors',
                'dropdown-toggle' => $row->has_child,
                'active' => $row->active,
               ])
               href="{{ url($row->url) }}"
               @if ($row->has_child)
               @endif
               @if ($row->target !== '_self')
                   target="{{ $row->target }}"
               @endif>
                {{-- {!! $row->icon_html !!} --}}
                {{ $row->title }}
            </a>

            @if ($row->has_child)
                {!! Menu::generateMenu([
                    'menu' => $menu,
                    'menu_nodes' => $row->child,
                    'view' => 'main-menu',
                    'options' => ['class' => 'dropdown-menu'],
                ]) !!}
            @endif
        </li>
    @endforeach
</ul>

