<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Models\User;
use App\Http\Controllers\Controller;

class PatientController extends Controller
{
    public function index()
    {
        $patients = User::patients()->paginate(3);
        return view('patients.index', compact('patients'));
    }


    public function create()
    {
        return view('patients.create');
    }

    public function showOdontograma()
    {
        $odontogramaController = App::make('App\Http\Controllers\OdontogramaController');
        return $odontogramaController->show();
    }


    public function store(Request $request)
    {
        $rules = [
            'name' => 'required|min:3',
            'email' => 'required|email',
            'edad' => 'required|digits:2',
            'address' => 'nullable|min:6',
            'phone' => 'required',
        ];
        $messages = [
            'name.required' => 'El nombre del paciente es obligatorio',
            'name.min' => 'El nombre del paciente debe tener más de 3 caracteres',
            'email.required' => 'El correo electrónico es obligatorio',
            'email.email' => 'Ingresa una dirección de correo electrónico válido',
            'edad.required' => 'La edad es obligatorio',
            'cedula.digits' => 'La edad debe de tener 2 dígitos',
            'address.min' => 'La dirección debe tener al menos 6 caracteres',
            'phone.required' => 'El número de teléfono es obligatorio',
        ];
        $this->validate($request, $rules, $messages);

        User::create(
            $request->only('name', 'email', 'edad', 'dui', 'address', 'phone', 'whatsapp', 'red_social', 'musica', 'profesion', 'alteraciones', 'como_conocio', 'historial')
                + [
                    'role' => 'paciente',
                    'password' => bcrypt($request->input('password'))
                ]
        );
        $notification = 'El paciente se ha registrado correctamente.';
        return redirect('/pacientes')->with(compact('notification'));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $patient = User::Patients()->findOrFail($id);
        return view('patients.edit', compact('patient'));
    }


    public function update(Request $request, $id)
    {
        $rules = [
            'name' => 'required|min:3',
            'email' => 'required|email',
            'edad' => 'required|digits:2',
            'address' => 'nullable|min:6',
            'phone' => 'required',
        ];
        $messages = [
            'name.required' => 'El nombre del paciente es obligatorio',
            'name.min' => 'El nombre del paciente debe tener más de 3 caracteres',
            'email.required' => 'El correo electrónico es obligatorio',
            'email.email' => 'Ingresa una dirección de correo electrónico válido',
            'edad.required' => 'La edad es obligatorio',
            'edad.digits' => 'La edad debe de tener 2 dígitos',
            'address.min' => 'La dirección debe tener al menos 6 caracteres',
            'phone.required' => 'El número de teléfono es obligatorio',
        ];
        $this->validate($request, $rules, $messages);
        $user = User::Patients()->findOrFail($id);

        $data = $request->only('name', 'email', 'edad', 'dui', 'address', 'phone', 'whatsapp', 'red_social', 'musica', 'profesion', 'alteraciones', 'como_conocio', 'historial');
        $password = $request->input('password');

        if ($password)
            $data['password'] = bcrypt($password);

        $user->fill($data);
        $user->save();

        $notification = 'La información del paciente se actualizo correctamente.';
        return redirect('/pacientes')->with(compact('notification'));
    }

    public function destroy($id)
    {
        $user = User::findOrFail($id);
        $PacienteName = $user->name;

        $user->status = 'dado_de_baja';
        $user->save();

        $notification = "El paciente $PacienteName fue dado de baja correctamente";

        return redirect('/pacientes')->with(compact('notification'));
    }

    public function reactivate($id)
    {
        $user = User::findOrFail($id);
        $PacienteName = $user->name;

        $user->status = 'activo';
        $user->save();

        $notification = "El paciente $PacienteName ha sido reactivado correctamente.";

        return redirect('/pacientes')->with(compact('notification'));
    }
}
