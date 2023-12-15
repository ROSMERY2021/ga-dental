@extends('layouts.panel')

@section('content')

<div class="card shadow">
    <div class="card-header border-0">
        <div class="row align-items-center">
            <div class="col">
                <h3 class="mb-0">Pacientes</h3>
            </div>
            <div class="col text-right">
                <a href="{{ url('/pacientes/create') }}" class="btn btn-sm btn-primary">Nuevo paciente</a>
            </div>
        </div>
    </div>
    <div class="card-body">
        @if(session('notification'))
            <div class="alert alert-success" role="alert">
                 {{ session('notification') }}
            </div>
        @endif
    </div>
    <div class="table-responsive">
        <!-- Projects table -->
        <table class="table align-items-center table-flush">
            <thead class="thead-light">
                <tr>
                    <th scope="col">Nombre</th>
                    <th scope="col">Correo</th>
                    <th scope="col">Edad</th>
                    <th scope="col">Telefono</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Opciones</th>
                </tr>
            </thead>
            <tbody>
                @foreach($patients as $paciente)
                <tr>
                    <th scope="row">
                        {{ $paciente->name }}
                    </th>
                    <td>
                        {{ $paciente->email }}
                    </td>
                    <td>
                        {{ $paciente->edad}}
                    </td>
                    <td>
                        +503 {{ $paciente->phone}}
                    </td>
                    <td>
                        @if($paciente->status === 'dado_de_baja')
                            <span class="badge badge-danger">Dado de baja</span>
                        @else
                            <span class="badge badge-success">Activo</span>
                        @endif
                    </td>
                    <td>
                        <form action="{{ url('/pacientes/'.$paciente->id) }}" method="POST" style="display: inline;">
                            @csrf 
                            @method('DELETE') 
                            <button type="submit" class="btn btn-sm btn-danger">Dar de baja</button>
                        </form>
                        <a href="{{ url('/pacientes/'.$paciente->id.'/edit') }}" class="btn btn-sm btn-primary">Editar</a>
                        <form action="{{ url('/pacientes/'.$paciente->id.'/reactivar') }}" method="POST" style="display: inline;">
                            @csrf 
                            @method('PUT') 
                            <button type="submit" class="btn btn-sm btn-success">Reactivar</button>
                        </form>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    <div class="card-body">
        {{ $patients->links() }}
    </div>
</div>

@endsection
