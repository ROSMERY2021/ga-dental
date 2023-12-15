<?php

namespace App\Http\Controllers;

use App\Models\Radiografias;
use Illuminate\Http\Request;

class RadiografiasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'chequeo_id' => 'required',
            'imagen' => 'required'
        ]);
        $id = $request->chequeo_id;
        $data = new Radiografias();
        $data->chequeo_id = $id;
        if ($request->hasFile('imagen')) {
            $photo = $request->file('imagen');
            $nombreimagen = time() . "." . $photo->guessExtension();
            $ruta = public_path() . "/img/radiografias";
            $photo->move($ruta, $nombreimagen);
            $data->imagen = $nombreimagen;
        }
        $data->save();

        return redirect('/chequeos/' . $id . '/edit');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\radiografias  $radiografias
     * @return \Illuminate\Http\Response
     */
    public function show(radiografias $radiografias)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\radiografias  $radiografias
     * @return \Illuminate\Http\Response
     */
    public function edit(radiografias $radiografias)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\radiografias  $radiografias
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, radiografias $radiografias)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\radiografias  $radiografias
     * @return \Illuminate\Http\Response
     */
    public function destroy(radiografias $radiografias)
    {
        //
    }
}
