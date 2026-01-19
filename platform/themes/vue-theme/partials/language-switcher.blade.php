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
        $currentLocale = Language::getCurrentLocale();
        $currentLanguage = $supportedLocales[$currentLocale] ?? null;
    @endphp

    <div class="relative group ml-4 selection:bg-none">
        <button class="flex items-center gap-2 text-gray-700 hover:text-primary-600 transition-colors">
            @if (Arr::get($options, 'lang_flag', true) && ($languageDisplay == 'all' || $languageDisplay == 'flag'))
                @if ($currentLanguage && $currentLanguage['lang_flag'])
                    {!! language_flag(Language::getCurrentLocaleFlag(), Language::getCurrentLocaleName()) !!}
                @endif
            @endif

            @if (Arr::get($options, 'lang_name', true) && ($languageDisplay == 'all' || $languageDisplay == 'lang_name'))
                @if ($currentLanguage)
                    <span class="font-medium">{{ $currentLanguage['lang_name'] }}</span>
                @endif
            @endif

            <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>
            </svg>
        </button>

        <div class="absolute top-full right-0 mt-2 w-40 bg-white shadow-lg rounded-md py-2 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300 z-50">
            @foreach ($supportedLocales as $localeCode => $properties)
                @if ($localeCode != $currentLocale)
                    <a href="{{ Language::getSwitcherUrl($localeCode, $properties['lang_code']) }}"
                       class="block px-4 py-2 hover:bg-gray-50 flex items-center gap-2 text-gray-700 hover:text-primary-600 transition-colors">
                        @if (Arr::get($options, 'lang_flag', true) && ($languageDisplay == 'all' || $languageDisplay == 'flag'))
                            @if ($properties['lang_flag'])
                                {!! language_flag($properties['lang_flag'], $properties['lang_name']) !!}
                            @elseif ($properties['lang_flag'])
                                <img src="{{ RvMedia::getImageUrl($properties['lang_flag']) }}" alt="{{ $properties['lang_name'] }}" class="w-4 h-4 rounded-sm object-cover">
                            @endif
                        @endif

                        @if (Arr::get($options, 'lang_name', true) && ($languageDisplay == 'all' || $languageDisplay == 'lang_name'))
                            <span>{{ $properties['lang_name'] }}</span>
                        @endif
                    </a>
                @endif
            @endforeach
        </div>
    </div>
@endif
