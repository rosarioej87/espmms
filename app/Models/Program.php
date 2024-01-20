<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class Program extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function projects()
    {
        return $this->hasMany(Project::class);
    }

    public function scopeActive(Builder $query): void
    {
        $query->where('active', 1);
    }
}
