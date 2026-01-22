        <footer class="footer footer-center p-10 border-t border-white/10 text-base-content/60 rounded">
            <div>
               @if ($copyright = Theme::getSiteCopyright())
                            <p >{!! $copyright !!}</p>
                        @else
                            <p >&copy; {{ __('© :year Tuan. All rights reserved.', ['year' => date('Y')]) }}</p>
                        @endif

            </div>
        </footer>

        {!! Theme::footer() !!}
    </body>
</html>
