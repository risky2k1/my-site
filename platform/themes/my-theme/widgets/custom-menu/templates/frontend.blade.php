@php
    $menuHtml = Menu::generateMenu([
        'slug' => $config['menu_id'],
        'options' => [
            'class' => 'list-unstyled',
        ],
        'view' => 'custom-menu'
    ]);

@endphp

@if ($menuHtml)
    @if ($sidebar == 'footer_sidebar')
        <div class="col-md-3">
            <h4 class="fw-semibold mb-3">{{ $config['name'] }}</h4>
            {!! $menuHtml !!}
        </div>
    @endif
@endif
