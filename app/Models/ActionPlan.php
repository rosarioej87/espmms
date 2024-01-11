<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;


class ActionPlan extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function programs(): HasMany
    {
        return $this->hasMany(Program::class);
    }

    public function semester()
    {
        return $this->belongsTo(Semester::class);
    }

    public function department()
    {
        return $this->belongsTo(Department::class);
    }

    public function scopeActive(Builder $query): void
    {
        $query->where('active', 1);
    }

    public function scopeOrder($query)
    {
        return $query->orderBy('active', 'desc');
    }

    public function getCurrentAttribute()
    {
        return "{$this->semester->getCurrentAttribute()}";
    }

    public function getDetailAttribute()
    {
        return "{$this->department->name}, {$this->getCurrentAttribute()}";
    }

    public $additional_attributes = ['current', 'detail'];
}
