<div class="pb-6 border-b border-white/5 last:border-0 last:pb-0">
    <div class="flex justify-between items-start mb-2">
        <div class="flex items-center gap-3">
            <div class="avatar placeholder">
                <div
                    class="bg-gradient-to-br from-primary to-accent text-white rounded-full w-10 h-10 flex items-center justify-center">
                    <span class="text-xs font-bold">JD</span>
                </div>
            </div>
            <div>
                <span class="font-bold text-sm block">John Doe</span>
                <span class="text-xs text-base-content/70">{{ __('Verified Visitor') }}</span>
            </div>
        </div>
        <span class="text-xs text-base-content/70">2 days ago</span>
    </div>
    <div class="rating rating-xs disabled pointer-events-none mb-3">
        @for ($i = 1; $i <= 5; $i++)
            <input type="radio" class="mask mask-star-2 bg-orange-400"
                @if ($i == 5) checked @endif />
        @endfor
    </div>
    <p class="text-sm text-base-content/70 leading-relaxed">"Absolutely loved the vibe!
        The staff was incredibly welcoming and the location is just perfect for a
        weekend getaway."</p>
</div>
