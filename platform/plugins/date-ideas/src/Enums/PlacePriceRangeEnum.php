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
            self::LOW => Html::tag('span', self::LOW()->label(), ['class' => 'badge bg-success text-success-fg']),
            self::MEDIUM => Html::tag('span', self::MEDIUM()->label(), ['class' => 'badge bg-warning text-success-fg']),
            self::HIGH => Html::tag('span', self::HIGH()->label(), ['class' => 'badge bg-danger text-success-fg']),
            default => parent::toHtml(),
        };
    }
}
