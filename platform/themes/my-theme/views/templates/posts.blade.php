@if ($posts->isNotEmpty())
    {{--@foreach ($posts as $post)
        <article class="post post__horizontal mb-40 clearfix">
            <div class="post__thumbnail">
                {{ RvMedia::image($post->image, $post->name, 'medium') }}
                <a
                    class="post__overlay"
                    href="{{ $post->url }}"
                    title="{{ $post->name }}"
                ></a>
            </div>
            <div class="post__content-wrap">
                <header class="post__header">
                    <h3 class="post__title"><a
                            href="{{ $post->url }}"
                            title="{{ $post->name }}"
                        >{{ $post->name }}</a></h3>
                    <div class="post__meta">
                        {!! Theme::partial('blog.post-meta', compact('post')) !!}
                    </div>
                </header>
                <div class="post__content p-0">
                    <p data-number-line="4">{{ $post->description }}</p>
                </div>
            </div>
        </article>
    @endforeach
    <div class="page-pagination text-right">
        {!! $posts->withQueryString()->links() !!}
    </div>--}}

    <!-- Blog Posts Section -->
    <section class="py-16">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <!-- Featured Post -->
            <div class="mb-16">
                <h2 class="text-3xl font-bold text-gray-900 mb-8">{{ __('Featured Post') }}</h2>
                <div class="card-hover bg-white rounded-2xl overflow-hidden shadow-lg">
                    <div class="md:flex">
                        <div class="md:w-1/2 h-64 md:h-auto gradient-bg flex items-center justify-center">
                            <i class="fas fa-code text-6xl text-white"></i>
                        </div>
                        <div class="md:w-1/2 p-8">
                            <div class="flex items-center space-x-4 mb-4">
                                <span class="px-3 py-1 bg-primary/10 text-primary rounded-full text-sm font-medium">
                                    {{ $featuredPost?->categories->first()?->name }}
                                </span>
                                <span class="text-gray-500 text-sm">
                                    {{ $featuredPost?->created_at->translatedFormat('d-m-Y') }}
                                </span>
                            </div>
                            <h3 class="text-2xl font-bold text-gray-900 mb-4">
                                {{ $featuredPost?->name }}
                            </h3>
                            <p class="text-gray-600 mb-6 leading-relaxed">
                                {!! BaseHelper::clean($featuredPost->deacription) !!}
                            </p>
                            <div class="flex items-center justify-between">
                                <div class="flex items-center space-x-2">
                                    <div class="w-8 h-8 bg-primary rounded-full flex items-center justify-center">
                                        <i class="fas fa-user text-white text-sm"></i>
                                    </div>
                                    <span class="text-gray-700 font-medium">{{ $featuredPost?->author?->name }}</span>
                                </div>
                                <a href="{{ $featuredPost?->url }}" class="text-primary hover:text-secondary font-semibold flex items-center">
                                    Read More
                                    <i class="fas fa-arrow-right ml-2"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- All Posts -->
            <div class="mb-8">
                <h2 class="text-3xl font-bold text-gray-900 mb-8">All Posts</h2>

                <!-- Filter and Search -->
                <div class="bg-white p-6 rounded-lg shadow-sm mb-8">
                    <div class="grid md:grid-cols-4 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Search</label>
                            <input type="text" id="searchInput" placeholder="Search posts..."
                                   class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary/50">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Category</label>
                            <select id="categoryFilter" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary/50">
                                <option value="">All Categories</option>
                                <option value="tutorial">Tutorial</option>
                                <option value="tips">Tips</option>
                                <option value="review">Review</option>
                                <option value="news">News</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Sort By</label>
                            <select id="sortBy" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary/50">
                                <option value="date-desc">Newest First</option>
                                <option value="date-asc">Oldest First</option>
                                <option value="title-asc">Title A-Z</option>
                                <option value="title-desc">Title Z-A</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">View</label>
                            <div class="flex space-x-2">
                                <button id="gridView" class="px-3 py-2 bg-primary text-white rounded-md">
                                    <i class="fas fa-th-large"></i>
                                </button>
                                <button id="listView" class="px-3 py-2 bg-gray-200 text-gray-700 rounded-md">
                                    <i class="fas fa-list"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Posts Grid -->
            <div id="postsContainer" class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                <!-- Blog Post Item -->
                @foreach ($posts as $post)
                    <article class="blog-post card-hover bg-white rounded-2xl overflow-hidden shadow-lg"
                             data-title="{{ $post->name }}"
                             data-category="{{ $post->categories->first()->name }}"
                             data-date="{{ $post->created_at->translatedFormat('Y-m-d') }}">
                        <div class="h-48 gradient-bg flex items-center justify-center">
                            <i class="fas fa-vuejs text-6xl text-white"></i>
                        </div>
                        <div class="p-6">
                            <div class="flex items-center justify-between mb-3">
                                <span class="px-3 py-1 bg-blue-100 text-blue-800 rounded-full text-sm font-medium">{{ $post->categories->first()->name }}</span>
                                <span class="text-gray-500 text-sm">{{ $post->created_at->translatedFormat('Y-m-d') }}</span>
                            </div>
                            <h3 class="text-xl font-bold text-gray-900 mb-3">{{ $post->name }}</h3>
                            <p class="text-gray-600 mb-4 leading-relaxed">
                                {!! BaseHelper::clean($post->description) !!}
                            </p>
                            <div class="flex items-center justify-between">
                                <div class="text-sm text-gray-500">5 min read</div>
                                <a href="{{ $post?->url }}" class="text-primary hover:text-secondary font-semibold">
                                    Read More →
                                </a>
                            </div>
                        </div>
                    </article>
                @endforeach
            </div>

            <!-- Load More Button -->
            <div class="text-center mt-12">
                <button class="bg-primary hover:bg-secondary text-white px-8 py-3 rounded-full font-semibold transition-colors">
                    Load More Posts
                </button>
            </div>
        </div>
    </section>
@endif

<!-- Newsletter Section -->
<section class="py-16 gradient-bg">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <h2 class="text-3xl font-bold text-white mb-4">Stay Updated</h2>
        <p class="text-white/90 mb-8">
            Subscribe to get the latest posts and updates delivered directly to your inbox.
        </p>
        <div class="max-w-md mx-auto flex">
            <input type="email" placeholder="Enter your email"
                   class="flex-1 px-4 py-3 rounded-l-full focus:outline-none focus:ring-2 focus:ring-white/50">
            <button class="bg-white text-primary px-6 py-3 rounded-r-full font-semibold hover:bg-gray-100 transition-colors">
                Subscribe
            </button>
        </div>
    </div>
</section>
