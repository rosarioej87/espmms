<?php

namespace App\Widgets;

use App\Models\Program;
use Arrilot\Widgets\AbstractWidget;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;

class Programs extends AbstractWidget
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        $count = \App\Models\Program::count();
        $string = 'Programs';

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-lightbulb',
            'title'  => "{$count} {$string}",
            'text'   => 'You have '.$count.' '.Str::lower($string).' in your database. '.'Click on button below to view all '.Str::lower($string),
            'button' => [
                'text' => 'Programs',
                'link' => route('voyager.programs.index'),
            ],
            'image' => 'storage/images/widgets/programs-bg.jpg',
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        $program = Program::first();
        return Auth::user()->can('browse', $program);
    }
}
