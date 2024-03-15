<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hero extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'sub_title',
        'btn_text',
        'btn_url',
        'image'
    ];

    protected $appends = ['image_path'];

    public function getImagePathAttribute()
    {
        return asset($this->image);
    }
}
