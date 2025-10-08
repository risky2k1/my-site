@php
    $supportedLocales = Language::getSupportedLocales();
    if (empty($options)) {
        $options = [
            'before'    => '',
            'lang_flag' => true,
            'lang_name' => true,
            'class'     => '',
            'after'     => '',
        ];
    }
@endphp

@if ($supportedLocales && count($supportedLocales) > 1)
    @php $languageDisplay = setting('language_display', 'all'); @endphp

    @if (setting('language_switcher_display', 'dropdown') == 'dropdown')
        {!! Arr::get($options, 'before') !!}

        <div class="dropdown">
            <button
                type="button"
                class="btn btn-sm btn-light d-inline-flex align-items-center gap-2 text-nowrap {{ Arr::get($options, 'class') }}"
                data-bs-toggle="dropdown"
                aria-expanded="false"
            >
                @if (Arr::get($options, 'lang_flag', true) && ($languageDisplay == 'all' || $languageDisplay == 'flag'))
                    {!! language_flag(Language::getCurrentLocaleFlag(), Language::getCurrentLocaleName()) !!}
                @endif
                @if (Arr::get($options, 'lang_name', true) && ($languageDisplay == 'all' || $languageDisplay == 'name'))
                    <span class="text-nowrap">{{ Language::getCurrentLocaleName() }}</span>
                @endif
                <i class="fas fa-chevron-down opacity-75 small"></i>
            </button>

            <ul class="dropdown-menu dropdown-menu-end shadow language_bar_chooser">
                @foreach ($supportedLocales as $localeCode => $properties)
                    @if ($localeCode != Language::getCurrentLocale())
                        <li>
                            <a
                                href="{{ Language::getSwitcherUrl($localeCode, $properties['lang_code']) }}"
                                class="dropdown-item d-flex align-items-center gap-2"
                            >
                                @if (Arr::get($options, 'lang_flag', true) && ($languageDisplay == 'all' || $languageDisplay == 'flag'))
                                    {!! language_flag($properties['lang_flag'], $properties['lang_name']) !!}
                                @endif
                                @if (Arr::get($options, 'lang_name', true) && ($languageDisplay == 'all' || $languageDisplay == 'name'))
                                    <span class="text-truncate">{{ $properties['lang_name'] }}</span>
                                @endif
                            </a>
                        </li>
                    @endif
                @endforeach
            </ul>
        </div>

        {!! Arr::get($options, 'after') !!}
    @else
        {{-- Dạng list (không dropdown) --}}
        <ul class="language_bar_list d-flex align-items-center gap-2 list-unstyled mb-0 {{ Arr::get($options, 'class') }}">
            @foreach ($supportedLocales as $localeCode => $properties)
                @if ($localeCode != Language::getCurrentLocale())
                    <li>
                        <a
                            href="{{ Language::getSwitcherUrl($localeCode, $properties['lang_code']) }}"
                            class="btn btn-sm btn-outline-secondary d-inline-flex align-items-center gap-2"
                        >
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
    @endif
@endif
