<!-- Main Content -->
<section class="py-5">
    <div class="container">
        <div class="row g-4">
            <!-- Sidebar Filters -->
            <aside class="col-lg-3">
                <div class="card border-0 shadow-sm rounded-4 mb-4">
                    <div class="card-body">
                        <h5 class="fw-semibold mb-3">Filters & Search</h5>
                        <div class="mb-3">
                            <label class="form-label">
                                <i class="fas fa-search me-2"></i>Search
                            </label>
                            <input
                                type="text"
                                id="searchInput"
                                class="form-control"
                                placeholder="Search by name..."
                            />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">
                                <i class="fas fa-tags me-2"></i>{{ __('Categories') }}
                            </label>
                            <div class="vstack gap-2">
                                @foreach($categories as $category)
                                    <div class="form-check">
                                        <input
                                            class="form-check-input category-filter"
                                            type="checkbox"
                                            value="games"
                                            name="categories[]"
                                        /><label class="form-check-label">{{ $category->name }}</label>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">
                                <i class="fas fa-star me-2"></i>Minimum Rating
                            </label>
                            <div class="vstack gap-2">
                                <div class="form-check">
                                    <input
                                        class="form-check-input"
                                        type="radio"
                                        name="rating"
                                        value="0"
                                        checked
                                    /><label class="form-check-label">Any Rating</label>
                                </div>
                                <div class="form-check">
                                    <input
                                        class="form-check-input"
                                        type="radio"
                                        name="rating"
                                        value="3"
                                    /><label class="form-check-label">3+ Stars</label>
                                </div>
                                <div class="form-check">
                                    <input
                                        class="form-check-input"
                                        type="radio"
                                        name="rating"
                                        value="4"
                                    /><label class="form-check-label">4+ Stars</label>
                                </div>
                                <div class="form-check">
                                    <input
                                        class="form-check-input"
                                        type="radio"
                                        name="rating"
                                        value="5"
                                    /><label class="form-check-label">5 Stars</label>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label"
                            ><i class="fas fa-dollar-sign me-2"></i>Price Range</label
                            >
                            <input
                                type="range"
                                class="form-range"
                                id="priceRange"
                                min="0"
                                max="200"
                                value="200"
                            />
                            <div class="text-center small">
                                Max: $<span id="priceValue">200</span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label"
                            ><i class="fas fa-sort me-2"></i>Sort By</label
                            >
                            <select id="sortBy" class="form-select">
                                <option value="name-asc">Name (A → Z)</option>
                                <option value="name-desc">Name (Z → A)</option>
                                <option value="rating-desc">Rating (High → Low)</option>
                                <option value="rating-asc">Rating (Low → High)</option>
                                <option value="price-desc">Price (High → Low)</option>
                                <option value="price-asc">Price (Low → High)</option>
                                <option value="year-desc">Year (Newest First)</option>
                                <option value="year-asc">Year (Oldest First)</option>
                            </select>
                        </div>
                        <button
                            id="clearFilters"
                            class="btn btn-outline-secondary w-100"
                        >
                            <i class="fas fa-times me-2"></i>Clear All Filters
                        </button>
                    </div>
                </div>
            </aside>

            <!-- Items -->
            <main class="col-lg-9">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <h2 class="h4 fw-bold">My Collection</h2>
                        <p class="text-secondary small" id="resultsCount">
                            Showing 12 of 12 items
                        </p>
                    </div>
                    <div class="d-flex align-items-center gap-2">
                        <span class="small text-secondary">View:</span>
                        <button id="gridViewBtn" class="btn btn-primary">
                            <i class="fas fa-th-large"></i>
                        </button>
                        <button id="listViewBtn" class="btn btn-outline-secondary">
                            <i class="fas fa-list"></i>
                        </button>
                    </div>
                </div>
                <div id="itemsContainer" class="row g-4">
                    <div class="col-md-6 col-xl-4">
                        <div
                            class="card card-hover border-0 shadow-sm h-100 favorite-item"
                            data-category="games"
                            data-name="The Legend of Zelda"
                            data-rating="5"
                            data-price="60"
                            data-year="2017"
                        >
                            <div
                                class="gradient-bg d-flex align-items-center justify-content-center"
                                style="height: 200px"
                            >
                                <i class="fas fa-gamepad text-white display-4"></i>
                            </div>
                            <div class="card-body">
                    <span class="badge bg-success-subtle text-success mb-2"
                    >Game</span
                    >
                                <h5 class="fw-bold">The Legend of Zelda</h5>
                                <p class="small text-secondary mb-2">
                                    Action Adventure • Nintendo • 2017
                                </p>
                                <a
                                    href="favorite-detail.html"
                                    class="fw-semibold text-primary text-decoration-none small"
                                >View Details →</a
                                >
                            </div>
                        </div>
                    </div>
                    <!-- Add more cards like above -->
                </div>
                <div id="noResults" class="text-center py-5 d-none">
                    <div class="text-secondary display-3 mb-2">
                        <i class="fas fa-search"></i>
                    </div>
                    <h5 class="fw-semibold mb-2">No items found</h5>
                    <p class="text-secondary small mb-3">
                        Try adjusting your filters or search terms
                    </p>
                    <button
                        id="clearFiltersFromNoResults"
                        class="btn btn-link text-primary"
                    >
                        Clear all filters
                    </button>
                </div>
                <div class="text-center mt-4" id="loadMoreSection">
                    <button id="loadMoreBtn" class="btn btn-primary rounded-pill">
                        <i class="fas fa-plus me-2"></i>Load More Items
                    </button>
                    <p class="text-secondary small mt-2">Showing 12 of 24 items</p>
                </div>
            </main>
        </div>
    </div>
</section>

<!-- Newsletter -->
<section class="gradient-bg text-center text-white py-5">
    <div class="container">
        <h2 class="h4 fw-bold mb-3">Stay Updated</h2>
        <p class="text-white-50 mb-4">
            Get notified when I add new favorites or reviews.
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
