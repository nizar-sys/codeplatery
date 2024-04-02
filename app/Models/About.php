<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class About extends Model
{
    use HasFactory;

    protected $fillable = [
        'title', 
        'description', 
        'image',
        'resume'
    ];

    protected $appends = [
        'image_url',
        'resume_url'
    ];

    public function getImageUrlAttribute()
    {
        return asset($this->image);
    }

    public function getResumeUrlAttribute()
    {
        return asset($this->resume);
    }
}
