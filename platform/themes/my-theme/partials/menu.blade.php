<ul class="navbar-nav ml-auto">
    <!--Nav Links-->
    @foreach ($menu_nodes as $key => $row)
        <li
            @class(['nav-item', $row->css_class])
        >
            <a href="{{ $row->url }}"
               @class(['nav-link', 'nav-link-has-children' => $row->has_child, $row->css_class, 'active' => $row->active])
               data-scroll-nav="{{ $key }}"
            >{{ $row->title }}</a>
            @if ($row->has_child)
                {!!
                    Menu::generateMenu([
                        'menu' => $menu,
                        'menu_nodes' => $row->child,
                        'view' => 'menu',
                        'options' => ['class' => 'sub-menu'],
                    ])
                !!}
            @endif
        </li>
    @endforeach
</ul>
