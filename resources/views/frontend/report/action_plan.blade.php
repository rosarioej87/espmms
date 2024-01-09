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
    <div class="row justify-content-center">
        <iframe src="{{ asset('result.pdf') }}" width="100%" height="100%">
            This browser does not support PDFs. Please download the PDF to view it: <a href="{{ asset('result.pdf') }}">Download PDF</a>
        </iframe>
    </div>
</body>
</html>
