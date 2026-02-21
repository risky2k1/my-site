<?php

namespace Botble\DateIdeas\Forms;

use Botble\Base\Forms\FieldOptions\NameFieldOption;
use Botble\Base\Forms\FieldOptions\StatusFieldOption;
use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\FormAbstract;
use Botble\DateIdeas\Http\Requests\DateIdeasRequest;
use Botble\DateIdeas\Models\DateIdeas;
use Botble\DateIdeas\Models\PlaceCategory;
use Botble\DateIdeas\Models\PlaceMood;
use Botble\DateIdeas\Models\PlaceReview;

class PlaceReviewForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(PlaceReview::class)
            ->setValidatorClass(DateIdeasRequest::class)
            ->add('place_id', TextField::class, TextFieldOption::make()
                ->label(trans('plugins/date-ideas::date-ideas.places'))
                ->value($this->getModel()->place?->name)
                ->disabled()
            )
            ->add('user_id', TextField::class, TextFieldOption::make()
                ->label(trans('plugins/date-ideas::date-ideas.review.user'))
                ->value($this->getModel()->user?->name)
                ->disabled()
            )
            ->add('comment', TextField::class, NameFieldOption::make()->required())
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->setBreakFieldPoint('status');
    }
}
