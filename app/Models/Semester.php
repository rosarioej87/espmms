<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Semester extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function getCurrentAttribute()
    {
        return "{$this->academic_term}, {$this->academic_year}";
    }

    public $additional_attributes = ['current'];
}
