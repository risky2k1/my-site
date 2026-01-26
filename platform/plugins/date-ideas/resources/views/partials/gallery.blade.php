<div id="place-lightgallery" class="grid grid-cols-2 md:grid-cols-4 gap-2 h-full">
    @foreach ($galleries as $index => $item)
        @php
            $image = $item['img'] ?? $item;
        @endphp

        {{-- Ảnh đầu: to hơn --}}
        @if ($index === 0)
            <a href="{{ RvMedia::getImageUrl($image) }}"
                class="col-span-2 row-span-2 block relative overflow-hidden rounded-lg group">
                <img src="{{ RvMedia::getImageUrl($image) }}" alt=""
                    class="w-full h-full object-cover transition-transform duration-300 group-hover:scale-105" />
                @if ($item['description'])
                    <div
                        class="absolute inset-0 bg-black/60 flex items-center justify-center text-white text-2xl font-semibold">
                        {{ $item['description'] }}
                    </div>
                @endif
            </a>
        @else
            <a href="{{ RvMedia::getImageUrl($image) }}" class="block relative overflow-hidden rounded-lg group">
                <img src="{{ RvMedia::getImageUrl($image) }}" alt=""
                    class="w-full h-full object-cover transition-transform duration-300 group-hover:scale-105" />

                {{-- Overlay +n nếu ảnh > 5 --}}
                @if ($index === 4 && count($galleries) > 5)
                    <div
                        class="absolute inset-0 bg-black/60 flex items-center justify-center text-white text-2xl font-semibold">
                        +{{ count($galleries) - 4 }}
                    </div>
                    @if ($item['description'])
                        <div
                            class="absolute inset-0 bg-black/60 flex items-center justify-center text-white text-2xl font-semibold">
                            {{ $item['description'] }}
                        </div>
                    @endif
                @endif
            </a>
        @endif

        @if ($index === 4)
            @break
        @endif
    @endforeach
</div>
