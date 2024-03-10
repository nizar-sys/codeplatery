<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BlogComment extends Model
{
    use HasFactory;

    protected $fillable = [
        'blog_id',
        'parent_id',
        'user_id',
        'name',
        'email',
        'comment_text',
    ];

    public static function boot()
    {
        parent::boot();

        static::creating(function ($comment) {
            $comment->created_at = now();
        });

        static::updating(function ($comment) {
            $comment->updated_at = now();
        });
    }

    public function blog()
    {
        return $this->belongsTo(Blog::class);
    }

    public function parent()
    {
        return $this->belongsTo(BlogComment::class, 'parent_id');
    }

    public function childrens()
    {
        return $this->hasMany(BlogComment::class, 'parent_id');
    }

    public function scopeParentComments($query)
    {
        return $query->whereNull('parent_id');
    }

    public function scopeChildComments($query)
    {
        return $query->whereNotNull('parent_id');
    }

    protected function date(): Attribute
    {
        return Attribute::make(
            get: fn () => Carbon::parse($this->created_at)->format('F d, Y'),
        );
    }
}
