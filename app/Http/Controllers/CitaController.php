<?php

use App\Models\Notification;

class CitaController extends Controller
{
    // Otras funciones del controlador

    public function store(Request $request)
    {
        // Lógica para guardar la cita en la base de datos

        // Crea una nueva notificación para el paciente
        Notification::create([
            'user_id' => $request->user_id, // Suponiendo que $request->user_id contiene el ID del paciente
            'message' => 'Se ha reservado una nueva cita.',
        ]);

        // Otras acciones y redirecciones
    }

    public function mostrarNotificaciones()
{
    $notifications = Notification::where('user_id', $userId)->get();
    return view('layouts.panel', compact('notifications'));
}
}
