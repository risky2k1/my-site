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

    {!! apply_filters(PAGE_FILTER_FRONT_PAGE_CONTENT, BaseHelper::clean($page->content), $page) !!}

@else
    {!! apply_filters(PAGE_FILTER_FRONT_PAGE_CONTENT, BaseHelper::clean($page->content), $page) !!}
    {{--@if (defined('GALLERY_MODULE_SCREEN_NAME') && !empty($galleries = gallery_meta_data($page)))
        {!! render_object_gallery($galleries) !!}
    @endif
    {!! apply_filters(PAGE_FILTER_FRONT_PAGE_CONTENT, Html::tag('div', BaseHelper::clean($page->content), ['class' => 'ck-content'])->toHtml(), $page) !!}--}}
@endif
