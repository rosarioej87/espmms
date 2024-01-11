<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
<div class="report">

    <div class="header">
        <header>
            <div class="center" style="width: 45%">
                <img src="/css/img/logo.png" alt="BTS">
            </div>
            <h3>EXTENSION SERVICES OFFICE</h3>
        </header>
    </div>

    <div class="header">
        <h3>ACTION PLAN <br> SECOND SEMESTER, SCHOOL YEAR 2022-23</h3>
    </div>
    <br>

    <div>
        <table class="minimalistBlack">
            <thead>
            <tr>
                <th rowspan="2">TITLE OF THE <br> PROGRAM</th>
                <th rowspan="2">PROJECTS <br> &/OR <br> ACTIVITIES</th>
                <th colspan="5">IMPLEMENTATION</th>
            </tr>
            <tr>
                <th>PERSON <br> RESPONSIBLE </th>
                <th>DATE</th>
                <th>VENUE</th>
                <th>CLIENT-PARTNER</th>
                <th>MISSION PARTNER <br> AGENCIES/ <br>
                    DEPARTMENTS/ <br>
                    ORGANIZATIONS
                </th>
            </tr>
            </thead>
            <tbody>

            <?php $actionPlans = App\Models\ActionPlan::all() ; ?>
            @foreach($actionPlans as $actionPlan)
                @foreach($actionPlan->programs as $program)
                    @foreach($program->projects as $project)
            <tr>
                <td><strong>{{ $project->program->name }}</strong></td>
                <td>{{ $project->name }}</td>
                <td></td>
                <td style="width: 150px;">{{ Carbon\Carbon::parse(now())->toFormattedDateString('d-m-Y i') }} to <br>
                    {{ Carbon\Carbon::parse(now())->toFormattedDateString('d-m-Y i') }}

                </td>
                <td>Saint Louis College</td>
                <td></td>
                <td></td>
            </tr>
            @endforeach
            @endforeach
            @endforeach
            </tbody>
        </table>

    </div>

    <br><br><br>
    <footer>
        <p><strong>{{ auth()->user()->name }}<br> Extension Services Coordinator</strong></p>
    </footer>

</div>
</body>
</html>
