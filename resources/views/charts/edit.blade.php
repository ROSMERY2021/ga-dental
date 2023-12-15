@extends('layouts.panel')

@section('content')

        <div class="card shadow">
            <div class="card-header border-0">
                <div class="row align-items-center">
                    <div class="col">
                        <h3 class="mb-0">Historial</h3>
                    </div>
                    
                </div>
            </div>
            <div class="card-body">
                <div id="container">

                </div>
            </div>
        </div>

<!-- historial.blade.php -->
<form action="/guardar_historial" method="POST">
    @csrf

    <label for="codigo_expediente">Código de expediente:</label>
    <input type="text" name="codigo_expediente" id="codigo_expediente"><br><br>

    <label for="fecha_ingreso">Fecha de ingreso:</label>
    <input type="date" name="fecha_ingreso" id="fecha_ingreso"><br><br>

    <label for="nombre_paciente">Nombre del paciente:</label>
    <input type="text" name="nombre_paciente" id="nombre_paciente"><br><br>

    <label for="edad">Edad:</label>
    <input type="number" name="edad" id="edad"><br><br>

    <label for="direccion">Dirección:</label>
    <input type="text" name="direccion" id="direccion"><br><br>

    <label for="telefono">Teléfono:</label>
    <input type="text" name="telefono" id="telefono"><br><br>

    <label for="whatsapp">Whatsapp:</label>
    <input type="text" name="whatsapp" id="whatsapp"><br><br>

    <label for="correo_electronico">Correo electrónico:</label>
    <input type="email" name="correo_electronico" id="correo_electronico"><br><br>

    <label for="musica_preferida">Música preferida:</label>
    <input type="text" name="musica_preferida" id="musica_preferida"><br><br>

    <label for="profesion">Profesión:</label>
    <input type="text" name="profesion" id="profesion"><br><br>

    <label for="motivo_consulta">Motivo de consulta:</label>
    <textarea name="motivo_consulta" id="motivo_consulta"></textarea><br><br>

    <label for="alteraciones_sistema">Alteraciones del sistema:</label>
    <textarea name="alteraciones_sistema" id="alteraciones_sistema"></textarea><br><br>

    <label for="medicamentos_actuales">Medicamentos actuales:</label>
    <textarea name="medicamentos_actuales" id="medicamentos_actuales"></textarea><br><br>

    <label for="como_conocio_gadental">¿Cómo conoció a GA-Dental?:</label>
    <input type="text" name="como_conocio_gadental" id="como_conocio_gadental"><br><br>

    <label for="ultima_profiriaxis">Última profilaxis:</label>
    <input type="date" name="ultima_profiriaxis" id="ultima_profiriaxis"><br><br>

    <label for="reacciones_anestecico">Reacciones al anestésico:</label>
    <input type="text" name="reacciones_anestecico" id="reacciones_anestecico"><br><br>

    <label for="protesis_actuales">Prótesis actuales:</label>
    <textarea name="protesis_actuales" id="protesis_actuales"></textarea><br><br>

    <label for="historial_odontologico">Historial odontológico:</label>
    <textarea name="historial_odontologico" id="historial_odontologico"></textarea><br><br>

    <button type="submit">Guardar historial</button>
</form>

@if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif
@endsection
