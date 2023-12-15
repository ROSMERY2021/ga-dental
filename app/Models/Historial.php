<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Historial extends Model
{
    use HasFactory;

    protected $table = 'historiales'; // Reemplaza 'historiales' con el nombre real de tu tabla

    protected $fillable = [
        'codigo_expediente',
        'fecha_ingreso',
        'nombre_paciente',
        'edad',
        'dui',
        'direccion',
        'telefono',
        'whatsapp',
        'correo_electronico',
        'musica_preferida',
        'profesion',
        'motivo_consulta',
        'alteraciones_sistema',
        'medicamentos_actuales',
        'como_conocio_gadental',
        'ultima_profiriaxis',
        'reacciones_anestecico',
        'protesis_actuales',
        'historial_odontologico',
        // Agrega más campos según sea necesario
    ];

    // Si hay relaciones con otros modelos, puedes definirlas aquí
    // Por ejemplo:
    // public function paciente()
    // {
    //     return $this->belongsTo(Paciente::class, 'paciente_id');
    // }
}
