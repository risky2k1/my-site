<!--Home Section Start-->
<section id="home" class="banner"
         style="background-image: url('{{ $shortcode->banner_image ? RvMedia::getImageUrl($shortcode->banner_image) : Theme::asset()->url('images/background/home-banner-bg.jpg') }}')"
         data-stellar-background-ratio=".7" data-scroll-index="0">
    <!--Particles Container-->
    <div id="particles-js"></div>
    <div class="container">
        <!--Banner Content-->
        <div class="banner-caption">
            <h1>Hi! I'm Kalvin.</h1>
            <p class="cd-headline clip mt-30">
                <span>Creative Designer & Developer located in New York.</span><br>
                <span class="blc">Specialized in</span>
                <span class="cd-words-wrapper">
                        <b class="is-visible">Creating Websites.</b>
                        <b>Designing Logo.</b>
                        <b>Designing UI/UX.</b>
                    </span>
            </p>
        </div>
        <div class="arrow bounce">
            <a class="fa fa-chevron-down fa-2x" href="#" data-scroll-nav="1"></a>
        </div>
    </div>
</section>
<!--Home Section End-->
