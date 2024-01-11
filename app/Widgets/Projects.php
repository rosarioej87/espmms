<?php

namespace App\Widgets;

use App\Models\Project;
use Arrilot\Widgets\AbstractWidget;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;

class Projects extends AbstractWidget
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
        $count = \App\Models\Project::count();
        $string = 'Projects';

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-paperclip',
            'title'  => "{$count} {$string}",
            'text'   => 'You have '.$count.' '.Str::lower($string).' in your database. '.'Click on button below to view all '.Str::lower($string),
            'button' => [
                'text' => 'Projects',
                'link' => route('voyager.projects.index'),
            ],
            'image' => 'storage/images/widgets/projects-bg.jpg',
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        $project = Project::first();
        return Auth::user()->can('browse', $project);
    }
}
