<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Chequeo;
use App\Models\Radiografias;
use App\Models\Tooth;
use App\Models\User;

class ChequeoController extends Controller
{
    public function mostrarChequeos()
    {
        // Aquí irá la lógica para mostrar los chequeos
        $chequeos = Chequeo::all();

        // Si tienes una relación entre Chequeo y User, puedes cargar la información del usuario con cada chequeo
        // $chequeos->load('user');

        return view('chequeo.index', compact('chequeos'));
    }




    public function store(Request $request)
    {
        // ... Código existente ...

        // Crea un nuevo chequeo
        $chequeo = new Chequeo();
        // ... Rellenar otros campos ...

        // Guarda el nuevo chequeo
        $chequeo->save();

        // Relaciona los dientes con el chequeo recién creado
        foreach ($request->input('dientes') as $diente) {
            $tooth = new Tooth();
            $tooth->color = $diente['color']; // Asegúrate de tener el campo de color en tu modelo Tooth
            // ... Otros campos necesarios ...
            $tooth->chequeo_id = $chequeo->id;
            $tooth->save();
        }

        // Redirige a alguna página de confirmación o a la vista que desees
        return redirect()->route('chequeo.index')->with('success', 'Chequeo guardado correctamente.');
    }

    public function  edit($id)
    {

        $chequeo = Chequeo::find($id);
        $dientes = Tooth::where('chequeo_id', $id)->get(); // obtengo todos los dientes
        $radiografias = Radiografias::where('chequeo_id', $id)->get();
        return view('chequeo.edit', compact('chequeo', 'dientes', 'id', 'radiografias'));
    }

    public function destroy($id)
    {
        $chequeo = Chequeo::find($id);

        if (!$chequeo) {
            return response()->json(['error' => 'Chequeo no encontrado'], 404);
        }

        $chequeo->delete();

        return redirect()->route('chequeo.index')->with('success', 'Chequeo eliminado correctamente');
    }
}
