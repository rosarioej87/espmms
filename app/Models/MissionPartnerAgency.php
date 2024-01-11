<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MissionPartnerAgency extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function projects()
    {
        return $this->belongsToMany(MissionPartnerAgency::class, 'mission_partner_agency_project', 'project_id', 'mission_partner_agency_id');
    }
}
