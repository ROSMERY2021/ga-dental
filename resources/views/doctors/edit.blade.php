<?php
    use Illuminate\Support\Str;
?>

@extends('layouts.panel')

@section('styles')

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">

@endsection

@section('content')

    <div class="card shadow">
        <div class="card-header border-0">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="mb-0">Editar médico</h3>
                </div>
                <div class="col text-right">
                    <a href="{{ url('/medicos') }}" class="btn btn-sm btn-success">
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

            <form action="{{ url('/medicos/'.$doctor->id) }}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                
                   <!-- Campo para la imagen existente -->
      
            <!-- Agregar campo para la nueva imagen -->
            <div class="form-group">
                <label for="photo">Nueva Foto</label>
                <input type="file" name="photo" id="photo" class="form-control-file">
            </div>

                <div class="form-group">
                    <label for="name">Nombre del médico</label>
                    <input type="text" name="name" class="form-control" value="{{ old('name', $doctor->name) }}">
                </div>

                <div class="form-group">
                    <label for="specialties">Especialidades</label>
                    <select name="specialties[]" id="specialties" class="form-control selectpicker"
                    data-style="btn-primary" title="Seleccionar especialidades" multiple required>
                        @foreach ($specialties as $especialidad)
                            <option value="{{ $especialidad->id }}">{{ $especialidad->description }}</option>
                        @endforeach
                    </select>
                </div>

                <div class="form-group">
                    <label for="email">Correo electrónico</label>
                    <input type="text" name="email" class="form-control" value="{{ old('email', $doctor->email) }}">
                </div>
                <div class="form-group">
                    <label for="dui">Dui</label>
                    <input type="text" name="dui" class="form-control" value="{{ old('dui', $doctor->dui) }}">
                </div>
                <div class="form-group">
                    <label for="licencia">Licencia</label>
                    <input type="text" name="licencia"  class="form-control" value="{{ old('licencia', $doctor->licencia)}}">
                    <div>
                <div class="form-group">
                    <label for="address">Dirección</label>
                    <input type="text" name="address" class="form-control" value="{{ old('address', $doctor->address) }}">
                </div>
                <div class="form-group">
                    <label for="phone">Teléfono / Móvil</label>
                    <div class="input-group">
                    <span class="input-group-text">+503</span> <!-- Código de país -->
                    <input type="text" name="phone" class="form-control" value="{{ old('phone', $doctor->phone) }}">
                </div>
                <div class="form-group">
                    <label for="password">Contraseña</label>
                    <input type="text" name="password" class="form-control">
                    <small class="text-warning">Solo llena el campo si desea cambiar la contraseña</small>
                </div>

                <button type="submit" class="btn btn-sm btn-primary">Guardar cambios</button>
            </form>
        </div>

    </div>

@endsection

@section('scripts')

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>

<script>
    $(document).ready(()=> {});
    $('#specialties').selectpicker('val', @json($specialty_ids) );
</script>

@endsection
