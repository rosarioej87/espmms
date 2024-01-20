<?php

namespace App\Actions\Voyager;

use TCG\Voyager\Actions\AbstractAction;

class PrintSemestralReport extends AbstractAction
{
    public function getTitle()
    {
        return 'print';
    }

    public function getIcon()
    {
        return 'voyager-file-text';
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
        return route('semestral-reports-pdf');
    }

    public function shouldActionDisplayOnDataType()
    {
        return $this->dataType->slug == 'semestral-reports';
    }
}
