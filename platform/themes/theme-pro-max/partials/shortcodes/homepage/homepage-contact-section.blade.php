<!-- Contact Section -->
<section id="contact" class="py-24 px-6 bg-base-200/30">
    <div class="hero-content max-w-4xl mx-auto flex-col text-center w-full">
        <h2 class="text-3xl md:text-4xl font-heading font-bold mb-6">{{ $shortcode->title }}</h2>
        <p class="text-base-content/70 mb-12 text-lg">
            {!! BaseHelper::clean($shortcode->description) !!}
        </p>
        <form class="card w-full max-w-md mx-auto shadow-2xl bg-base-100" method="POST"
            action="{{ route('public.send.contact') }}">
            @csrf
            <div class="card-body text-left">
                <div class="form-control">
                    <label class="label">
                        <span class="label-text">{{ __('Name') }}</span>
                    </label>
                    <input type="text" name="name" placeholder="{{ __('Your name') }}" class="input input-bordered"
                        required />
                </div>
                <div class="form-control">
                    <label class="label">
                        <span class="label-text">{{ __('Email') }}</span>
                    </label>
                    <input type="email" name="email" placeholder="{{ __('you@example.com') }}" class="input input-bordered"
                        required />
                </div>
                <div class="form-control">
                    <label class="label">
                        <span class="label-text">{{ __('Message') }}</span>
                    </label>
                    <textarea name="content" class="textarea textarea-bordered h-24" placeholder="{{ __('Tell me about your project...') }}" required></textarea>
                </div>
                <div class="form-control">
                    <label class="cursor-pointer label">
                        <input type="checkbox" name="agree_terms_and_policy" value="1"
                            class="checkbox checkbox-primary" required>
                        <span class="label-text ml-2">
                            {{ __('I agree to the terms and privacy policy') }}
                        </span>
                    </label>
                </div>
                <div class="form-control mt-6">
                    <button type="submit" class="btn btn-primary">{{ __('Send Message') }}</button>
                </div>
            </div>
        </form>
    </div>
</section>
