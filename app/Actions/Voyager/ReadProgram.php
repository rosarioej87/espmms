<?php

namespace App\Actions\Voyager;

use TCG\Voyager\Actions\AbstractAction;

class ReadProgram extends AbstractAction
{
    public function getTitle()
    {
        return 'view program';
    }

    public function getIcon()
    {
        return 'voyager-eye';
    }

    public function getPolicy()
    {
        return 'read';
    }

    public function getAttributes()
    {
        return [
            'class' => 'btn btn-sm btn-primary pull-right',
        ];
    }

    public function getDefaultRoute()
    {
        return route('voyager.programs.show', $this->data->program_id ?: '0');
    }

    public function shouldActionDisplayOnDataType()
    {
        return $this->dataType->slug == 'projects';
    }
}
