<!-- Footer -->
<footer class="bg-dark text-white py-5">
    <div class="container">
        <div class="row g-4">
            <div class="col-md-6">
                <div class="h4 fw-bold text-primary mb-2">Portfolio</div>
                <p class="text-white-50 mb-3">Creating amazing digital experiences with passion and creativity.</p>
                <div class="d-flex gap-3">
                    <a href="#" class="text-white-50"><i class="fab fa-github fs-4"></i></a>
                    <a href="#" class="text-white-50"><i class="fab fa-linkedin fs-4"></i></a>
                    <a href="#" class="text-white-50"><i class="fab fa-twitter fs-4"></i></a>
                </div>
            </div>
            <div class="col-md-3">
                <h4 class="fw-semibold mb-3">Quick Links</h4>
                <ul class="list-unstyled">
                    <li><a href="#" class="link-light link-underline-opacity-0 link-underline-opacity-75-hover">Home</a></li>
                    <li><a href="blogs.html" class="link-light link-underline-opacity-0 link-underline-opacity-75-hover">Blog</a></li>
                    <li><a href="favorites.html" class="link-light link-underline-opacity-0 link-underline-opacity-75-hover">Favorites</a></li>
                    <li><a href="#about" class="link-light link-underline-opacity-0 link-underline-opacity-75-hover">About</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h4 class="fw-semibold mb-3">Contact</h4>
                <ul class="list-unstyled text-white-50 mb-0">
                    <li class="mb-1"><i class="fas fa-envelope me-2"></i>hello@yourname.com</li>
                    <li class="mb-1"><i class="fas fa-phone me-2"></i>+1 (555) 123-4567</li>
                    <li class="mb-1"><i class="fas fa-map-marker-alt me-2"></i>New York, NY</li>
                </ul>
            </div>
        </div>
        <hr class="border-secondary opacity-25 my-4"/>
        <div class="text-center text-white-50">
            @if ($copyright = Theme::getSiteCopyright())
                {!! $copyright !!}
            @else
                {{ __('© :year PhmTuns. All rights reserved.', ['year' => date('Y')]) }}
            @endif
        </div>

    </div>
</footer>


{!! Theme::footer() !!}
</body>
</html>
