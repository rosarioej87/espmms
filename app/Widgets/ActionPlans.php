<?php

namespace App\Widgets;

use App\Models\ActionPlan;
use Arrilot\Widgets\AbstractWidget;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;

class ActionPlans extends AbstractWidget
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
        $count = ActionPlan::where('active', 1)->count();
        $string = 'Action Plans';

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-calendar',
            'title'  => "{$count} {$string}",
            'text'   => 'You have '.$count.' '.Str::lower($string).' in your database. '.'Click on button below to view all '.Str::lower($string),
            'button' => [
                'text' => 'Action Plans',
                'link' => route('voyager.action-plans.index'),
            ],
            'image' => 'storage/images/widgets/action-plans-bg.jpg',
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        $actionPlan = ActionPlan::first();
        return Auth::user()->can('browse', $actionPlan);
    }
}
