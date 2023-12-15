<?php

use App\Models\Appointment;

function obtenerNotificacion()
{
    $countNotificacion = Appointment::where('status', 'Reservada')->get();
    return $countNotificacion;
}
