@php
    use Botble\Icon\Facades\Icon;
@endphp

<!-- Skills Section -->
<section id="skills" class="py-24 px-6 bg-base-200/30">
    <div class="max-w-6xl mx-auto">
        <h2 class="text-3xl md:text-4xl font-heading font-bold mb-12 flex items-center gap-3">
            {!! BaseHelper::renderIcon('ti ti-code', null, ['class' => 'text-primary w-8 h-8']) !!} {{ $shortcode->title }}
        </h2>
        <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-6">
            <!-- Skill Items -->
            @foreach ($skillData as $skill)
                <div
                    class="card bg-base-200 border border-white/5 hover:border-primary/50 transition-colors group cursor-default">
                    <div class="card-body p-6 items-center text-center gap-3">
                        {!! Icon::render($skill[1]['value'], [
                            'class' => 'w-8 h-8 text-base-content/50 group-hover:text-primary transition-colors',
                        ]) !!}

                        <span class="font-medium">{{ $skill[0]['value'] }}</span>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>
