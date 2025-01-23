<ul {!! BaseHelper::clean($options) !!}>
    @foreach ($menu_nodes as $key => $row)
        <li @class(['menu-item', 'menu-item-has-children' => $row->has_child, $row->css_class, 'active' => $row->active])>
            <a href="{{ $row->url }}" target="{{ $row->target }}">
                {!! $row->icon_html !!}
                <span class="menu-title">{{ $row->title }}</span>

                @if ($row->has_child) <span class="toggle-icon">
                    {!! BaseHelper::renderIcon('ti ti-chevron-down') !!}
                </span>@endif
            </a>
            @if ($row->has_child)
                {!!
                    Menu::generateMenu([
                        'menu' => $menu,
                        'menu_nodes' => $row->child,
                        'view' => 'main-menu',
                        'options' => ['class' => 'sub-menu'],
                    ])
                !!}
            @endif
        </li>
    @endforeach
</ul>
