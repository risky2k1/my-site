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

        <div class="relative" x-data="{ open: false }" @keydown.escape.window="open = false">
            <button
                type="button"
                class="inline-flex items-center gap-2 rounded-lg border border-white/20 bg-white/10 px-3 py-2 text-sm font-medium text-white backdrop-blur hover:bg-white/20 focus:outline-none focus:ring-2 focus:ring-white/40"
                @click="open = !open"
                aria-haspopup="true"
                :aria-expanded="open.toString()"
            >
                @if (Arr::get($options, 'lang_flag', true) && ($languageDisplay == 'all' || $languageDisplay == 'flag'))
                    {!! language_flag(Language::getCurrentLocaleFlag(), Language::getCurrentLocaleName()) !!}
                @endif
                @if (Arr::get($options, 'lang_name', true) && ($languageDisplay == 'all' || $languageDisplay == 'name'))
                    <span class="whitespace-nowrap">{{ Language::getCurrentLocaleName() }}</span>
                @endif>
                <i class="fas fa-chevron-down text-xs opacity-80"></i>
            </button>

            <ul
                x-cloak
                x-show="open"
                @click.outside="open = false"
                x-transition.origin.top.right
                class="absolute right-0 z-50 mt-2 w-44 overflow-hidden rounded-xl border border-white/20 bg-white/90 shadow-lg backdrop-blur language_bar_chooser {{ Arr::get($options, 'class') }}"
            >
                @foreach ($supportedLocales as $localeCode => $properties)
                    @if ($localeCode != Language::getCurrentLocale())
                        <li>
                            <a
                                href="{{ Language::getSwitcherUrl($localeCode, $properties['lang_code']) }}"
                                class="flex items-center gap-2 px-3 py-2 text-sm text-gray-800 hover:bg-white"
                            >
                                @if (Arr::get($options, 'lang_flag', true) && ($languageDisplay == 'all' || $languageDisplay == 'flag'))
                                    {!! language_flag($properties['lang_flag'], $properties['lang_name']) !!}
                                @endif
                                @if (Arr::get($options, 'lang_name', true) && ($languageDisplay == 'all' || $languageDisplay == 'name'))
                                    <span class="truncate">{{ $properties['lang_name'] }}</span>
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
        <ul class="language_bar_list flex items-center gap-2 {{ Arr::get($options, 'class') }}">
            @foreach ($supportedLocales as $localeCode => $properties)
                @if ($localeCode != Language::getCurrentLocale())
                    <li>
                        <a
                            href="{{ Language::getSwitcherUrl($localeCode, $properties['lang_code']) }}"
                            class="inline-flex items-center gap-2 rounded-md px-2 py-1 text-sm text-white/90 hover:bg-white/10"
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
