<?php

namespace Botble\FavoriteItems\Forms;

use Botble\Base\Forms\FieldOptions\NameFieldOption;
use Botble\Base\Forms\FieldOptions\StatusFieldOption;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\FormAbstract;
use Botble\FavoriteItems\Http\Requests\FavoriteItemsRequest;
use Botble\FavoriteItems\Models\FavoriteItems;

class FavoriteItemsForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(FavoriteItems::class)
            ->setValidatorClass(FavoriteItemsRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required())
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->setBreakFieldPoint('status');
    }
}
