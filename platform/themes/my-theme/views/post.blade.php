@php
    Theme::set('section-name', $post->name);
    $post->loadMissing('metadata');

    if ($bannerImage = $post->getMetaData('banner_image', true)) {
        Theme::set('breadcrumbBannerImage', RvMedia::getImageUrl($bannerImage));
    }
@endphp

{{--<article class="post post--single">
    <header class="post__header">
        <h1 class="post__title">{{ $post->name }}</h1>
        <div class="post__meta">
            {!! Theme::partial('blog.post-meta', compact('post')) !!}

            @if ($post->tags->isNotEmpty())
                @php
                    if (is_plugin_active('language') && is_plugin_active('language-advanced')) {
                        $post->tags->loadMissing('translations');
                    }
                @endphp
                <span class="post__tags">
                    {!! BaseHelper::renderIcon('ti ti-tags') !!}
                    @foreach ($post->tags as $tag)
                        <a href="{{ $tag->url }}" class="me-0">{{ $tag->name }}</a>@if (!$loop->last), @endif
                    @endforeach
                </span>
            @endif

            <span class="created_at">
                {!! BaseHelper::renderIcon('ti ti-eye') !!} {{ __(':count views', ['count' => number_format($post->views)]) }}
            </span>
        </div>
    </header>
    <div class="post__content">
        @if (defined('GALLERY_MODULE_SCREEN_NAME') && !empty($galleries = gallery_meta_data($post)))
            {!! render_object_gallery($galleries, ($post->first_category ? $post->first_category->name : __('Uncategorized'))) !!}
        @endif
        <div class="ck-content">{!! BaseHelper::clean($post->content) !!}</div>

        <br>
        <section class="new-item-shar">
            <span>{{ __('Share:') }}</span>

            {!! Theme::renderSocialSharing($post->url, SeoHelper::getDescription(), $post->image) !!}
        </section>
        <br>
    </div>
    @php $relatedPosts = get_related_posts($post->id, 2); @endphp

    @if ($relatedPosts->isNotEmpty())
        <footer class="post__footer">
            <div class="row">
                @foreach ($relatedPosts as $relatedItem)
                    <div class="col-md-6 col-sm-6 col-12">
                        <div class="post__relate-group @if ($loop->last) post__relate-group--right text-end @else text-start @endif">
                            <h4 class="relate__title">@if ($loop->first) {{ __('Previous Post') }} @else {{ __('Next Post') }} @endif</h4>
                            <article class="post post--related">
                                <div class="post__thumbnail"><a href="{{ $relatedItem->url }}" title="{{ $relatedItem->name }}" class="post__overlay"></a>
                                    {{ RvMedia::image($relatedItem->image, $relatedItem->name, 'thumb') }}
                                </div>
                                <header class="post__header">
                                    <p><a href="{{ $relatedItem->url }}" class="post__title"> {{ $relatedItem->name }}</a></p>
                                    <div class="post__meta"><span class="post__created-at">{{ Theme::formatDate($post->created_at) }}</span></div>
                                </header>
                            </article>
                        </div>
                    </div>
                @endforeach
            </div>
        </footer>
    @endif
    <br>
    {!! apply_filters(BASE_FILTER_PUBLIC_COMMENT_AREA, null, $post) !!}
</article>--}}

<!-- Breadcrumb -->

<!-- Article Header -->
<header class="py-5">
    <div class="container text-center">
        <div class="d-flex justify-content-center gap-3 mb-3">
            <span class="badge bg-primary-subtle text-primary px-3 py-2">{{ $post?->categories?->first()?->name }}</span>
            <span class="small text-secondary">{{ $post->created_at }}</span>
            <span class="small text-secondary">•</span>
            <span class="small text-secondary">10 min read</span>
        </div>
        <h1 class="display-5 fw-bold text-dark mb-3">
            {{ $post->name }}
        </h1>
        <p class="fs-5 text-secondary mx-auto" style="max-width: 720px">
            {!! BaseHelper::clean($post->description) !!}
        </p>
        <div class="d-flex justify-content-center align-items-center gap-3 mt-4"
        >
            <div class="rounded-circle gradient-bg d-flex align-items-center justify-content-center"
                 style="width: 48px; height: 48px"
            >
                <i class="fas fa-user text-white"></i>
            </div>
            <div class="text-start">
                <div class="fw-semibold text-dark">{{ $post->author?->name }}</div>
                <div class="small text-secondary">{{ $post->author?->email }}</div>
            </div>
        </div>
    </div>
</header>

<!-- Featured Image -->
<div class="container mb-5">
    <div
        class="gradient-bg rounded-4 d-flex align-items-center justify-content-center"
        style="height: 360px"
    >
        <i class="fab fa-vuejs text-white display-1"></i>
    </div>
</div>

<!-- Article Content -->
<article class="pb-5">
    <div class="container prose">
        {!! BaseHelper::clean($post->content) !!}
    </div>
</article>

<!-- Tags and Social Share -->
<div class="border-top py-4">
    <div
        class="container d-flex flex-wrap justify-content-between align-items-center"
    >
        <div class="d-flex flex-wrap align-items-center gap-2 mb-3 mb-md-0">
            <span class="small text-secondary">Tags:</span>
            @forelse($post->tags as $tag)
                <span class="badge bg-primary-subtle text-primary rounded-pill">{{ $tag->name }}</span>
            @empty
            @endforelse
        </div>
        <div class="d-flex align-items-center gap-3">
            <span class="small text-secondary">Share:</span>
            <a href="#" class="text-primary"><i class="fab fa-twitter"></i></a>
            <a href="#" class="text-primary"><i class="fab fa-facebook"></i></a>
            <a href="#" class="text-primary"><i class="fab fa-linkedin"></i></a>
            <a href="#" class="text-secondary"><i class="fas fa-link"></i></a>
        </div>
    </div>
</div>

<!-- Author Bio -->
<section class="py-5 bg-light">
    <div class="container">
        <div class="card border-0 shadow-sm rounded-4 p-4">
            <div class="d-flex gap-4">
                <div
                    class="rounded-circle gradient-bg d-flex align-items-center justify-content-center flex-shrink-0"
                    style="width: 80px; height: 80px"
                >
                    <i class="fas fa-user text-white fs-4"></i>
                </div>
                <div>
                    <h3 class="h4 fw-bold mb-2">{{ $post->author?->name }}</h3>
                    <p class="text-secondary mb-3">
                        {!! BaseHelper::clean($post->author?->description) !!}
                    </p>
                    <div class="d-flex gap-3">
                        <a href="#" class="text-primary"
                        ><i class="fab fa-twitter fs-5"></i
                            ></a>
                        <a href="#" class="text-primary"
                        ><i class="fab fa-github fs-5"></i
                            ></a>
                        <a href="#" class="text-primary"
                        ><i class="fab fa-linkedin fs-5"></i
                            ></a>
                        <a href="#" class="text-primary"
                        ><i class="fas fa-globe fs-5"></i
                            ></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Related Posts -->
<section class="py-5">
    <div class="container">
        <h2 class="h3 fw-bold text-center mb-4">Related Posts</h2>
        <div class="row g-4">
            @forelse(get_related_posts($post->id, 3) as $item)
                <div class="col-md-4">
                    <article class="card h-100 border-0 shadow-sm rounded-4">
                        <div
                            class="gradient-bg d-flex align-items-center justify-content-center"
                            style="height: 200px"
                        >
                            <i class="fab fa-css3-alt text-white display-5"></i>
                        </div>
                        <div class="card-body">
                            <span class="badge bg-success-subtle text-success mb-2">{{ $item->categories->first()?->name }}</span>
                            <h3 class="h5 fw-bold">
                                {{ $item->name }}
                            </h3>
                            <p class="text-secondary small mb-2">
                                {!! BaseHelper::clean($item->description) !!}
                            </p>
                            <a href="{{ $item->url }}"
                               class="text-primary fw-semibold text-decoration-none"
                            >Read More →</a
                            >
                        </div>
                    </article>
                </div>
            @empty
            @endforelse
        </div>
    </div>
</section>

<!-- Comments Section -->
<section class="py-5 bg-light">
    <div class="container">
        <h2 class="h3 fw-bold mb-4">Comments</h2>
        <!-- Comment Form -->
        <div class="card border-0 shadow-sm rounded-4 p-4 mb-4">
            <h3 class="h5 fw-semibold mb-3">Leave a Comment</h3>
            <form class="row g-3">
                <div class="col-md-6">
                    <input type="text" class="form-control" placeholder="Your Name"/>
                </div>
                <div class="col-md-6">
                    <input
                        type="email"
                        class="form-control"
                        placeholder="Your Email"
                    />
                </div>
                <div class="col-12">
              <textarea
                  rows="4"
                  class="form-control"
                  placeholder="Your Comment"
              ></textarea>
                </div>
                <div class="col-12">
                    <button class="btn btn-primary rounded-pill">Post Comment</button>
                </div>
            </form>
        </div>
        <!-- Existing Comments -->
        <div class="vstack gap-3">
            <div class="card border-0 shadow-sm rounded-4 p-3">
                <div class="d-flex gap-3">
                    <div
                        class="rounded-circle bg-primary text-white d-flex align-items-center justify-content-center"
                        style="width: 40px; height: 40px"
                    >
                        <i class="fas fa-user small"></i>
                    </div>
                    <div>
                        <div class="fw-semibold">
                            John Doe <span class="small text-secondary">2 days ago</span>
                        </div>
                        <p class="text-secondary mb-2">
                            Great tutorial! I've been wanting to learn Vue 3 for a
                            while...
                        </p>
                        <button class="btn btn-link p-0 text-primary">Reply</button>
                    </div>
                </div>
            </div>
            <div class="card border-0 shadow-sm rounded-4 p-3">
                <div class="d-flex gap-3">
                    <div
                        class="rounded-circle bg-secondary text-white d-flex align-items-center justify-content-center"
                        style="width: 40px; height: 40px"
                    >
                        <i class="fas fa-user small"></i>
                    </div>
                    <div>
                        <div class="fw-semibold">
                            Jane Smith
                            <span class="small text-secondary">1 week ago</span>
                        </div>
                        <p class="text-secondary mb-2">
                            The Composition API section was particularly helpful...
                        </p>
                        <button class="btn btn-link p-0 text-primary">Reply</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
