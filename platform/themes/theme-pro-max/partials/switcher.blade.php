@php
    $supportedLocales = Language::getSupportedLocales();
    if (empty($options)) {
        $options = [
            'before' => '',
            'lang_flag' => true,
            'lang_name' => true,
            'class' => '',
            'after' => '',
        ];
    }
@endphp


@if ($supportedLocales && count($supportedLocales) > 1)
    @php
        $languageDisplay = setting('language_display', 'all');
    @endphp
    <div class="dropdown dropdown-end">
        <div tabindex="0" role="button" class="btn btn-ghost rounded-btn">
            @if (Arr::get($options, 'lang_flag', true) && ($languageDisplay == 'all' || $languageDisplay == 'flag'))
                {!! language_flag(Language::getCurrentLocaleFlag(), Language::getCurrentLocaleName()) !!}
            @endif
            @if (Arr::get($options, 'lang_name', true) && ($languageDisplay == 'all' || $languageDisplay == 'name'))
                <span>{{ Language::getCurrentLocaleName() }}</span>
            @endif

        </div>
        <ul tabindex="0"
            class="menu dropdown-content bg-base-100 rounded-box z-[1] mt-4 w-52 p-2 shadow {{ Arr::get($options, 'class') }}">

            @foreach ($supportedLocales as $localeCode => $properties)
                @if ($localeCode != Language::getCurrentLocale())
                    <li>
                        <a href="{{ Language::getSwitcherUrl($localeCode, $properties['lang_code']) }}">
                            @if (Arr::get($options, 'lang_flag', true) && ($languageDisplay == 'all' || $languageDisplay == 'flag'))
                                {!! language_flag($properties['lang_flag'], $properties['lang_name']) !!}
                            @endif
                            @if (Arr::get($options, 'lang_name', true) && ($languageDisplay == 'all' || $languageDisplay == 'name'))
                                <span>{{ $properties['lang_name'] }}</span>
                            @endif
                        </a>
                    </li>
                @endif
            @endforeach

        </ul>
    </div>
@endif
