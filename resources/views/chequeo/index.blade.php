@extends('layouts.panel')

@section('content')

<div class="card shadow">
    <div class="card-header border-0">
        <div class="row align-items-center">
            <div class="col">
                <h3 class="mb-0">Chequeo de Pacientes</h3>
            </div>
        </div>
    </div>
    <div class="card-body">
        @if(session('notification'))
            <div class="alert alert-success" role="alert">
                {{ session('notification') }}
            </div>
        @endif
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID de Paciente</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Doctor</th>
                        <th>Observaciones</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($chequeos as $chequeo)
                        <tr>
                            <td>
                                @isset($chequeo->user)
                                    {{ $chequeo->user->name }}
                                @endisset
                            </td>
                            <td>{{ date('Y-m-d', strtotime($chequeo->created_at)) }}</td>
                            <td>{{ date('H:i:s', strtotime($chequeo->created_at)) }}</td>
                            <td>
                                @isset($chequeo->doctor_logueado)
                                    {{ $chequeo->doctor_logueado->name }}
                                @endisset
                            </td>
                            <td class="d-none d-sm-table-cell">{{ $chequeo->observaciones }}</td>
                            <td>
                                <a href="{{ route('chequeo.edit', $chequeo->id) }}" class="btn btn-sm btn-warning mr-2">Ver</a>
                                <form action="{{ route('chequeo.destroy', $chequeo->id) }}" method="POST"
                                    style="display: inline-block;">
                                    @csrf
                                    @method('DELETE')

                                   

                                    <button type="submit" class="btn btn-sm btn-danger"
                                        onclick="return confirm('¿Estás seguro de que quieres eliminar este chequeo?')">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>

@endsection
