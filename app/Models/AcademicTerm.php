<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AcademicTerm extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function scopeActive(Builder $query): void
    {
        $query->where('active', 1);
    }
}
