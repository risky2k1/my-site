        </div>

        <footer class="bg-gray-900 text-white py-12">
            <div class="container-custom">
                <div class="text-center">
                    @if ($copyright = Theme::getSiteCopyright())
                    <p class="text-gray-400">{!! $copyright !!}</p>
                    @else
                    <p class="text-gray-400">{{ __('© :year. All rights reserved.', ['year' => date('Y')]) }}</p>
                    @endif

                    @if ($socialLinks = Theme::getSocialLinks())
                    <div class="flex justify-center gap-4 mt-4">
                        @foreach($socialLinks as $socialLink)
                        @continue(! $icon = $socialLink->getIconHtml())
                        <a {{ $socialLink->getAttributes() }} class="text-gray-400 hover:text-primary-400 transition-colors">
                            {!! $icon !!}
                        </a>
                        @endforeach
                    </div>
                    @endif
                </div>
            </div>
        </footer>

        {!! Theme::footer() !!}
        </body>

        </html>