<?php

namespace App\Actions;

use TCG\Voyager\Actions\AbstractAction;

class MyAction extends AbstractAction
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

//    public function shouldActionDisplayOnRow($row)
//    {
//        return $row->id > 10;
//    }
//
//    public function massAction($ids, $comingFrom)
//    {
//        // Do something with the IDs
//        return redirect($comingFrom);
//    }
}
