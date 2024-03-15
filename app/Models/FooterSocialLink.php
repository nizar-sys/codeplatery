<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FooterSocialLink extends Model
{
    use HasFactory;

    protected $appends = ['icon_bi'];

    protected $fillable = [
        'icon',
        'url'
    ];

    public function getIconBiAttribute()
    {
        return preg_replace('/(fas|fab) fa-/', 'bi bi-', $this->icon);
    }
}
