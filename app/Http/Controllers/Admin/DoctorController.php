<?php

 

namespace App\Http\Controllers\Admin;

 

use Illuminate\Http\Request;

use App\Models\User;

use App\Http\Controllers\Controller;

use App\Models\Specialty;

 

class DoctorController extends Controller

{

 

 

   

    public function index()

    {

        $doctors = User::doctors()->paginate(3);

        return view('doctors.index', compact('doctors'));

    }

 

   

    public function create()

    {

        $specialties = Specialty::all();

        return view('doctors.create', compact('specialties'));

    }

 

    public function store(Request $request)

    {

 

        $rules = [

            'name' => 'required|min:3',

            'email' => 'required|email',

            'dui' => 'required|digits:9',

            'licencia'=>'required|digits:4',

            'address' => 'nullable|min:6',

            'phone' => 'required',

        ];

        $messages = [

            'name.required' => 'El nombre del médico es obligatorio',

            'name.min' => 'El nombre del médico debe tener más de 3 caracteres',

            'email.required' => 'El correo electrónico es obligatorio',

            'email.email' => 'Ingresa una dirección de correo electrónico válido',

            'dui.required' => 'El dui es obligatorio',

            'dui.digits' => 'El dui debe de tener 9 dígitos',

            'licencia.required' => 'La Licencia es obligatorio',

            'licencia.digits' => 'La Licencia debe de tener 4 dígitos',

            'address.min' => 'La dirección debe tener al menos 6 caracteres',

            'phone.required' => 'El número de teléfono es obligatorio',

        ];

        $this->validate($request, $rules, $messages);

 

        $user = User::create(

            $request->only('name','email','dui','licencia', 'address','phone')

            + [

                'role' => 'doctor',

                'password' => bcrypt($request->input('password'))

            ]

        );

        $user->specialties()->attach($request->input('specialties'));

 

        $notification = 'El médico se ha registrado correctamente.';

        if ($request->hasFile('photo')) {

            $data= User::find($user->id);

            $photo = $request->file('photo');

            $destinationPath = 'public/img'; // Cambia esto según tu estructura de carpetas

       

            $nombreimagen = time() . "." . $photo->guessExtension();

 

            $ruta = public_path() . "/img";

 

            $photo->move($ruta, $nombreimagen);

 

            $data->imagen =  $nombreimagen;

        $data->save();

            // Aquí puedes guardar $photoPath en tu base de datos como la ruta de la imagen del usuario

       

        }

        return redirect('/medicos')->with(compact('notification'));

 

  // Otras validaciones y lógica de almacenamiento aquí

 

 

 

 

 

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

        $doctor = User::doctors()->findOrFail($id);

       

        $specialties = Specialty::all();

        $specialty_ids = $doctor->specialties()->pluck('specialties.id');

 

        return view('doctors.edit', compact('doctor', 'specialties', 'specialty_ids'));

    }

 

   

    public function update(Request $request, $id)

    {

        $rules = [

            'name' => 'required|min:3',

            'email' => 'required|email',

            'dui' => 'required|digits:9',

            'address' => 'nullable|min:6',

            'phone' => 'required',

        ];

        $messages = [

            'name.required' => 'El nombre del médico es obligatorio',

            'name.min' => 'El nombre del médico debe tener más de 3 caracteres',

            'email.required' => 'El correo electrónico es obligatorio',

            'email.email' => 'Ingresa una dirección de correo electrónico válido',

            'dui.required' => 'El dui es obligatorio',

            'dui.digits' => 'El dui debe de tener 9 dígitos',

            'licencia.required' => 'La Licencia es obligatorio',

            'licencia.digits' => 'La Licencia debe de tener 4 dígitos',

            'address.min' => 'La dirección debe tener al menos 6 caracteres',

            'phone.required' => 'El número de teléfono es obligatorio',

        ];

        $this->validate($request, $rules, $messages);

        $user = User::doctors()->findOrFail($id);

 

        $data = $request->only('name','email','dui','licencia', 'address','phone');

        $password = $request->input('password');

 

        if($password)

            $data['password'] = bcrypt($password);

 

        $user->fill($data);

        $user->save();

        $user->specialties()->sync($request->input('specialties'));

 

        $notification = 'La información del médico se actualizo correctamente.';

        if ($request->hasFile('photo')) {

            $data= User::find($id);

            $photo = $request->file('photo');

            $destinationPath = 'public/img'; // Cambia esto según tu estructura de carpetas

       

            $nombreimagen = time() . "." . $photo->guessExtension();

 

            $ruta = public_path() . "/img";

 

            $photo->move($ruta, $nombreimagen);

 

            $data->imagen =  $nombreimagen;

        $data->save();

            // Aquí puedes guardar $photoPath en tu base de datos como la ruta de la imagen del usuario

       

        }

        return redirect('/medicos')->with(compact('notification'));

    }

 

   

    public function destroy($id)

    {

        $user = User::doctors()->findOrFail($id);

        $doctorName = $user->name;

        $user->delete();

 

        $notification = "El médico $doctorName se elimino correctamente";

 

        return redirect('/medicos')->with(compact('notification'));

    }

}