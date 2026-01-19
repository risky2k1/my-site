<ul {!! BaseHelper::clean($options) !!}>
    @foreach ($menu_nodes as $key => $row)
    <li @class([ 'relative group' ,
        $row->css_class,
        ])>
        <a @class([ 'text-gray-700 hover:text-primary-600 transition-colors flex items-center gap-1' , 'text-primary-600 font-medium'=> $row->active,
            ])
            href="{{ url($row->url) }}"
            @if ($row->target !== '_self')
            target="{{ $row->target }}"
            @endif>
            {!! $row->icon_html !!}
            {{ $row->title }}
            @if ($row->has_child)
            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
            </svg>
            @endif
        </a>

        @if ($row->has_child)
        <div class="absolute top-full left-0 mt-2 w-48 bg-white shadow-lg rounded-md py-2 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 z-50">
            {!! Menu::generateMenu([
            'menu' => $menu,
            'menu_nodes' => $row->child,
            'view' => 'main-menu',
            'options' => ['class' => 'block'],
            ]) !!}
        </div>
        @endif
    </li>
    @endforeach
</ul>