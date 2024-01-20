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
    <?php $actionPlans = App\Models\ActionPlan::where('active', 1)->get() ; ?>
    @foreach ($actionPlans as $actionPlan)
        <div class="header">
            <header>
                <div class="center" style="width: 45%">
                    <img src="/storage/images/mpdf/logo.png" alt="BTS">
                </div>
                <h3>{{ strtoupper($actionPlan->department->name) }}</h3>
            </header>
        </div>


        <div class="header">
            <h3>SEMESTRAL REPORT<br>
                {{ strtoupper($actionPlan->semester->academic_term) }}, SCHOOL YEAR {{ $actionPlan->semester->academic_year }}
            </h3>
        </div>
        <br>

        <p>Department/Section/Unit: &nbsp; &nbsp; &nbsp;  <b>{{ strtoupper($actionPlan->department->name )}}</b> <br>
        Monitoring Period: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <b>January – March, 2023</b></p>

        <div>
            <table class="minimalistBlack">
                <thead>
                <tr>
                    <th>TITLE OF THE PROGRAM</th>
                    <th>PROJECTS/ <br> ACTIVITIES</th>
                    <th>DEPARTMENT/PERSONS <br> INVOLVED</th>
                    <th>CLIENT/PARTNER</th>
                    <th>DATE OF <br> IMPLEMENTATION</th>
                    <th>MISSION <br> PARTNERS</th>
                    <th>REMARKS</th>
                </tr>
                </thead>
                <tbody>
                @foreach ($actionPlan->programs as $program)
                    @foreach ($program->projects as $project)

                        <tr>
                            <td>{{ $project->program->title }}</td>
                            <td>{{ $project->title }}</td>
                            <td>
                                {{ implode(', ', $project->departments()->get()->pluck('name')->toArray()) }}
                                @if ($project->departments()->count() > 0)
                                    <br>
                                @endif
                                {{ implode(', ', $project->organizations()->get()->pluck('name')->toArray()) }}
                                @if ($project->organizations()->count() > 0)
                                    <br>
                                @endif
                            </td>
                            <td>
                                {{ implode(', ', $project->clientPartners()->get()->pluck('name')->toArray()) }}
                                @if ($project->clientPartners()->count() > 0)
                                    <br>
                                @endif
                            </td>
                            <td style="width: 150px;">
                                @if ($project->start_date)
                                    {{ Carbon\Carbon::parse($project->start_date)->toFormattedDateString('d-m-Y i') }}
                                @endif
                                @if ($project->end_date)
                                    to <br>
                                    {{ Carbon\Carbon::parse($project->end_date)->toFormattedDateString('d-m-Y i') }}
                                @endif

                            </td>
                            <td>
                                {{ implode(', ', $project->missionPartnerAgencies()->get()->pluck('name')->toArray()) }}
                                @if ($project->missionPartnerAgencies()->count() > 0)
                                    <br>
                                @endif
                            </td>
                            <td>
                                {{ $project->status }}
                                @if ($project->remarks)
                                    <br>
                                    {{ $project->remarks }}
                                @endif
                            </td>
                        </tr>

                    @endforeach
                @endforeach
                </tbody>
            </table>

        </div>
            <div class="pagebreak"></div>
        <div>
            <footer>
                <p>Prepared by:</p>
                <br>
                <p><strong>{{ strtoupper(auth()->user()->name) }}<br> Social Action Coordinator</strong></p>
            </footer>
        </div>
        <div class="pagebreak"></div>
    @endforeach
</div>
</body>
</html>
