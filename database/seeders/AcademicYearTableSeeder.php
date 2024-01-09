<?php

namespace Database\Seeders;

use App\Models\AcademicYear;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use PHPUnit\Framework\SkippedTestError;

class AcademicYearTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        AcademicYear::truncate();

        foreach (range(1,20) as $index) {
            AcademicYear::create([
                'year' => (2009 + $index).'-'.(2010 + $index),
                'active' => 0,
            ]);
        }
    }
}
