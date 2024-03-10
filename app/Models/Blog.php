<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Blog extends Model
{
    use HasFactory;

    public static function boot()
    {
        parent::boot();

        static::creating(function ($blog) {
            $blog->created_by = auth()->user()->id;
            $blog->created_at = now();
        });

        static::updating(function ($blog) {
            $blog->updated_at = now();
        });
    }

    public function getCategory()
    {
        return $this->belongsTo(BlogCategory::class, 'category', 'id');
    }

    public function comments()
    {
        return $this->hasMany(BlogComment::class);
    }

    public function getCreatedBy()
    {
        return $this->belongsTo(User::class, 'created_by', 'id');
    }
}
