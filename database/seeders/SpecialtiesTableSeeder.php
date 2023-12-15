<?php

namespace Database\Seeders;

use App\Models\Specialty;
use App\Models\User;
use Illuminate\Database\Seeder;

class SpecialtiesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $specialties = [
            'Anestesiología dental',
            'Odontología de salud pública',
            'Endodoncia',
            'Patología oral y maxilofacial',
            'Radiología oral y maxilofacial',
            'Cirugía oral y maxilofacial',
            'Medicina oral',
            'Ortodoncia y ortopedia dentofacial',
            'Especialista en dolor orofacial',
            'Odontología pediátrica',
            'Periodoncia',
            'Prostodoncia'
        ];
        foreach ($specialties as $specialty) {
            $specialty = Specialty::create([
                'name' => '',
                'description' => $specialty
            ]);
            $specialty->users()->saveMany(
                User::factory(4)->state(['role' => 'doctor'])->make()
            );
        }
        User::find(3)->specialties()->save($specialty);
    }
}
