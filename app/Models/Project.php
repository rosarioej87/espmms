<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function program()
    {
        return $this->belongsTo(Program::class);
    }

    public function departments()
    {
        return $this->belongsToMany(Department::class, 'department_project', 'department_id', 'project_id');
    }

    public function clientPartners()
    {
        return $this->belongsToMany(ClientPartner::class, 'client_partner_project', 'client_partner_id', 'project_id');
    }

    public function missionPartnerAgencies()
    {
        return $this->belongsToMany(MissionPartnerAgency::class, 'mission_partner_agency_project', 'mission_partner_agency_id', 'project_id');
    }

    public function PersonsResponsible()
    {
        return $this->belongsToMany(PersonsResponsible::class, 'person_responsible_project', 'person_responsible_id', 'project_id');
    }

    public function organizations()
    {
        return $this->belongsToMany(Organization::class, 'organization_project', 'organization_id', 'project_id');
    }
}
