<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;


class ActionPlan extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function scopeActive(Builder $query): void
    {
        $query->where('active', 1);
    }

    public function getCurrentAttribute()
    {
        return "{$this->academic_year} {$this->academic_term}";
    }

    public $additional_attributes = ['current'];
}
