<!-- Footer -->
<footer class="bg-dark text-white py-5">
    <div class="container">
        <div class="row g-4">
            {!! dynamic_sidebar('footer_sidebar') !!}

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
