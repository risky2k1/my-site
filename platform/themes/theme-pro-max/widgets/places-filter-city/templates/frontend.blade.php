<!-- City -->
<div class="form-control">
    <h4 class="font-medium mb-3 text-sm uppercase tracking-wide text-base-content/50">
        {{ $config['name'] ?? __('City') }}</h4>
    <div class="space-y-2">
        @foreach ($cities as $city)
            <label class="label cursor-pointer justify-start gap-3 p-0">
                <input type="checkbox" class="checkbox checkbox-sm checkbox-primary rounded border-white/20"
                    name="city_ids[]" value="{{ $city->id }}" />
                <span class="label-text">{{ $city->name }}</span>
            </label>
        @endforeach
    </div>
</div>
