<?php
    use Illuminate\Support\Str;
?>

@extends('layouts.panel')

@section('content')

    <div class="card shadow">
        <div class="card-header border-0">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="mb-0">Nuevo paciente</h3>
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

            <form action="{{ url('/pacientes') }}" method="POST">
                @csrf
                <div class="form-group">
                    <label for="name">Nombre del paciente</label>
                    <input type="text" name="name" class="form-control" value="{{ old('name') }}" required>
                </div>

                <div class="form-group">
                    <label for="email">Correo electrónico</label>
                    <input type="text" name="email" class="form-control" value="{{ old('email') }}">
                </div>
                <div class="form-group">
                    <label for="edad">Ingrese la Edad</label>
                    <input type="text" name="edad" class="form-control" value="{{ old('edad') }}">
                </div>
                
                <div class="form-group">
                    <label for="dui">Dui</label>
                    <input type="text" name="dui" class="form-control" value="{{ old('dui') }}">
                </div>
                <div class="form-group">
                    <label for="address">Dirección</label>
                    <input type="text" name="address" class="form-control" value="{{ old('address') }}">
                </div>
                <div class="form-group">
                    <label for="phone">Teléfono / Móvil</label>
                    <div class="input-group">
                      <span class="input-group-text">+503</span> <!-- Código de país -->
                    <input type="text" name="phone"  class="form-control" value="{{ old('phone')}}">
                     </div>
                </div>
                <div class="form-group">
                    <label for="whatsapp">Whatsapp</label>
                    <div class="input-group">
                    <span class="input-group-text">+503</span> <!-- Código de país -->
                    <input type="text" name="whatsapp" class="form-control" value="{{ old('whatsapp') }}">
                </div>
            </div>
                <div class="form-group">
                    <label for="red_social">Red social</label>
                    <input type="text" name="red_social" class="form-control" value="{{ old('red_social') }}">
                </div><div class="form-group">
                    <label for="musica">Musica preferida</label>
                    <input type="text" name="musica" class="form-control" value="{{ old('musica') }}">
                </div>
                <div class="form-group">
                    <label for="profesion">Profesion o a que se dedica</label>
                    <input type="text" name="profesion" class="form-control" value="{{ old('profesion') }}">
                </div>
                <div class="form-group">
                    <label for="alteraciones">Alteraciones sistematicas / Medicamentos actuales</label>
                    <input type="text" name="alteraciones" class="form-control" value="{{ old('alteraciones') }}">
                </div>
                <div class="form-group">
                    <label for="como_conocio">Como Conoció GA Dental</label>
                    <input type="text" name="como_conocio" class="form-control" value="{{ old('como_conocio') }}">
                </div>
                <div class="form-group">
                    <label for="historial">Historia odontológica(Ultima profilaxis, reacciones al anestésico, tiene prótesis denta entre otros)</label>
                    <input type="text" name="historial" class="form-control" value="{{ old('historial') }}">
                </div>

                <div class="form-group">
                    <label for="password">Contraseña</label>
                    <input type="text" name="password" class="form-control" value="{{ old('password', Str::random(8)) }}">
                </div>

                <button type="submit" class="btn btn-sm btn-primary">Crear paciente</button>
            </form>
        </div>

    </div>

@endsection
