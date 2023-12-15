<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Appointment;
use App\Models\User;
use App\Models\Chequeo;
use Carbon\Carbon;
use App\Models\Historial;
use Illuminate\Http\Request;
use App\Models\Radiografias;
use Illuminate\Support\Facades\DB;
use Barryvdh\DomPDF\Facade\Pdf;

class ChartController extends Controller
{
    public function appointments()
    {

        $monthCounts = Appointment::select(
            DB::raw('MONTH(created_at) as month'),
            DB::raw('COUNT(1) as count')
        )
            ->groupBy('month')
            ->get()
            ->toArray();
        $counts = array_fill(0, 12, 0);
        foreach ($monthCounts as $monthCount) {
            $index = $monthCount['month'] - 1;
            $counts[$index] = $monthCount['count'];
        }

        return view('charts.appointments', compact('counts'));
    }

    public function doctors()
    {
        $now = Carbon::now();
        $end = $now->format('Y-m-d');
        $start = $now->subYear()->format('Y-m-d');

        return view('charts.doctors', compact('end', 'start'));
    }

    public function doctorsJson(Request $request)
    {

        $start = $request->input('start');
        $end = $request->input('end');

        $doctors = User::doctors()
            ->select('name')
            ->withCount([
                'attendedAppointments' => function ($query) use ($start, $end) {
                    $query->whereBetween('scheduled_date', [$start, $end]);
                },
                'cancellAppointments' => function ($query) use ($start, $end) {
                    $query->whereBetween('scheduled_date', [$start, $end]);
                }
            ])
            ->orderBy('attended_appointments_count', 'desc')
            ->take(5)
            ->get();

        $data = [];
        $data['categories'] = $doctors->pluck('name');

        $series = [];
        $series1['name'] = 'Citas atendidas';
        $series1['data'] = $doctors->pluck('attended_appointments_count');
        $series2['name'] = 'Citas canceladas';
        $series2['data'] = $doctors->pluck('cancell_appointments_count');

        $series[] = $series1;
        $series[] = $series2;
        $data['series'] = $series;

        return $data;
    }

    public function patientHistory()
    {
        // Aquí va la lógica para mostrar el historial del paciente
        return view('charts.edit'); // Asegúrate de reemplazar 'patient_history' con el nombre real de tu vista
    }

    public function guardarHistorial(Request $request)
    {
        // Validar los datos del formulario
        $validatedData = $request->validate([
            'codigo_expediente' => 'required',
            'fecha_ingreso' => 'required',
            'nombre_paciente' => 'required',
            // Agrega más reglas de validación según sea necesario
        ]);

        // Crear un nuevo modelo y asignar los valores recibidos del formulario
        $historial = new Historial();
        $historial->codigo_expediente = $request->codigo_expediente;
        $historial->fecha_ingreso = $request->fecha_ingreso;
        $historial->nombre_paciente = $request->nombre_paciente;
        // Asigna los valores restantes según los nombres de los campos en el formulario

        // Guardar el nuevo historial en la base de datos
        $historial->save();

        // Redirigir a una página de éxito o a la página principal
        return redirect()->route('charts.edit')->with('success', 'Historial guardado exitosamente');
    }


    //El historial de paciente

    public function index(Request $request)
    {
        if (isset($request->tipo)) {
            $id = $request->pacientes;
            $desde = $request->desde;
            $hasta = $request->hasta;

            $user = User::find($id);
            $query = Chequeo::query();
            if (isset($desde) && isset($hasta)) {
                $query->whereBetween('created_at', [$desde, $hasta]);
            }
            $query->where('patient_id', $id);
            $chequeos = $query->get();
            $pdf = Pdf::loadView('charts.pdf.historial', compact('user', 'chequeos'));
            return $pdf->stream();
        }
        $patients = User::where('role', 'paciente')->get();
        return view('charts.index', compact('patients'));
    }

    public function show($id)
    {
        $patient = User::findOrFail($id);

        // Puedes cargar el historial del paciente aquí según tu lógica y modelos
        $historial = $patient->historial; // Asegúrate de tener la relación adecuada en tu modelo User

        return view('historial.show', compact('patient', 'historial'));
    }

    public function selectPatient(Request $request)
    {
        $term = trim($request->term);
        $patients = User::select('id', 'name AS text')
            ->where('name', 'LIKE', '%' . $term . '%')
            ->where('role', 'paciente')->simplePaginate(10);
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
    public function showHistorial($id)
    {
        $patient = User::findOrFail($id);
        $historial = $patient->historial; // Asegúrate de tener la relación adecuada en tu modelo User

        return view('charts.show_historial', compact('patient', 'historial'));
    }

    public function editHistorial($id)
    {
        $patient = User::findOrFail($id);
        $historial = $patient->historial; // Asegúrate de tener la relación adecuada en tu modelo User

        return view('charts.edit', compact('patient', 'historial'));
    }
}
