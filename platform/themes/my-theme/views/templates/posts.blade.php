@if ($posts->isNotEmpty())
    <!-- Blog Posts Section -->
    <section class="py-5">
        <div class="container">
            <!-- Featured Post -->
            <div class="mb-5">
                <h2 class="h3 fw-bold text-dark mb-4">Featured Post</h2>
                <div
                    class="card card-hover border-0 shadow-lg overflow-hidden rounded-4"
                >
                    <div class="row g-0">
                        <div
                            class="col-md-6 gradient-bg d-flex align-items-center justify-content-center"
                            style="min-height: 260px"
                        >
                            <i class="fas fa-code text-white display-4"></i>
                        </div>
                        <div class="col-md-6 p-4">
                            <div class="d-flex align-items-center gap-3 mb-3">
                                <span class="badge bg-primary-subtle text-primary rounded-pill px-3 py-2">{{ $featuredPost?->categories->first()?->name }}</span>
                                <span class="text-secondary small">{{ $featuredPost?->created_at->translatedFormat('d-m-Y') }}</span>
                            </div>
                            <h3 class="h4 fw-bold mb-3">
                                {{ $featuredPost?->name }}
                            </h3>
                            <p class="text-secondary mb-4">
                                {!! BaseHelper::clean($featuredPost->deacription) !!}
                            </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex align-items-center gap-2">
                                    <div
                                        class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center"
                                        style="width: 32px; height: 32px"
                                    >
                                        <i class="fas fa-user small"></i>
                                    </div>
                                    <span class="fw-medium text-dark">{{ $featuredPost?->author?->name }}</span>
                                </div>
                                <a href="{{ $featuredPost?->url }}"
                                   class="fw-semibold text-primary text-decoration-none"
                                >Read More <i class="fas fa-arrow-right ms-2"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- All Posts -->
            <h2 class="h3 fw-bold text-dark mb-4">All Posts</h2>
            <div class="card border-0 shadow-sm mb-4">
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-md-3">
                            <label class="form-label">Search</label>
                            <input
                                type="text"
                                id="searchInput"
                                class="form-control"
                                placeholder="Search posts..."
                            />
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Category</label>
                            <select id="categoryFilter" class="form-select">
                                <option value="">All Categories</option>
                                <option value="tutorial">Tutorial</option>
                                <option value="tips">Tips</option>
                                <option value="review">Review</option>
                                <option value="news">News</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Sort By</label>
                            <select id="sortBy" class="form-select">
                                <option value="date-desc">Newest First</option>
                                <option value="date-asc">Oldest First</option>
                                <option value="title-asc">Title A-Z</option>
                                <option value="title-desc">Title Z-A</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">View</label>
                            <div class="d-flex gap-2">
                                <button id="gridView" class="btn btn-primary">
                                    <i class="fas fa-th-large"></i>
                                </button>
                                <button id="listView" class="btn btn-outline-secondary">
                                    <i class="fas fa-list"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Posts Grid -->
            <div id="postsContainer" class="row g-4">
                <!-- Example Blog Post -->
                @foreach ($posts as $post)
                    <div class="col-md-6 col-lg-4">
                        <article class="card card-hover border-0 shadow-lg blog-post h-100">
                            <div
                                class="gradient-bg d-flex align-items-center justify-content-center"
                                style="height: 200px"
                            >
                                <i class="fab fa-vuejs display-4 text-white"></i>
                            </div>
                            <div class="card-body">
                                <div class="d-flex justify-content-between mb-2">
                                    <span class="badge bg-primary-subtle text-primary rounded-pill">{{ $post?->categories?->first()?->name }}</span>
                                    <span class="small text-secondary">{{ $post->created_at }}</span>
                                </div>
                                <h3 class="h5 fw-bold mb-2">{{ $post->name }}</h3>
                                <p class="text-secondary mb-3">
                                    {!! BaseHelper::clean($post->description) !!}
                                </p>
                                <div class="d-flex justify-content-between small text-secondary">
                                    <span>5 min read</span>
                                    <a href="{{ $post->url }}"
                                       class="text-primary fw-semibold text-decoration-none"
                                    >Read More →</a>
                                </div>
                            </div>
                        </article>
                    </div>
                @endforeach
                <!-- Add more posts similarly... -->
            </div>

            <!-- Load More Button -->
            <div class="text-center mt-5">
                <button class="btn btn-primary rounded-pill px-4 py-2">
                    Load More Posts
                </button>
            </div>
        </div>
    </section>
@endif

<!-- Newsletter Section -->
<section class="gradient-bg text-center text-white py-5">
    <div class="container">
        <h2 class="h3 fw-bold mb-3">Stay Updated</h2>
        <p class="text-white-50 mb-4">
            Subscribe to get the latest posts and updates delivered directly to
            your inbox.
        </p>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="input-group">
                    <input
                        type="email"
                        class="form-control rounded-start-pill"
                        placeholder="Enter your email"
                    />
                    <button
                        class="btn btn-light text-primary rounded-end-pill fw-semibold"
                    >
                        Subscribe
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>
