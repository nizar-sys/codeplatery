<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RequestStoreQualification extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'type' => ['required'],
            'organization_name' => ['required'],
            'address' => ['required'],
            'start_date' => ['required'],
            'end_date' => ['nullable'],
            'description' => ['required'],
        ];
    }

    public function attributes()
    {
        return [
            'type' => 'Type',
            'organization_name' => 'Organization / Institute',
            'address' => 'Address',
            'start_date' => 'Start Date',
            'end_date' => 'End Date',
            'description' => 'Description',
        ];
    }
}
