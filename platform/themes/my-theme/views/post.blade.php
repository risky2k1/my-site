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
<header class="pb-12">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="text-center mb-8">
            <div class="flex items-center justify-center space-x-4 mb-4">
                <span class="px-4 py-2 bg-blue-100 text-blue-800 rounded-full text-sm font-medium">{{ $post?->categories?->first()?->name }}</span>
                <span class="text-gray-500">{{ $post->created_at->translatedFormat('d-m-Y') }}</span>
                <span class="text-gray-500">•</span>
                <span class="text-gray-500">10 min read</span>
            </div>
            <h1 class="text-4xl md:text-5xl font-bold text-gray-900 mb-6">
                {{ $post->name }}
            </h1>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto">
                {!! BaseHelper::clean($post->description) !!}
            </p>
        </div>

        <!-- Author Info -->
        <div class="flex items-center justify-center space-x-4">
            <div class="w-12 h-12 bg-gradient-to-br from-primary to-secondary rounded-full flex items-center justify-center">
                <i class="fas fa-user text-white"></i>
            </div>
            <div>
                <div class="font-semibold text-gray-900">{{ $post->author?->name }}</div>
                <div class="text-gray-500 text-sm">{{ $post->author?->email }}</div>
            </div>
        </div>
    </div>
</header>

<!-- Featured Image -->
<div class="mb-12">
    <div class="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="h-96 gradient-bg rounded-2xl flex items-center justify-center">
            <i class="fas fa-vuejs text-8xl text-white"></i>
        </div>
    </div>
</div>

<!-- Article Content -->
<article class="pb-16">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="prose prose-lg mx-auto">
            {!! BaseHelper::clean($post->content) !!}
        </div>
    </div>
</article>

<!-- Tags and Social Share -->
<div class="border-t border-gray-200 py-8">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex flex-wrap items-center justify-between">
            <div class="flex flex-wrap gap-2 mb-4 md:mb-0">
                <span class="text-sm text-gray-500 mr-2">Tags:</span>
                @forelse($post->tags as $tag)
                    <span class="px-3 py-1 bg-primary/10 text-primary rounded-full text-sm font-medium">{{ $tag->name }}</span>
                @empty
                @endforelse
            </div>

            <div class="flex items-center space-x-4">
                <span class="text-sm text-gray-500">Share:</span>
                <a href="#" class="text-blue-600 hover:text-blue-800 transition-colors">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="#" class="text-blue-600 hover:text-blue-800 transition-colors">
                    <i class="fab fa-facebook"></i>
                </a>
                <a href="#" class="text-blue-600 hover:text-blue-800 transition-colors">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a href="#" class="text-gray-600 hover:text-gray-800 transition-colors">
                    <i class="fas fa-link"></i>
                </a>
            </div>
        </div>
    </div>
</div>

<!-- Author Bio -->
<section class="py-12 bg-gray-100">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="bg-white rounded-2xl p-8 shadow-sm">
            <div class="flex items-start space-x-6">
                <div class="w-20 h-20 bg-gradient-to-br from-primary to-secondary rounded-full flex items-center justify-center flex-shrink-0">
                    <i class="fas fa-user text-white text-2xl"></i>
                </div>
                <div>
                    <h3 class="text-2xl font-bold text-gray-900 mb-2">{{ $post->author?->name }}</h3>
                    <p class="text-gray-600 mb-4">
                        Full Stack Developer with 5+ years of experience building modern web applications.
                        Passionate about Vue.js, React, and creating amazing user experiences.
                        When not coding, you can find me exploring new technologies or playing games.
                    </p>
                    <div class="flex space-x-4">
                        <a href="#" class="text-primary hover:text-secondary transition-colors">
                            <i class="fab fa-twitter text-xl"></i>
                        </a>
                        <a href="#" class="text-primary hover:text-secondary transition-colors">
                            <i class="fab fa-github text-xl"></i>
                        </a>
                        <a href="#" class="text-primary hover:text-secondary transition-colors">
                            <i class="fab fa-linkedin text-xl"></i>
                        </a>
                        <a href="#" class="text-primary hover:text-secondary transition-colors">
                            <i class="fas fa-globe text-xl"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Related Posts -->
<section class="py-16">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h2 class="text-3xl font-bold text-gray-900 mb-8 text-center">Related Posts</h2>

        <div class="grid md:grid-cols-3 gap-8">
            @forelse(get_related_posts($post->id, 3) as $item)
                <article class="bg-white rounded-2xl overflow-hidden shadow-lg hover:shadow-xl transition-shadow">
                    <div class="h-48 bg-gradient-to-br from-pink-500 to-violet-500 flex items-center justify-center">
                        <i class="fab fa-css3-alt text-6xl text-white"></i>
                    </div>
                    <div class="p-6">
                        <div class="flex items-center justify-between mb-3">
                            <span class="px-3 py-1 bg-green-100 text-green-800 rounded-full text-sm font-medium">{{ $item->categories->first()?->name }}</span>
                            <span class="text-gray-500 text-sm">{{ $item->created_at->translatedFormat('d-m-Y') }}</span>
                        </div>
                        <h3 class="text-xl font-bold text-gray-900 mb-3">{{ $item->name }}</h3>
                        <p class="text-gray-600 mb-4">{{ $item->description }}</p>
                        <a href="{{ $item->url }}" class="text-primary hover:text-secondary font-semibold">
                            Read More →
                        </a>
                    </div>
                </article>
            @empty
            @endforelse
        </div>
    </div>
</section>

<!-- Comments Section -->
<section class="py-16 bg-gray-50">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <h2 class="text-3xl font-bold text-gray-900 mb-8">Comments</h2>

        <!-- Comment Form -->
        <div class="bg-white rounded-2xl p-6 shadow-sm mb-8">
            <h3 class="text-xl font-semibold text-gray-900 mb-4">Leave a Comment</h3>
            <form class="space-y-4">
                <div class="grid md:grid-cols-2 gap-4">
                    <input type="text" placeholder="Your Name"
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary/50">
                    <input type="email" placeholder="Your Email"
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary/50">
                </div>
                <textarea rows="4" placeholder="Your Comment"
                          class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary/50"></textarea>
                <button type="submit" class="bg-primary hover:bg-secondary text-white px-6 py-3 rounded-lg font-semibold transition-colors">
                    Post Comment
                </button>
            </form>
        </div>

        <!-- Existing Comments -->
        <div class="space-y-6">
            {{--<div class="bg-white rounded-2xl p-6 shadow-sm">
                <div class="flex items-start space-x-4">
                    <div class="w-10 h-10 bg-primary rounded-full flex items-center justify-center flex-shrink-0">
                        <i class="fas fa-user text-white text-sm"></i>
                    </div>
                    <div class="flex-1">
                        <div class="flex items-center space-x-2 mb-2">
                            <span class="font-semibold text-gray-900">John Doe</span>
                            <span class="text-gray-500 text-sm">2 days ago</span>
                        </div>
                        <p class="text-gray-600 mb-3">
                            Great tutorial! I've been wanting to learn Vue 3 for a while, and this guide really helped me get started.
                            The examples are clear and easy to follow. Thanks for sharing!
                        </p>
                        <button class="text-primary hover:text-secondary text-sm font-medium">Reply</button>
                    </div>
                </div>
            </div>

            <div class="bg-white rounded-2xl p-6 shadow-sm">
                <div class="flex items-start space-x-4">
                    <div class="w-10 h-10 bg-secondary rounded-full flex items-center justify-center flex-shrink-0">
                        <i class="fas fa-user text-white text-sm"></i>
                    </div>
                    <div class="flex-1">
                        <div class="flex items-center space-x-2 mb-2">
                            <span class="font-semibold text-gray-900">Jane Smith</span>
                            <span class="text-gray-500 text-sm">1 week ago</span>
                        </div>
                        <p class="text-gray-600 mb-3">
                            The Composition API section was particularly helpful. I'm migrating from Vue 2 and
                            this article made the transition much smoother. Looking forward to more Vue content!
                        </p>
                        <button class="text-primary hover:text-secondary text-sm font-medium">Reply</button>
                    </div>
                </div>
            </div>--}}
        </div>
    </div>
</section>
