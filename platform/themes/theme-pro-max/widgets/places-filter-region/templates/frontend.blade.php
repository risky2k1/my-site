 <!-- Region -->
 <div class="mb-6 form-control">
     <h4 class="font-medium mb-3 text-sm uppercase tracking-wide text-base-content/50">
         {{ $config['name'] ?? __('Region') }}</h4>
     <div class="space-y-2">
         <label class="label cursor-pointer justify-start gap-3 p-0">
             <input type="radio" name="region[]" class="radio radio-sm radio-primary border-white/20" value="north" />
             <span class="label-text">{{ __('North Region') }}</span>
         </label>
         <label class="label cursor-pointer justify-start gap-3 p-0">
             <input type="radio" name="region[]" class="radio radio-sm radio-primary border-white/20"
                 value="central" />
             <span class="label-text">{{ __('Central Region') }}</span>
         </label>
         <label class="label cursor-pointer justify-start gap-3 p-0">
             <input type="radio" name="region[]" class="radio radio-sm radio-primary border-white/20"
                 value="south" />
             <span class="label-text">{{ __('South Region') }}</span>
         </label>
     </div>
 </div>
