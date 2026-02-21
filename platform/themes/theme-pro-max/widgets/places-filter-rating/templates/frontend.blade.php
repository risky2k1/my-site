<!-- Rating -->
<div class="mb-6 form-control">
    <h4 class="font-medium mb-3 text-sm uppercase tracking-wide text-base-content/50">
        {{ $config['name'] ?? __('Rating') }}</h4>
    <div class="space-y-2">
        <label class="label cursor-pointer justify-start gap-3 p-0">
            <input type="checkbox" class="checkbox checkbox-sm checkbox-primary rounded border-white/20"
                name="rating_ids[]" value="5" />
            <div class="rating rating-xs disabled pointer-events-none">
                <input type="radio" name="rating-1" class="mask mask-star-2 bg-orange-400" disabled />
                <input type="radio" name="rating-1" class="mask mask-star-2 bg-orange-400" disabled />
                <input type="radio" name="rating-1" class="mask mask-star-2 bg-orange-400" disabled />
                <input type="radio" name="rating-1" class="mask mask-star-2 bg-orange-400" disabled />
                <input type="radio" name="rating-1" class="mask mask-star-2 bg-orange-400" disabled />
            </div>
            <span class="label-text ml-1">5 Stars</span>
        </label>
        <label class="label cursor-pointer justify-start gap-3 p-0">
            <input type="checkbox" class="checkbox checkbox-sm checkbox-primary rounded border-white/20"
                name="rating_ids[]" value="4" />
            <div class="rating rating-xs disabled pointer-events-none">
                <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" disabled />
                <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" disabled />
                <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" disabled />
                <input type="radio" name="rating-2" class="mask mask-star-2 bg-orange-400" disabled />
                <input type="radio" name="rating-2" class="mask mask-star-2 bg-white/20" disabled />
            </div>
            <span class="label-text ml-1">4 Stars & up</span>
        </label>
        <label class="label cursor-pointer justify-start gap-3 p-0">
            <input type="checkbox" class="checkbox checkbox-sm checkbox-primary rounded border-white/20"
                name="rating_ids[]" value="3" />
            <div class="rating rating-xs disabled pointer-events-none">
                <input type="radio" name="rating-3" class="mask mask-star-2 bg-orange-400" disabled />
                <input type="radio" name="rating-3" class="mask mask-star-2 bg-orange-400" disabled />
                <input type="radio" name="rating-3" class="mask mask-star-2 bg-orange-400" disabled />
                <input type="radio" name="rating-3" class="mask mask-star-2 bg-white/20" disabled />
                <input type="radio" name="rating-3" class="mask mask-star-2 bg-white/20" disabled />
            </div>
            <span class="label-text ml-1">3 Stars & up</span>
        </label>
        <label class="label cursor-pointer justify-start gap-3 p-0">
            <input type="checkbox" class="checkbox checkbox-sm checkbox-primary rounded border-white/20"
                name="rating_ids[]" value="2" />
            <div class="rating rating-xs disabled pointer-events-none">
                <input type="radio" name="rating-3" class="mask mask-star-2 bg-orange-400" disabled />
                <input type="radio" name="rating-3" class="mask mask-star-2 bg-orange-400" disabled />
                <input type="radio" name="rating-3" class="mask mask-star-2 bg-white/20" disabled />
                <input type="radio" name="rating-3" class="mask mask-star-2 bg-white/20" disabled />
                <input type="radio" name="rating-3" class="mask mask-star-2 bg-white/20" disabled />
            </div>
            <span class="label-text ml-1">2 Stars & up</span>
        </label>
        <label class="label cursor-pointer justify-start gap-3 p-0">
            <input type="checkbox" class="checkbox checkbox-sm checkbox-primary rounded border-white/20"
                name="rating_ids[]" value="1" />
            <div class="rating rating-xs disabled pointer-events-none">
                <input type="radio" name="rating-3" class="mask mask-star-2 bg-orange-400" disabled />
                <input type="radio" name="rating-3" class="mask mask-star-2 bg-white/20" disabled />
                <input type="radio" name="rating-3" class="mask mask-star-2 bg-white/20" disabled />
                <input type="radio" name="rating-3" class="mask mask-star-2 bg-white/20" disabled />
                <input type="radio" name="rating-3" class="mask mask-star-2 bg-white/20" disabled />
            </div>
            <span class="label-text ml-1">1 Stars & up</span>
        </label>
    </div>
</div>
