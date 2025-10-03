<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Journey - Portfolio</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#667eea',
                        secondary: '#764ba2',
                        accent: '#f093fb',
                        rose: '#f43f5e',
                        pink: '#ec4899'
                    }
                }
            }
        }
    </script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Dancing+Script:wght@400;500;600;700&display=swap');

        * {
            font-family: 'Inter', sans-serif;
        }

        .script-font {
            font-family: 'Dancing Script', cursive;
        }

        .gradient-bg {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .love-gradient {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 50%, #4facfe 100%);
        }

        .glass-effect {
            backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.95);
        }

        /* Timeline Styles */
        .timeline {
            position: relative;
        }

        .timeline::before {
            content: '';
            position: absolute;
            left: 50%;
            top: 0;
            height: 100%;
            width: 4px;
            background: linear-gradient(to bottom, #f093fb, #667eea, #4facfe);
            transform: translateX(-50%);
            z-index: 1;
        }

        .timeline-item {
            opacity: 0;
            transform: translateY(50px);
            transition: all 0.8s ease-out;
            margin-bottom: 4rem;
        }

        .timeline-item.animate-in {
            opacity: 1;
            transform: translateY(0);
        }

        .timeline-item:nth-child(odd) .timeline-content {
            margin-right: calc(50% + 2rem);
            text-align: right;
        }

        .timeline-item:nth-child(even) .timeline-content {
            margin-left: calc(50% + 2rem);
            text-align: left;
        }

        .timeline-marker {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #f093fb, #667eea);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            z-index: 2;
            box-shadow: 0 0 20px rgba(240, 147, 251, 0.5);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .timeline-marker:hover {
            transform: translateX(-50%) scale(1.1);
            box-shadow: 0 0 30px rgba(240, 147, 251, 0.8);
        }

        .timeline-card {
            background: white;
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(240, 147, 251, 0.2);
            position: relative;
            transition: all 0.3s ease;
        }

        .timeline-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            border-color: rgba(240, 147, 251, 0.4);
        }

        .timeline-card::before {
            content: '';
            position: absolute;
            top: 50%;
            width: 0;
            height: 0;
            border: 15px solid transparent;
        }

        .timeline-item:nth-child(odd) .timeline-card::before {
            right: -30px;
            border-left-color: white;
            transform: translateY(-50%);
        }

        .timeline-item:nth-child(even) .timeline-card::before {
            left: -30px;
            border-right-color: white;
            transform: translateY(-50%);
        }

        .floating-hearts {
            position: absolute;
            width: 100%;
            height: 100%;
            overflow: hidden;
            pointer-events: none;
        }

        .heart {
            position: absolute;
            color: rgba(240, 147, 251, 0.6);
            font-size: 20px;
            animation: float-heart 8s infinite linear;
        }

        @keyframes float-heart {
            0% {
                transform: translateY(100vh) rotate(0deg);
                opacity: 1;
            }
            100% {
                transform: translateY(-100px) rotate(360deg);
                opacity: 0;
            }
        }

        .memory-photo {
            width: 100%;
            height: 200px;
            border-radius: 15px;
            background: linear-gradient(45deg, #f093fb, #667eea);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
            color: white;
            font-size: 3rem;
            position: relative;
            overflow: hidden;
        }

        .memory-photo::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255,255,255,0.1), transparent);
            transform: rotate(45deg);
            animation: shimmer 3s infinite;
        }

        @keyframes shimmer {
            0% { transform: translateX(-100%) translateY(-100%) rotate(45deg); }
            100% { transform: translateX(100%) translateY(100%) rotate(45deg); }
        }

        .fade-in-up {
            animation: fadeInUp 1s ease-out;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Mobile responsive */
        @media (max-width: 768px) {
            .timeline::before {
                left: 2rem;
            }

            .timeline-marker {
                left: 2rem;
            }

            .timeline-item:nth-child(odd) .timeline-content,
            .timeline-item:nth-child(even) .timeline-content {
                margin-left: 5rem;
                margin-right: 1rem;
                text-align: left;
            }

            .timeline-item:nth-child(odd) .timeline-card::before,
            .timeline-item:nth-child(even) .timeline-card::before {
                left: -30px;
                right: auto;
                border-left-color: transparent;
                border-right-color: white;
            }
        }
    </style>
</head>
<body class="bg-gray-50 relative overflow-x-hidden">
<!-- Floating Hearts Background -->
<div class="floating-hearts" id="floating-hearts"></div>

<!-- Navigation -->
<nav class="fixed w-full top-0 z-50 glass-effect border-b border-white/20">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center py-4">
            <div class="text-2xl font-bold text-primary">Portfolio</div>
            <div class="hidden md:flex space-x-8">
                <a href="index.html" class="text-gray-700 hover:text-primary transition-colors font-medium">Home</a>
                <a href="blogs.html" class="text-gray-700 hover:text-primary transition-colors font-medium">Blog</a>
                <a href="favorites.html" class="text-gray-700 hover:text-primary transition-colors font-medium">Favorites</a>
                <a href="#" class="text-primary font-medium">Our Journey</a>
                <a href="index.html#contact" class="text-gray-700 hover:text-primary transition-colors font-medium">Contact</a>
            </div>
            <button class="md:hidden text-gray-700">
                <i class="fas fa-bars text-xl"></i>
            </button>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="love-gradient pt-24 pb-20 relative overflow-hidden">
    <div class="absolute inset-0 bg-black/10"></div>
    <div class="relative z-10 max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <div class="fade-in-up">
            <h1 class="text-6xl md:text-8xl font-bold text-white mb-6 script-font">
                Our Journey
            </h1>
            <p class="text-2xl md:text-3xl text-white/90 mb-4 script-font">
                A Love Story Written in Time
            </p>
            <p class="text-lg text-white/80 max-w-2xl mx-auto leading-relaxed">
                Every milestone, every precious moment, every step we've taken together.
                This is our story, beautifully unfolding through time.
            </p>
        </div>

        <!-- Decorative Hearts -->
        <div class="absolute top-10 left-10 text-4xl text-white/30 animate-pulse">💖</div>
        <div class="absolute top-20 right-20 text-3xl text-white/20 animate-pulse" style="animation-delay: 1s;">💕</div>
        <div class="absolute bottom-10 left-1/4 text-2xl text-white/25 animate-pulse" style="animation-delay: 2s;">💝</div>
        <div class="absolute bottom-20 right-1/3 text-5xl text-white/15 animate-pulse" style="animation-delay: 0.5s;">💗</div>
    </div>
</section>

<!-- Timeline Section -->
<section class="py-20">
    <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
        <!-- Section Header -->
        <div class="text-center mb-16">
            <h2 class="text-4xl font-bold text-gray-900 mb-4">Our Milestones</h2>
            <p class="text-xl text-gray-600">Every moment that brought us closer together</p>
        </div>

        <!-- Timeline -->
        <div class="timeline relative">
            <!-- First Meet -->
            <div class="timeline-item relative" data-year="2021">
                <div class="timeline-marker">
                    <i class="fas fa-heart"></i>
                </div>
                <div class="timeline-content">
                    <div class="timeline-card">
                        <div class="memory-photo">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="mb-4">
                                <span class="inline-block bg-pink-100 text-pink-800 px-3 py-1 rounded-full text-sm font-medium mb-2">
                                    First Meeting
                                </span>
                            <h3 class="text-2xl font-bold text-gray-900 mb-2 script-font">The Day We Met</h3>
                            <p class="text-gray-500 text-sm mb-3">March 15, 2021 • Coffee Shop</p>
                        </div>
                        <p class="text-gray-600 leading-relaxed mb-4">
                            It was a rainy Tuesday morning when our eyes first met across the crowded coffee shop.
                            You were reading a book, and I was pretending to work on my laptop while stealing glances.
                            Who knew that asking about your book would change everything?
                        </p>
                        <div class="flex items-center text-sm text-gray-500">
                            <i class="fas fa-map-marker-alt mr-2"></i>
                            <span>Starbucks, Downtown</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- First Date -->
            <div class="timeline-item relative" data-year="2021">
                <div class="timeline-marker">
                    <i class="fas fa-wine-glass"></i>
                </div>
                <div class="timeline-content">
                    <div class="timeline-card">
                        <div class="memory-photo bg-gradient-to-br from-purple-500 to-pink-500">
                            <i class="fas fa-utensils"></i>
                        </div>
                        <div class="mb-4">
                                <span class="inline-block bg-purple-100 text-purple-800 px-3 py-1 rounded-full text-sm font-medium mb-2">
                                    First Date
                                </span>
                            <h3 class="text-2xl font-bold text-gray-900 mb-2 script-font">Dinner Under the Stars</h3>
                            <p class="text-gray-500 text-sm mb-3">April 2, 2021 • Italian Restaurant</p>
                        </div>
                        <p class="text-gray-600 leading-relaxed mb-4">
                            You wore that beautiful blue dress, and I was so nervous I could barely eat.
                            We talked for hours about dreams, travel, and life. The restaurant closed around us,
                            but we were too lost in conversation to notice.
                        </p>
                        <div class="flex items-center justify-between">
                            <div class="flex items-center text-sm text-gray-500">
                                <i class="fas fa-map-marker-alt mr-2"></i>
                                <span>Bella Vista Restaurant</span>
                            </div>
                            <div class="text-2xl">🌟</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Official Relationship -->
            <div class="timeline-item relative" data-year="2021">
                <div class="timeline-marker">
                    <i class="fas fa-heart-broken"></i>
                </div>
                <div class="timeline-content">
                    <div class="timeline-card">
                        <div class="memory-photo bg-gradient-to-br from-red-500 to-pink-500">
                            <i class="fas fa-hand-holding-heart"></i>
                        </div>
                        <div class="mb-4">
                                <span class="inline-block bg-red-100 text-red-800 px-3 py-1 rounded-full text-sm font-medium mb-2">
                                    Official
                                </span>
                            <h3 class="text-2xl font-bold text-gray-900 mb-2 script-font">Officially Together</h3>
                            <p class="text-gray-500 text-sm mb-3">May 20, 2021 • Beach Sunset</p>
                        </div>
                        <p class="text-gray-600 leading-relaxed mb-4">
                            Walking along the beach at sunset, I finally found the courage to ask you to be my girlfriend.
                            Your smile lit up brighter than the setting sun, and when you said yes,
                            I knew my heart had found its home.
                        </p>
                        <div class="flex items-center justify-between">
                            <div class="flex items-center text-sm text-gray-500">
                                <i class="fas fa-map-marker-alt mr-2"></i>
                                <span>Sunset Beach</span>
                            </div>
                            <div class="text-2xl">💕</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- First Trip -->
            <div class="timeline-item relative" data-year="2021">
                <div class="timeline-marker">
                    <i class="fas fa-plane"></i>
                </div>
                <div class="timeline-content">
                    <div class="timeline-card">
                        <div class="memory-photo bg-gradient-to-br from-blue-500 to-cyan-500">
                            <i class="fas fa-mountain"></i>
                        </div>
                        <div class="mb-4">
                                <span class="inline-block bg-blue-100 text-blue-800 px-3 py-1 rounded-full text-sm font-medium mb-2">
                                    Adventure
                                </span>
                            <h3 class="text-2xl font-bold text-gray-900 mb-2 script-font">First Trip Together</h3>
                            <p class="text-gray-500 text-sm mb-3">August 14, 2021 • Mountain Retreat</p>
                        </div>
                        <p class="text-gray-600 leading-relaxed mb-4">
                            Our first adventure together! Three days in the mountains, hiking trails,
                            roasting marshmallows by the campfire, and falling asleep under a blanket of stars.
                            This trip showed us we were perfect travel companions.
                        </p>
                        <div class="flex items-center justify-between">
                            <div class="flex items-center text-sm text-gray-500">
                                <i class="fas fa-map-marker-alt mr-2"></i>
                                <span>Rocky Mountains</span>
                            </div>
                            <div class="text-2xl">🏔️</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Meeting Parents -->
            <div class="timeline-item relative" data-year="2021">
                <div class="timeline-marker">
                    <i class="fas fa-home"></i>
                </div>
                <div class="timeline-content">
                    <div class="timeline-card">
                        <div class="memory-photo bg-gradient-to-br from-green-500 to-emerald-500">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="mb-4">
                                <span class="inline-block bg-green-100 text-green-800 px-3 py-1 rounded-full text-sm font-medium mb-2">
                                    Family
                                </span>
                            <h3 class="text-2xl font-bold text-gray-900 mb-2 script-font">Meeting the Parents</h3>
                            <p class="text-gray-500 text-sm mb-3">November 25, 2021 • Thanksgiving</p>
                        </div>
                        <p class="text-gray-600 leading-relaxed mb-4">
                            The big day! Meeting your parents for Thanksgiving dinner. I was so nervous,
                            but your mom's warm hug and your dad's jokes made me feel like family immediately.
                            Your little sister even approved of me!
                        </p>
                        <div class="flex items-center justify-between">
                            <div class="flex items-center text-sm text-gray-500">
                                <i class="fas fa-map-marker-alt mr-2"></i>
                                <span>Family Home</span>
                            </div>
                            <div class="text-2xl">👨‍👩‍👧‍👦</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- First Anniversary -->
            <div class="timeline-item relative" data-year="2022">
                <div class="timeline-marker">
                    <i class="fas fa-gift"></i>
                </div>
                <div class="timeline-content">
                    <div class="timeline-card">
                        <div class="memory-photo bg-gradient-to-br from-yellow-500 to-orange-500">
                            <i class="fas fa-birthday-cake"></i>
                        </div>
                        <div class="mb-4">
                                <span class="inline-block bg-yellow-100 text-yellow-800 px-3 py-1 rounded-full text-sm font-medium mb-2">
                                    Milestone
                                </span>
                            <h3 class="text-2xl font-bold text-gray-900 mb-2 script-font">One Year Together</h3>
                            <p class="text-gray-500 text-sm mb-3">May 20, 2022 • Rooftop Dinner</p>
                        </div>
                        <p class="text-gray-600 leading-relaxed mb-4">
                            Our first anniversary! A rooftop dinner overlooking the city lights,
                            a photo album of all our memories, and a promise ring that made you cry happy tears.
                            365 days of love, laughter, and growing together.
                        </p>
                        <div class="flex items-center justify-between">
                            <div class="flex items-center text-sm text-gray-500">
                                <i class="fas fa-map-marker-alt mr-2"></i>
                                <span>Sky Lounge</span>
                            </div>
                            <div class="text-2xl">🎉</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Moving In -->
            <div class="timeline-item relative" data-year="2022">
                <div class="timeline-marker">
                    <i class="fas fa-key"></i>
                </div>
                <div class="timeline-content">
                    <div class="timeline-card">
                        <div class="memory-photo bg-gradient-to-br from-indigo-500 to-purple-500">
                            <i class="fas fa-home"></i>
                        </div>
                        <div class="mb-4">
                                <span class="inline-block bg-indigo-100 text-indigo-800 px-3 py-1 rounded-full text-sm font-medium mb-2">
                                    Big Step
                                </span>
                            <h3 class="text-2xl font-bold text-gray-900 mb-2 script-font">Moving In Together</h3>
                            <p class="text-gray-500 text-sm mb-3">September 10, 2022 • Our First Apartment</p>
                        </div>
                        <p class="text-gray-600 leading-relaxed mb-4">
                            The boxes, the chaos, the excitement! Our first place together - a cozy apartment
                            that we turned into a home. Learning each other's quirks, morning routines,
                            and how you steal all the blankets at night.
                        </p>
                        <div class="flex items-center justify-between">
                            <div class="flex items-center text-sm text-gray-500">
                                <i class="fas fa-map-marker-alt mr-2"></i>
                                <span>Oak Street Apartment</span>
                            </div>
                            <div class="text-2xl">🏠</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Current/Future -->
            <div class="timeline-item relative" data-year="2024">
                <div class="timeline-marker">
                    <i class="fas fa-infinity"></i>
                </div>
                <div class="timeline-content">
                    <div class="timeline-card">
                        <div class="memory-photo bg-gradient-to-br from-pink-500 to-rose-500">
                            <i class="fas fa-heart"></i>
                        </div>
                        <div class="mb-4">
                                <span class="inline-block bg-rose-100 text-rose-800 px-3 py-1 rounded-full text-sm font-medium mb-2">
                                    Forever
                                </span>
                            <h3 class="text-2xl font-bold text-gray-900 mb-2 script-font">Our Story Continues</h3>
                            <p class="text-gray-500 text-sm mb-3">Present • Every Day</p>
                        </div>
                        <p class="text-gray-600 leading-relaxed mb-4">
                            Every day we write new chapters of our love story. From quiet Sunday mornings
                            to spontaneous adventures, from supporting each other's dreams to building our future together.
                            This timeline is just the beginning of forever.
                        </p>
                        <div class="flex items-center justify-between">
                            <div class="flex items-center text-sm text-gray-500">
                                <i class="fas fa-map-marker-alt mr-2"></i>
                                <span>Wherever we are together</span>
                            </div>
                            <div class="text-2xl">💖</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Love Counter Section -->
<section class="py-16 love-gradient">
    <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
        <h2 class="text-4xl font-bold text-white mb-8 script-font">Together We've Shared</h2>

        <div class="grid md:grid-cols-4 gap-8">
            <div class="bg-white/20 backdrop-blur-sm rounded-2xl p-6 text-white">
                <div class="text-4xl font-bold mb-2" id="days-counter">0</div>
                <div class="text-sm opacity-90">Days Together</div>
            </div>
            <div class="bg-white/20 backdrop-blur-sm rounded-2xl p-6 text-white">
                <div class="text-4xl font-bold mb-2" id="memories-counter">0</div>
                <div class="text-sm opacity-90">Beautiful Memories</div>
            </div>
            <div class="bg-white/20 backdrop-blur-sm rounded-2xl p-6 text-white">
                <div class="text-4xl font-bold mb-2" id="adventures-counter">0</div>
                <div class="text-sm opacity-90">Adventures</div>
            </div>
            <div class="bg-white/20 backdrop-blur-sm rounded-2xl p-6 text-white">
                <div class="text-4xl font-bold mb-2">∞</div>
                <div class="text-sm opacity-90">Love & More to Come</div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="bg-gray-900 text-white py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid md:grid-cols-4 gap-8">
            <div class="md:col-span-2">
                <div class="text-2xl font-bold text-primary mb-4">Portfolio</div>
                <p class="text-gray-400 mb-4">
                    Creating amazing digital experiences with passion and creativity.
                </p>
                <div class="flex space-x-4">
                    <a href="#" class="text-gray-400 hover:text-white transition-colors">
                        <i class="fab fa-github text-xl"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-white transition-colors">
                        <i class="fab fa-linkedin text-xl"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-white transition-colors">
                        <i class="fab fa-twitter text-xl"></i>
                    </a>
                </div>
            </div>

            <div>
                <h4 class="font-semibold mb-4">Quick Links</h4>
                <ul class="space-y-2">
                    <li><a href="index.html" class="text-gray-400 hover:text-white transition-colors">Home</a></li>
                    <li><a href="blogs.html" class="text-gray-400 hover:text-white transition-colors">Blog</a></li>
                    <li><a href="favorites.html" class="text-gray-400 hover:text-white transition-colors">Favorites</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition-colors">Our Journey</a></li>
                </ul>
            </div>

            <div>
                <h4 class="font-semibold mb-4">Contact</h4>
                <ul class="space-y-2 text-gray-400">
                    <li><i class="fas fa-envelope mr-2"></i>hello@yourname.com</li>
                    <li><i class="fas fa-phone mr-2"></i>+1 (555) 123-4567</li>
                    <li><i class="fas fa-map-marker-alt mr-2"></i>New York, NY</li>
                </ul>
            </div>
        </div>

        <div class="border-t border-gray-800 mt-8 pt-8 text-center">
            <p class="text-gray-400">© 2024 Your Name. All rights reserved. Made with 💖</p>
        </div>
    </div>
</footer>

<script>
    // Timeline Animation on Scroll
    const observerOptions = {
        threshold: 0.3,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate-in');
            }
        });
    }, observerOptions);

    // Observe all timeline items
    document.querySelectorAll('.timeline-item').forEach(item => {
        observer.observe(item);
    });

    // Floating Hearts Animation
    function createFloatingHeart() {
        const heartsContainer = document.getElementById('floating-hearts');
        const heart = document.createElement('div');
        heart.className = 'heart';
        heart.innerHTML = ['💖', '💕', '💗', '💝', '💘'][Math.floor(Math.random() * 5)];

        // Random position and animation duration
        heart.style.left = Math.random() * 100 + '%';
        heart.style.animationDuration = (Math.random() * 3 + 5) + 's';
        heart.style.animationDelay = Math.random() * 2 + 's';

        heartsContainer.appendChild(heart);

        // Remove heart after animation
        setTimeout(() => {
            heart.remove();
        }, 8000);
    }

    // Create floating hearts periodically
    setInterval(createFloatingHeart, 2000);

    // Counter Animation
    function animateCounter(element, target, duration = 2000) {
        let start = 0;
        const increment = target / (duration / 16);

        const timer = setInterval(() => {
            start += increment;
            if (start >= target) {
                element.textContent = target;
                clearInterval(timer);
            } else {
                element.textContent = Math.floor(start);
            }
        }, 16);
    }

    // Calculate days together (from May 20, 2021)
    function calculateDaysTogether() {
        const startDate = new Date('2021-05-20');
        const today = new Date();
        const timeDiff = today.getTime() - startDate.getTime();
        const daysDiff = Math.ceil(timeDiff / (1000 * 3600 * 24));
        return daysDiff;
    }

    // Animate counters when they come into view
    const counterObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const daysCounter = document.getElementById('days-counter');
                const memoriesCounter = document.getElementById('memories-counter');
                const adventuresCounter = document.getElementById('adventures-counter');

                if (daysCounter && !daysCounter.classList.contains('animated')) {
                    daysCounter.classList.add('animated');
                    animateCounter(daysCounter, calculateDaysTogether());
                    animateCounter(memoriesCounter, 847);
                    animateCounter(adventuresCounter, 23);
                }
            }
        });
    }, { threshold: 0.5 });

    // Observe counter section
    const counterSection = document.querySelector('.love-gradient');
    if (counterSection) {
        counterObserver.observe(counterSection);
    }

    // Add hover effects to timeline cards
    document.querySelectorAll('.timeline-card').forEach(card => {
        card.addEventListener('mouseenter', () => {
            card.style.transform = 'translateY(-10px) scale(1.02)';
        });

        card.addEventListener('mouseleave', () => {
            card.style.transform = 'translateY(0) scale(1)';
        });
    });

    // Mobile menu toggle
    const mobileMenuBtn = document.querySelector('.md\\:hidden button');
    const navLinks = document.querySelector('.md\\:flex');

    if (mobileMenuBtn && navLinks) {
        mobileMenuBtn.addEventListener('click', () => {
            navLinks.classList.toggle('hidden');
            navLinks.classList.toggle('flex');
        });
    }

    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });

    // Add sparkle effect to timeline markers on hover
    document.querySelectorAll('.timeline-marker').forEach(marker => {
        marker.addEventListener('mouseenter', () => {
            // Create sparkle elements
            for (let i = 0; i < 6; i++) {
                const sparkle = document.createElement('div');
                sparkle.style.cssText = `
                        position: absolute;
                        width: 4px;
                        height: 4px;
                        background: white;
                        border-radius: 50%;
                        pointer-events: none;
                        animation: sparkle 1s ease-out forwards;
                    `;

                const angle = (i * 60) * Math.PI / 180;
                const distance = 30;
                sparkle.style.left = `calc(50% + ${Math.cos(angle) * distance}px)`;
                sparkle.style.top = `calc(50% + ${Math.sin(angle) * distance}px)`;

                marker.appendChild(sparkle);

                setTimeout(() => sparkle.remove(), 1000);
            }
        });
    });

    // Add sparkle animation keyframes
    const style = document.createElement('style');
    style.textContent = `
            @keyframes sparkle {
                0% {
                    transform: scale(0) rotate(0deg);
                    opacity: 1;
                }
                50% {
                    transform: scale(1) rotate(180deg);
                    opacity: 1;
                }
                100% {
                    transform: scale(0) rotate(360deg);
                    opacity: 0;
                }
            }
        `;
    document.head.appendChild(style);

    // Add parallax effect to hero section
    window.addEventListener('scroll', () => {
        const scrolled = window.pageYOffset;
        const heroSection = document.querySelector('.love-gradient');
        const parallaxElements = heroSection.querySelectorAll('.absolute');

        parallaxElements.forEach((element, index) => {
            const speed = 0.3 + (index * 0.1);
            element.style.transform = `translateY(${scrolled * speed}px)`;
        });
    });

    // Add typing effect to hero title (optional)
    function typeWriter(element, text, speed = 100) {
        let i = 0;
        element.textContent = '';

        function type() {
            if (i < text.length) {
                element.textContent += text.charAt(i);
                i++;
                setTimeout(type, speed);
            }
        }
        type();
    }

    // Initialize typing effect on page load
    document.addEventListener('DOMContentLoaded', () => {
        const heroTitle = document.querySelector('.script-font');
        if (heroTitle) {
            // Uncomment the line below if you want typing effect
            // typeWriter(heroTitle, 'Our Journey', 150);
        }
    });

    // Add click handler for timeline items to expand/show more details
    document.querySelectorAll('.timeline-card').forEach(card => {
        card.addEventListener('click', () => {
            // Add a gentle pulse effect when clicked
            card.style.animation = 'pulse 0.6s ease-in-out';
            setTimeout(() => {
                card.style.animation = '';
            }, 600);

            // You could expand this to show a modal with more photos/details
            console.log('Timeline item clicked - could open detailed view');
        });
    });

    // Add CSS for pulse animation
    const pulseStyle = document.createElement('style');
    pulseStyle.textContent = `
            @keyframes pulse {
                0% { transform: scale(1); }
                50% { transform: scale(1.05); }
                100% { transform: scale(1); }
            }
        `;
    document.head.appendChild(pulseStyle);

    // Add intersection observer for timeline line animation
    const timelineObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const timeline = document.querySelector('.timeline::before');
                // You could animate the timeline line growing as user scrolls
            }
        });
    }, { threshold: 0.1 });

    document.querySelectorAll('.timeline-item').forEach(item => {
        timelineObserver.observe(item);
    });
</script>
</body>
</html>
