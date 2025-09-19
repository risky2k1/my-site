{{--<footer class="bg-dark text-white mt-5 py-4">
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-3">
                <h5>{{ __('About Us') }}</h5>
                <p class="text-white-50">{{ __('Your website description goes here. Configure in Admin → Appearance → Theme options.') }}</p>

                @if ($socialLinks = Theme::getSocialLinks())
                    <div class="d-flex gap-2">
                        @foreach($socialLinks as $socialLink)
                            @continue(! $icon = $socialLink->getIconHtml())

                            <a {{ $socialLink->getAttributes() }} class="text-white-50">
                                {!! $icon !!}
                            </a>
                        @endforeach
                    </div>
                @endif
            </div>

            <div class="col-md-4 mb-3">
                <h5>{{ __('Quick Links') }}</h5>
                <ul>
                    <li><a href="/about" class="text-white-50 text-decoration-none">{{ __('About Us') }}</a></li>
                    <li><a href="/services" class="text-white-50 text-decoration-none">{{ __('Services') }}</a></li>
                    <li><a href="/contact" class="text-white-50 text-decoration-none">{{ __('Contact') }}</a></li>
                    <li><a href="/blog" class="text-white-50 text-decoration-none">{{ __('Blog') }}</a></li>
                    <li><a href="/faq" class="text-white-50 text-decoration-none">{{ __('FAQ') }}</a></li>
                </ul>
            </div>

            <div class="col-md-4 mb-3">
                <h5>{{ __('Contact') }}</h5>
                <p class="mb-1">
                    <x-core::icon name="mail" />
                    <a href="mailto:contact@example.com" class="text-white-50 text-decoration-none">
                        contact@example.com
                    </a>
                </p>
                <p class="mb-1">
                    <x-core::icon name="phone" />
                    <a href="tel:0342234333" class="text-white-50 text-decoration-none">
                        0342234333
                    </a>
                </p>

                <p class="mb-1 text-white-50">
                    <x-core::icon name="map-pin" />
                    {{ __('123 Main Street, City, Country') }}
                </p>
            </div>
        </div>

        <hr class="border-secondary">
        <div class="row">
            <div class="col-md-6">
                @if ($copyright = Theme::getSiteCopyright())
                    <p class="mb-0 text-white-50">{!! $copyright !!}</p>
                @else
                    <p class="mb-0 text-white-50">{{ __('© :year YourCompany. All rights reserved.', ['year' => date('Y')]) }}</p>
                @endif
            </div>
            <div class="col-md-6 text-md-end">
                <a href="/privacy-policy" class="text-white-50 text-decoration-none me-2">{{ __('Privacy') }}</a>
                <a href="/terms-of-service" class="text-white-50 text-decoration-none">{{ __('Terms') }}</a>
            </div>
        </div>
    </div>
</footer>--}}
<!-- Footer -->
<footer class="bg-gray-900 text-white py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid md:grid-cols-4 gap-8">
            <div class="md:col-span-2">
                <div class="text-2xl font-bold text-primary mb-4">Portfolio</div>
                <p class="text-gray-400 mb-4">
                    Creating amazing digital experiences with passion and creativity.
                </p>
                <div class="flex space-x-4">
                    <a
                        href="#"
                        class="text-gray-400 hover:text-white transition-colors"
                    >
                        <i class="fab fa-github text-xl"></i>
                    </a>
                    <a
                        href="#"
                        class="text-gray-400 hover:text-white transition-colors"
                    >
                        <i class="fab fa-linkedin text-xl"></i>
                    </a>
                    <a
                        href="#"
                        class="text-gray-400 hover:text-white transition-colors"
                    >
                        <i class="fab fa-twitter text-xl"></i>
                    </a>
                </div>
            </div>

            <div>
                <h4 class="font-semibold mb-4">Quick Links</h4>
                <ul class="space-y-2">
                    <li>
                        <a
                            href="#"
                            class="text-gray-400 hover:text-white transition-colors"
                        >Home</a
                        >
                    </li>
                    <li>
                        <a
                            href="blogs.html"
                            class="text-gray-400 hover:text-white transition-colors"
                        >Blog</a
                        >
                    </li>
                    <li>
                        <a
                            href="favorites.html"
                            class="text-gray-400 hover:text-white transition-colors"
                        >Favorites</a
                        >
                    </li>
                    <li>
                        <a
                            href="#about"
                            class="text-gray-400 hover:text-white transition-colors"
                        >About</a
                        >
                    </li>
                </ul>
            </div>

            <div>
                <h4 class="font-semibold mb-4">Contact</h4>
                <ul class="space-y-2 text-gray-400">
                    <li><i class="fas fa-envelope mr-2"></i>hello@yourname.com</li>
                    <li><i class="fas fa-phone mr-2"></i>+1 (555) 123-4567</li>
                    <li><i class="fas fa-map-marker-alt mr-2"></i>New York, NY</li>
                </ul>
            </div>
        </div>

        <div class="border-t border-gray-800 mt-8 pt-8 text-center">
            @if ($copyright = Theme::getSiteCopyright())
                <p class="text-gray-400">{!! $copyright !!}</p>
            @else
                <p class="text-gray-400">{{ __('© :year PhmTuns. All rights reserved.', ['year' => date('Y')]) }}</p>
            @endif
        </div>
    </div>
</footer>
{!! Theme::footer() !!}
</body>
</html>
