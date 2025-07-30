<!--Home Section Start-->
<section id="home" class="banner"
         style="background-image: url('{{ $shortcode->banner_image ? RvMedia::getImageUrl($shortcode->banner_image) : Theme::asset()->url('images/background/home-banner-bg.jpg') }}')"
         data-stellar-background-ratio=".7" data-scroll-index="0">
    <!--Particles Container-->
    <div id="particles-js"></div>
    <div class="container">
        <!--Banner Content-->
        <div class="banner-caption">
            <h1>{{ __('Hi! Im :name.', ['name' => theme_option('my_name', 'PhmTuns')]) }}</h1>
            <p class="cd-headline clip mt-30">
                <span>{{ __('Developer located in :locale', ['locale' => theme_option('my_address','Ha Noi - Viet Nam')]) }}.</span><br>
                <span class="blc">{{ __('Specialized in') }}</span>
                <span class="cd-words-wrapper">
                    @foreach(json_decode(theme_option('my_skills'), true) as $skill)
                        <b class="@if($loop->first) is-visible @endif">{{ $skill[0]['value'] }}
                            {!! BaseHelper::renderIcon($skill[1]['value']) !!}</b>
                    @endforeach
                    </span>
            </p>
        </div>
        <div class="arrow bounce">
            <a class="fa fa-chevron-down fa-2x" href="#" data-scroll-nav="1"></a>
        </div>
    </div>
</section>
<!--Home Section End-->
