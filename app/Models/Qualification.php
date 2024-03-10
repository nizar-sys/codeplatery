<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Qualification extends Model
{
    use HasFactory;

    protected $fillable = [
        'type',
        'organization_name',
        'address',
        'start_date',
        'end_date',
        'description',
    ];

    // function boot
    public static function boot()
    {
        parent::boot();

        static::creating(function ($qualification) {
            $qualification->created_at = now();
        });

        static::updating(function ($qualification) {
            $qualification->updated_at = now();
        });
    }

    // muttators

    protected function date(): Attribute
    {
        $start_date = Carbon::parse($this->attributes['start_date'])->format('Y');
        $end_date = $this->attributes['end_date'] ? Carbon::parse($this->attributes['end_date'])->format('Y') : 'Present';

        return Attribute::make(
            get: fn () => "{$start_date} - {$end_date}",
        );
    }

    protected function latest(): Attribute
    {
        $end_date = $this->attributes['end_date'] ? Carbon::parse($this->attributes['end_date'])->format('Y') : 'Present';

        return Attribute::make(
            get: fn () => $end_date === 'Present',
        );
    }
}
