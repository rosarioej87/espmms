<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use PDF;

class ReportController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function generate()
    {
        $data = '';
        $fileName = 'monitoring-and-evaluation.pdf';
        $mpdf = new \Mpdf\Mpdf([
            'orientation' => 'L',
            'format' => [203, 330],
            'margin_left' => 20,
            'margin_right' => 20,
            'margin_top' => 20,
            'margin_bottom' => 20,
            'margin_header' => 10,
            'margin_footer' => 10
        ]);
        $html = \View::make('report.report')->with('data', $data);
        $html = $html->render();
        $stylesheet = file_get_contents('css/mpdf.css');
        $mpdf->WriteHTML($stylesheet,\Mpdf\HTMLParserMode::HEADER_CSS);
        $mpdf->WriteHTML($html,\Mpdf\HTMLParserMode::HTML_BODY);
        $mpdf->Output($fileName, 'I');
    }
}

