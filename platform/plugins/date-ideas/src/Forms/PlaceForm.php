<?php

namespace Botble\DateIdeas\Forms;

use Botble\AdministrativeUnit\Models\District;
use Botble\AdministrativeUnit\Models\City;
use Botble\AdministrativeUnit\Models\Commune;
use Botble\Base\Forms\FieldOptions\MediaImageFieldOption;
use Botble\Base\Forms\FieldOptions\NameFieldOption;
use Botble\Base\Forms\FieldOptions\SelectFieldOption;
use Botble\Base\Forms\FieldOptions\StatusFieldOption;
use Botble\Base\Forms\FieldOptions\TextareaFieldOption;
use Botble\Base\Forms\FieldOptions\TextFieldOption;
use Botble\Base\Forms\Fields\MediaImageField;
use Botble\Base\Forms\Fields\SelectField;
use Botble\Base\Forms\Fields\TextareaField;
use Botble\Base\Forms\Fields\TextField;
use Botble\Base\Forms\FormAbstract;
use Botble\DateIdeas\Enums\PlacePriceRangeEnum;
use Botble\DateIdeas\Http\Requests\DateIdeasRequest;
use Botble\DateIdeas\Models\DateIdeas;
use Botble\DateIdeas\Models\Place;
use Botble\DateIdeas\Models\PlaceCategory;
use Botble\DateIdeas\Models\PlaceMood;
use Botble\Base\Facades\Assets;

class PlaceForm extends FormAbstract
{
    public function setup(): void
    {
        Assets::addScriptsDirectly(['/vendor/core/plugins/administrative-unit/js/administrative-unit.js']);

        $cities = City::query()->pluck('name', 'id')->toArray();
        $selectedCommune = null;
        if ($this->model->getKey()) {
            $selectedCommune = Commune::query()->where('id', $this->model->au_commune_id)->pluck('name', 'id')->toArray();
        }
        $this
            ->columns(6)
            ->model(Place::class)
            ->setValidatorClass(DateIdeasRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->colspan(6)->required())
            ->add(
                'description',
                TextareaField::class,
                TextareaFieldOption::make()->colspan(6)->label(trans('core/base::forms.description'))->rows(4)
            )
            ->add(
                'address',
                TextField::class,
                TextFieldOption::make()->label(trans('core/base::forms.address'))->colspan(6)->required()
            )
            ->add(
                'latitude',
                TextField::class,
                TextFieldOption::make()->label(trans('core/base::forms.address'))
                    ->colspan(3)
                    ->required()
            )
            ->add(
                'longitude',
                TextField::class,
                TextFieldOption::make()->label(trans('core/base::forms.address'))
                    ->colspan(3)
                    ->required()
            )
            ->add(
                'au_city_id',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(__('Province/City'))
                    ->choices($cities)
                    ->selected($this->model->au_city_id ?? null)
                    ->required()
                    ->searchable()
                    ->emptyValue(__('Please select city'))
                    ->allowClear()
                    ->colspan(3)
            )
            ->add(
                'au_commune_id',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(__('District'))
                    ->choices($this->model->getKey() ? $selectedCommune : [])
                    ->selected($this->model->au_commune_id ?? null)
                    ->required()
                    ->ajaxUrl(route('administrative-unit.ajax.communes'))
                    ->emptyValue(__('Please select district'))
                    ->allowClear()
                    ->colspan(3)
            )
            /*->add(
                'ward_id',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(__('Ward'))
                    ->choices($this->model->getKey() ? $selectedWard : [])
                    ->selected($this->model->ward_id ?? null)
                    ->required()
                    ->ajaxUrl(route('administrative-unit.ajax.wards'))
                    ->emptyValue(__('Please select ward'))
                    ->allowClear()
                    ->colspan(2)
            )*/
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->add(
                'price_range', SelectField::class,
                SelectFieldOption::make()->label('Price range')->choices(PlacePriceRangeEnum::labels())
            )
            ->add('image', MediaImageField::class, MediaImageFieldOption::make()
                ->label('Image')
            )
            ->setBreakFieldPoint('status');
    }
}
