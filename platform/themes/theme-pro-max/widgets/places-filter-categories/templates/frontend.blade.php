<!-- Categories -->
<div class="mb-6 form-control">
    <h4 class="font-medium mb-3 text-sm uppercase tracking-wide text-base-content/50">
        {{ $config['name'] ?? __('Categories') }}</h4>
    <div class="space-y-2">
        @foreach ($categories as $category)
            <label class="label cursor-pointer justify-start gap-3 p-0">
                <input type="checkbox" class="checkbox checkbox-sm checkbox-primary rounded border-white/20" name="category_ids[]" value="{{ $category->id }}" />
                <span class="label-text">{{ $category->name }}</span>
            </label>
        @endforeach
    </div>
</div>
