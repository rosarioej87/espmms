<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use PDF;
use NcJoes\OfficeConverter\OfficeConverter;
use PhpOffice\PhpWord\PhpWord;
use PhpOffice\PhpWord\TemplateProcessor;

class DocumentController extends Controller
{
    // Generate word Document using Template
    public function __invoke(Request $request)
    {
        //Create table
        $document_with_table = new PhpWord();
        $section = $document_with_table->addSection();
        $styleCell = array('borderColor' =>'black', 'borderSize' => 6);
        $table = $section->addTable();
        for ($r = 1; $r <= 8; $r++) {
            $table->addRow();
            for ($c = 1; $c <= 5; $c++) {
                $table->addCell(10000, $styleCell)->addText("Row {$r}, Cell {$c}");
            }
        }

        // Create writer to convert document to xml
        $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($document_with_table, 'Word2007');

        // Get all document xml code
        $fullxml = $objWriter->getWriterPart('Document')->write();

        // Get only table xml code
        $tablexml = preg_replace('/^[\s\S]*(<w:tbl\b.*<\/w:tbl>).*/', '$1', $fullxml);


        $templateProcessor = new TemplateProcessor('./storage/report/template.docx');
        $templateProcessor->setValue('table', $tablexml);


        $templateProcessor->setValue('firstname', 'Emil June');
        $templateProcessor->setValue('lastname', 'Rosario');
        $templateProcessor->saveAs('./storage/report/result.docx');
        return ('Document Downloaded');

//        $converter = new OfficeConverter('./storage/report/result.docx', null, 'soffice', false);
//        $converter->convertTo('result.pdf');
//        return view('print_tests.test_pdf');
    }



    public function convertWordToPDF()
    {
        // Laravel: Dynamically Change The Content In Word File And Convert To PDF

        /* Set the PDF Engine Renderer Path */
        $domPdfPath = base_path('vendor/dompdf/dompdf');
        \PhpOffice\PhpWord\Settings::setPdfRendererPath($domPdfPath);
        \PhpOffice\PhpWord\Settings::setPdfRendererName('DomPDF');

        /*@ Reading doc file */
        $template = new TemplateProcessor(public_path('./storage/report/sample.docx'));

        /*@ Replacing variables in doc file */
        $template->setValue('date', date('d-m-Y'));
        $template->setValue('title', 'Mr.');
        $template->setValue('firstname', 'Scratch');
        $template->setValue('lastname', 'Coder');

        /*@ Save Temporary Word File With New Name */
        $saveDocPath = public_path('./storage/report/new-result.docx');
        $template->saveAs($saveDocPath);

        // Load temporarily create word file
        $Content = \PhpOffice\PhpWord\IOFactory::load($saveDocPath);

        //Save it into PDF
        $savePdfPath = public_path('./storage/report/new-result.pdf');

        /*@ If already PDF exists then delete it */
        if ( file_exists($savePdfPath) ) {
            unlink($savePdfPath);
        }

        //Save it into PDF
        $PDFWriter = \PhpOffice\PhpWord\IOFactory::createWriter($Content,'PDF');
        $PDFWriter->save($savePdfPath);
        // echo 'File has been successfully converted';
        return view('print_tests.test_pdf');

        /*@ Remove temporarily created word file */
        if ( file_exists($saveDocPath) ) {
            unlink($saveDocPath);
        }

    }

    // Convert Word to PDF Only
    public function convertDocToPDF()
    {
        $converter = new OfficeConverter('./storage/report/result.docx', null, 'soffice', false);
        $converter->convertTo('new-result.pdf');
        return view('print_tests.test_pdf');
    }

    public function convert()
    {
        $converter = new OfficeConverter('test-file.docx');
        $converter->convertTo('output-file.pdf'); //generates pdf file in same directory as test-file.docx
        $converter->convertTo('output-file.html'); //generates html file in same directory as test-file.docx

        //to specify output directory, specify it as the second argument to the constructor
        $converter = new OfficeConverter('test-file.docx', 'path-to-outdir');
    }
}
