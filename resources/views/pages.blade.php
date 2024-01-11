

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <?php $page = TCG\Voyager\Models\Page::first(); ?>

    @can('browse', $page)
        <p>You can browse pages</p>
    @endcan



    @can('edit', $page)
        <p>You can edit pages</p>

    @else
        <p>You don't have access to edit pages</p>
    @endcan

    <iframe src="http://espmms.test/reports/monitoring-pdf" height="1000" width="100%" title="Iframe Example" style="border:none;"></iframe>
</body>
</html>
