<?php

namespace Botble\DateIdeas\Enums;

use Botble\Base\Supports\Enum;
use Illuminate\Support\HtmlString;
use Botble\Base\Facades\Html;

/**
 * @method static PlacePriceRangeEnum LOW()
 * @method static PlacePriceRangeEnum MEDIUM()
 * @method static PlacePriceRangeEnum HIGH()
 */
class PlacePriceRangeEnum extends Enum
{
    public const LOW = 'low';
    public const MEDIUM = 'medium';
    public const HIGH = 'high';

    public static $langPath = 'plugins/date-ideas::date-ideas.enums';

    public function toHtml(): HtmlString|string
    {
        return match ($this->value) {
            self::LOW => Html::tag('span', self::LOW()->label(), ['class' => 'bg-black/60 backdrop-blur-md px-2 py-1 rounded text-xs font-semibold text-white border border-white/10 whitespace-nowrap']),
            self::MEDIUM => Html::tag('span', self::MEDIUM()->label(), ['class' => 'bg-black/60 backdrop-blur-md px-2 py-1 rounded text-xs font-semibold text-white border border-white/10 whitespace-nowrap']),
            self::HIGH => Html::tag('span', self::HIGH()->label(), ['class' => 'bg-black/60 backdrop-blur-md px-2 py-1 rounded text-xs font-semibold text-white border border-white/10 whitespace-nowrap']),
            default => parent::toHtml(),
        };
    }
}
