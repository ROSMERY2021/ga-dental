<?php
    use Illuminate\Support\Str;
?>

@extends('layouts.panel')

@section('content')

    <div class="card shadow">
        <div class="card-header border-0">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="mb-0">Editar paciente</h3>
                </div>
                <div class="col text-right">
                    <a href="{{ url('/pacientes') }}" class="btn btn-sm btn-success">
                        <i class="fas fa-chevron-left"></i>
                        Regresar</a>
                </div>
            </div>
        </div>

        <div class="card-body">

            @if ($errors->any())
                @foreach ($errors->all() as $error)
                    <div class="alert alert-danger" role="alert">
                        <i class="fas fa-exclamation-triangle"></i>
                        <strong>Por favor!!</strong> {{ $error }}
                    </div>
                @endforeach
            @endif

            <form action="{{ url('/pacientes/'.$patient->id) }}" method="POST">
                @csrf
                @method('PUT')
                <div class="form-group">
                    <label for="name">Nombre del paciente</label>
                    <input type="text" name="name" class="form-control" value="{{ old('name', $patient->name) }}">
                </div>

                <div class="form-group">
                    <label for="email">Correo electrónico</label>
                    <input type="text" name="email" class="form-control" value="{{ old('email', $patient->email) }}">
                </div>
                <div class="form-group">
                    <label for="edad">Ingrese la Edad</label>
                    <input type="text" name="edad" class="form-control" value="{{ old('edad', $patient->edad) }}">
                </div>
                <div class="form-group">
                    <label for="dui">Dui</label>
                    <input type="text" name="dui" class="form-control" value="{{ old('dui', $patient->dui) }}">
                </div>
                <div class="form-group">
                    <label for="address">Dirección</label>
                    <input type="text" name="address" class="form-control" value="{{ old('address', $patient->address) }}">
                </div>
                <div class="form-group">
                    <label for="phone">Teléfono / Móvil</label>
                     <div class="input-group">
                      <span class="input-group-text">+503</span> <!-- Código de país -->
                     <input type="text" name="phone" class="form-control" placeholder="Número de teléfono" value="{{ old('phone', $patient->phone) }}">
                       </div>
               
                <div class="form-group">
                    <label for="whatsapp">Whatsapp</label>
                    <div class="input-group">
                    <span class="input-group-text">+503</span> <!-- Código de país -->
                    <input type="text" name="whatsapp" class="form-control" value="{{ old('whatsapp', $patient->whatsapp) }}">
                </div>
                <div class="form-group">
                    <label for="red_social">Red social</label>
                    <input type="text" name="red_social" class="form-control" value="{{ old('red_social', $patient->red_social) }}">
                </div><div class="form-group">
                    <label for="musica">Musica preferida</label>
                    <input type="text" name="musica" class="form-control" value="{{ old('musica', $patient->musica) }}">
                </div>
                <div class="form-group">
                    <label for="profesion">Profesion o a que se dedica</label>
                    <input type="text" name="profesion" class="form-control" value="{{ old('profesion', $patient->profesion) }}">
                </div>
                <div class="form-group">
                    <label for="alteraciones">Alteraciones sistematicas / Medicamentos actuales</label>
                    <input type="text" name="alteraciones" class="form-control" value="{{ old('alteraciones', $patient->alteraciones) }}">
                </div>
                <div class="form-group">
                    <label for="como_conocio">Como Conocia GA Dental</label>
                    <input type="text" name="como_conocio" class="form-control" value="{{ old('como_conocio', $patient->como_conocio) }}">
                </div>
                <div class="form-group">
                    <label for="historial">Historia odontológica(Ultima profilaxis, reacciones al anestésico, tiene prótesis denta entre otros)</label>
                    <input type="text" name="historial" class="form-control" value="{{ old('historial', $patient->historial) }}">
                </div>


                <div class="form-group">
                    <label for="password">Contraseña</label>
                    <input type="text" name="password" class="form-control" >
                    <small class="text-warning">Solo llena el campo si desea cambiar la contraseña.</small>
                </div>

                <button type="submit" class="btn btn-sm btn-primary">Guardar cambios</button>
            </form>
        </div>

    </div>

@endsection
