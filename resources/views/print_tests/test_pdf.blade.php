<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Test</title>
</head>
<body>
<div class="row justify-content-center">
    <iframe src="{{ asset('./storage/report/new-result.pdf') }}" width="100%" height="100%">
        This browser does not support PDFs. Please download the PDF to view it: <a href="{{ asset('./storage/report/new-result.pdf') }}">Download PDF</a>
    </iframe>
</div>
</body>
</html>
