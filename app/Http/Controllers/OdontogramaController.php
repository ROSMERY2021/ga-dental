<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Tooth;
use App\Models\Patient;
use App\Models\User;
use App\Models\Chequeo;
use App\Http\Controllers\Controller;

class OdontogramaController extends Controller
{


    public function filtroDinamico(Request $request)
    {
        $term = trim($request->term);
        $tipo = $request->tipo;
        $patients = User::select('id', 'name AS text')
            ->where('name', 'LIKE', '%' . $term . '%')
            ->where('role', $tipo)->simplePaginate(10);
        $morePages = true;
        if (empty($patients->nextPageUrl())) {
            $morePages = false;
        }
        $results = [
            'results' => $patients->items(),
            'pagination' => [
                'more' => $morePages,
            ],
        ];

        return response()->json($results);
    }
    // Método para mostrar el odontograma
    public function show()
    {

        // Obtén la lista de pacientes con sus dientes
        $patients = User::where('role', 'paciente')->get();
        $doctors = User::where('role', 'doctor')->get();

        return view('odontograma.index', compact('patients', 'doctors'));

        $user = User::Patients()->findOrFail($id);
        $PacienteName = $user->name;

        // Obtén la lista de doctores con sus pacientes

        $doctors = User::where('role', 'doctor')->get();

        return view('odontograma.index', compact('doctors'));


        $user = User::doctors()->findOrFail($id);
        $doctorName = $user->name;



        $notification = 'El odontograma se ha registrado correctamente.';
        return redirect('/odontograma')->with(compact('notification'));
    }

    public function store(Request $request)
    {
        // ...
        // Guarda el nuevo chequeo
        $chequeo->save();

        // Redirige a alguna página de confirmación o a la vista que desees
        return redirect()->route('chequeo.index')->with('success', 'Chequeo guardado correctamente.');
    }

    // Método para actualizar el color de un diente
    public function update(Request $request, Tooth $tooth)
    {
        // Valida y actualiza el color del diente
        $request->validate([
            'color' => 'required|string|max:255', // Puedes ajustar las reglas de validación según tus necesidades
        ]);

        $tooth->update(['color' => $request->input('color')]);

        return back();
    }

    public function guardarCambios(Request $request)
    {
        // Validar los datos de entrada
        $data = $request->validate([
            'dientes' => 'required|array',
            'observaciones' => 'nullable|string',
            'doctores' => 'nullable|string|required',
            'pacientes' => 'nullable|string|required'
        ]);

        // Crear un nuevo registro de Chequeo
        $chequeo = new Chequeo();
        $chequeo->patient_id = $data['pacientes'];
        $chequeo->tooth_number = 1;
        $chequeo->date = date('Y-m-d');
        $chequeo->time = date('h:m:s');
        $chequeo->doctor = $data['doctores'];
        $chequeo->observaciones = $data['observaciones'];
        $chequeo->save();

        // Vincular los dientes con el chequeo recién creado
        foreach ($data['dientes'] as $diente) {

            $tooth = new Tooth();
            $tooth->color = $diente['color'];
            $tooth->icono = $diente['simbolo'];
            $tooth->tooth_number = $diente['numero'];
            $tooth->chequeo_id = $chequeo->id;
            $tooth->save();
        }

        // Redirigir a la vista de chequeo con un mensaje de éxito
        return response()->json(['success' => 'success']);
    }
}
