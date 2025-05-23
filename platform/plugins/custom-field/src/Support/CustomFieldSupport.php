<?php

namespace Botble\CustomField\Support;

use Botble\Base\Models\BaseModel;
use Botble\Base\Supports\Editor;
use Botble\CustomField\Models\CustomField;
use Botble\CustomField\Models\FieldGroup;
use Botble\CustomField\Repositories\Interfaces\FieldGroupInterface;
use Botble\Language\Facades\Language;
use Botble\LanguageAdvanced\Supports\LanguageAdvancedManager;
use Closure;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;

class CustomFieldSupport
{
    protected array $ruleGroups = [
        'basic' => [
            'items' => [

            ],
        ],
        'other' => [
            'items' => [

            ],
        ],
    ];

    protected array $rules = [];

    protected bool $isRenderedAssets = false;

    public function expandRuleGroup(string $groupName): self
    {
        if (! isset($this->ruleGroups[$groupName])) {
            return $this->registerRuleGroup($groupName);
        }

        return $this;
    }

    public function registerRuleGroup(string $groupName): self
    {
        $this->ruleGroups[$groupName] = [
            'items' => [],
        ];

        return $this;
    }

    public function expandRule(string $group, string $title, string $slug, Closure|array|string $data): self
    {
        if (! isset($this->ruleGroups[$group]['items'][$slug]['data']) || ! $this->ruleGroups[$group]['items'][$slug]['data']) {
            return $this->registerRule($group, $title, $slug, $data);
        }

        if (! is_array($data)) {
            $data = [$data];
        }

        $this->ruleGroups[$group]['items'][$slug]['data'] = array_merge(
            $this->ruleGroups[$group]['items'][$slug]['data'],
            $data
        );

        return $this;
    }

    public function registerRule(string $group, string $title, string $slug, Closure|array|string $data): self
    {
        if (! isset($this->ruleGroups[$group])) {
            $this->registerRuleGroup($group);
        }

        $slug = Str::slug(str_replace('\\', '_', $slug), '_');

        $this->ruleGroups[$group]['items'][$slug] = [
            'title' => $title,
            'slug' => $slug,
        ];

        if (! is_array($data)) {
            $data = [$data];
        }

        $this->ruleGroups[$group]['items'][$slug]['data'] = $data;

        return $this;
    }

    public function setRules(array|string|null $rules): self
    {
        if (! is_array($rules)) {
            $this->rules = json_decode((string) $rules, true);
        } else {
            $this->rules = $rules;
        }

        return $this;
    }

    public function addRule(string|array $ruleName, $value = null): self
    {
        if (is_array($ruleName)) {
            $rules = [];
            foreach ($ruleName as $key => $rule) {
                $rules[Str::slug(str_replace('\\', '_', $key), '_')] = $rule;
            }
        } else {
            $ruleName = Str::slug(str_replace('\\', '_', $ruleName), '_');
            $rules = [$ruleName => $value];
        }

        $this->rules = array_merge($this->rules, $rules);

        return $this;
    }

    public function exportCustomFieldsData(string $morphClass, int|string|null $morphId): array
    {
        $fieldGroups = FieldGroup::query()
            ->wherePublished()
            ->oldest('order')
            ->get();

        $result = [];

        $fieldGroupRepository = app(FieldGroupInterface::class);

        foreach ($fieldGroups as $row) {
            if (! $this->checkRules(json_decode((string) $row->rules, true))) {
                continue;
            }

            $result[] = [
                'id' => $row->id,
                'title' => $row->title,
                'items' => $fieldGroupRepository->getFieldGroupItems(
                    $row->id,
                    null,
                    true,
                    $morphClass,
                    $morphId
                ),
            ];
        }

        return $result;
    }

    protected function checkRules(array $ruleGroups): bool
    {
        if (! $ruleGroups) {
            return false;
        }

        foreach ($ruleGroups as $group) {
            if ($this->checkEachRule($group)) {
                return true;
            }
        }

        return false;
    }

    protected function checkEachRule(array $ruleGroup): bool
    {
        foreach ($ruleGroup as $ruleGroupItem) {
            if (! array_key_exists($ruleGroupItem['name'], $this->rules)) {
                return false;
            }

            if ($ruleGroupItem['type'] == '==') {
                if (is_array($this->rules[$ruleGroupItem['name']])) {
                    $result = in_array($ruleGroupItem['value'], $this->rules[$ruleGroupItem['name']]);
                } else {
                    $result = $ruleGroupItem['value'] == $this->rules[$ruleGroupItem['name']];
                }
            } elseif (is_array($this->rules[$ruleGroupItem['name']])) {
                $result = ! in_array($ruleGroupItem['value'], $this->rules[$ruleGroupItem['name']]);
            } else {
                $result = $ruleGroupItem['value'] != $this->rules[$ruleGroupItem['name']];
            }

            if (! $result) {
                return false;
            }
        }

        return true;
    }

    public function renderRules(): string
    {
        return view('plugins/custom-field::_script-templates.rules', [
            'ruleGroups' => $this->resolveGroups(),
        ])->render();
    }

    protected function resolveGroups(): array
    {
        foreach ($this->ruleGroups as &$group) {
            foreach ($group['items'] as &$item) {
                $data = [];

                foreach ($item['data'] as $datum) {
                    if ($datum instanceof Closure) {
                        $resolvedClosure = call_user_func($datum);
                        if (is_array($resolvedClosure)) {
                            foreach ($resolvedClosure as $key => $value) {
                                $data[$key] = $value;
                            }
                        }
                    } elseif (is_array($datum)) {
                        foreach ($datum as $key => $value) {
                            $data[$key] = $value;
                        }
                    }
                }

                $item['data'] = $data;
            }
        }

        return $this->ruleGroups;
    }

    public function renderCustomFieldBoxes(array $boxes): string
    {
        (new Editor())->registerAssets();

        return view('plugins/custom-field::custom-fields-boxes-renderer', [
            'customFieldBoxes' => json_encode($boxes),
        ])->render();
    }

    public function renderAssets(): void
    {
        if (! $this->isRenderedAssets) {
            add_filter(BASE_FILTER_FOOTER_LAYOUT_TEMPLATE, function (?string $html): string {
                return $html . view('plugins/custom-field::_script-templates.render-custom-fields')->render();
            }, 16);
            $this->isRenderedAssets = true;
        }
    }

    public function saveCustomFields(Request $request, Model $data): bool
    {
        $fields = $request->input('custom_fields');

        if (! $fields) {
            return false;
        }

        $rows = $this->parseRawData($fields);

        foreach ($rows as $row) {
            $this->saveCustomField($data::class, $data->getKey(), $row);
        }

        return true;
    }

    protected function parseRawData(?string $jsonString): array
    {
        $fieldGroups = json_decode((string) $jsonString, true) ?: [];

        $result = [];
        foreach ($fieldGroups as $fieldGroup) {
            foreach ($fieldGroup['items'] as $item) {
                $result[] = $item;
            }
        }

        return $result;
    }

    protected function saveCustomField(string $reference, int|string $id, array $data): void
    {
        $currentMeta = CustomField::query()
            ->where([
                'field_item_id' => $data['id'],
                'slug' => $data['slug'],
                'use_for' => $reference,
                'use_for_id' => $id,
            ])
            ->first();

        $value = $this->parseFieldValue($data);

        if (! is_string($value)) {
            $value = json_encode($value);
        }

        $data['value'] = $value;

        if (
            defined('LANGUAGE_MODULE_SCREEN_NAME') &&
            ($currentLanguage = Language::getRefLang()) &&
            $currentLanguage != Language::getDefaultLocaleCode()
        ) {
            $request = new Request();
            $request->replace([
                'language' => request()->input('language'),
                Language::refLangKey() => $currentLanguage,
                'value' => $data['value'],
            ]);

            if (! $currentMeta) {
                $data['use_for'] = $reference;
                $data['use_for_id'] = $id;
                $data['field_item_id'] = $data['id'];

                $currentMeta = CustomField::query()->create($data);
            }

            LanguageAdvancedManager::save($currentMeta, $request);
        } elseif ($currentMeta) {
            $currentMeta->fill($data);
            $currentMeta->save();
        } else {
            $data['use_for'] = $reference;
            $data['use_for_id'] = $id;
            $data['field_item_id'] = $data['id'];

            CustomField::query()->create($data);
        }
    }

    protected function parseFieldValue(array $field): array|string
    {
        $value = [];
        switch ($field['type']) {
            case 'repeater':
                if (! isset($field['value'])) {
                    break;
                }

                foreach ($field['value'] as $row) {
                    $groups = [];
                    foreach ($row as $item) {
                        $groups[] = [
                            'field_item_id' => $item['id'],
                            'type' => $item['type'],
                            'slug' => $item['slug'],
                            'value' => $this->parseFieldValue($item),
                        ];
                    }
                    $value[] = $groups;
                }

                break;
            case 'checkbox':
                $value = isset($field['value']) ? (array) $field['value'] : [];

                break;
            default:
                $value = $field['value'] ?? '';

                break;
        }

        return $value;
    }

    public function deleteCustomFields(?Model $data): bool
    {
        if ($data) {
            CustomField::query()
                ->where([
                    'use_for' => get_class($data),
                    'use_for_id' => $data->getKey(),
                ])
                ->delete();
        }

        return false;
    }

    public function registerModule(string|array $module): self
    {
        if (! is_array($module)) {
            $module = [$module];
        }

        $configKey = 'plugins.custom-field.general.supported';

        config([
            $configKey => array_merge(config($configKey, []), $module),
        ]);

        return $this;
    }

    public function isSupportedModule(string $module): bool
    {
        return in_array($module, $this->supportedModules());
    }

    public function supportedModules(): array
    {
        return (array) config('plugins.custom-field.general.supported', []);
    }

    public function getField(BaseModel $data, $key = null, $default = null): string|null|array
    {
        if ($key === null || ! trim($key)) {
            return CustomField::query()
                ->where([
                    'use_for' => $data::class,
                    'use_for_id' => $data->getKey(),
                ])
                ->first();
        }

        $field = CustomField::query()
            ->where([
                'use_for' => $data::class,
                'use_for_id' => $data->getKey(),
                'slug' => $key,
            ])
            ->first();

        if (! $field || ! $field->resolved_value) {
            return $default;
        }

        return $field->resolved_value;
    }

    public function getChildField(array $parentField, string $key, $default = null): array|string|null
    {
        foreach ($parentField as $field) {
            if (Arr::get($field, 'slug') === $key) {
                return Arr::get($field, 'value', $default);
            }
        }

        return $default;
    }
}
