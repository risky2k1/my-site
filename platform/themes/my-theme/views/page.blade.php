@php
    Theme::set('page', $page);
@endphp
@if (!BaseHelper::isHomepage($page->id))
    @php
        Theme::set('section-name', SeoHelper::getTitle());
        $page->loadMissing('metadata');

        $bannerImage = $page->getMetaData('banner_image', true);

        if ($bannerImage) {
            Theme::set('breadcrumbBannerImage', RvMedia::getImageUrl($bannerImage));
        }

    @endphp

    @if($page->template == 'timeline')
        <section class="love-gradient pt-5 pb-5 mt-5 text-center text-white position-relative">
            <div class="container position-relative">
                <h1 class="display-3 fw-bold mb-3 script-font">{{ $page->name }}</h1>
                <p class="fs-3 text-white-90 mb-2 script-font">
                    {!! BaseHelper::clean($page->description) !!}
                </p>
                <p class="fs-5 text-white-75 mx-auto" style="max-width: 720px">
                    {{ __("Every milestone, every precious moment, every step we've taken together. This is our story, beautifully unfolding through time.") }}
                </p>
                <div class="position-absolute top-0 start-0 fs-1 opacity-25">💖</div>
                <div class="position-absolute top-0 end-0 fs-2 opacity-25">💕</div>
                <div class="position-absolute bottom-0 start-50 translate-middle-x fs-2 opacity-25">💝</div>
            </div>
        </section>
    @else
        <!-- Hero Section -->
        <section class="gradient-bg pt-5 pb-5 mt-5 text-center text-white">
            <div class="container">
                <h1 class="display-4 fw-bold mb-3 animate-fade-in">
                    {{ $page->name }}
                </h1>
                <p
                    class="fs-5 text-white-50 mx-auto animate-fade-in"
                    style="max-width: 720px"
                >
                    {!! BaseHelper::clean($page->description) !!}
                </p>
            </div>
        </section>
    @endif

    {!! apply_filters(PAGE_FILTER_FRONT_PAGE_CONTENT, BaseHelper::clean($page->content), $page) !!}

@else
    {!! apply_filters(PAGE_FILTER_FRONT_PAGE_CONTENT, BaseHelper::clean($page->content), $page) !!}
    {{--@if (defined('GALLERY_MODULE_SCREEN_NAME') && !empty($galleries = gallery_meta_data($page)))
        {!! render_object_gallery($galleries) !!}
    @endif
    {!! apply_filters(PAGE_FILTER_FRONT_PAGE_CONTENT, Html::tag('div', BaseHelper::clean($page->content), ['class' => 'ck-content'])->toHtml(), $page) !!}--}}
@endif
