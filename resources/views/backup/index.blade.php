@extends('layouts.panel')

@section('content')
    <div class="card shadow">
        <div class="card-header border-0">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="mb-0">Respaldo</h3>
                </div>
            </div>
        </div>

        @if (session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif

        @if (session('error'))
            <div class="alert alert-danger">
                {{ session('error') }}
            </div>
        @endif

       

        <div class="card-body">
            {{-- <form action="{{ route('backup.restore') }}" method="POST">
                @csrf
                <div class="form-group" style="margin-bottom: 30px;">
                    <label for="restore_date">Seleccionar fecha de restauración:</label>
                    <input type="date" id="restore_date" name="restore_date" class="form-control"
                        style="max-width: 280px;">
                </div>


            </form> --}}

            <div class="form-group" style="margin-bottom: 30px;">
                <label for="restore_date">Seleccionar fecha de descarga:</label>
                <input type="date" id="restore_date" name="restore_date" class="form-control" style="max-width: 280px;">
            </div>

            <div style="margin-top: 40px;">

                <div class="custom-card-blue col-md-5 mb-3">
                    <div class="card-body">
                        <a href="{{ route('backup.downloadPhpMyAdmin') }}"
                            class="custom-button-blue btn btn-primary btn-block" style="text-decoration: none;">
                            <i class="fas fa-database mr-2"></i> Descargar backup
                        </a>
                    </div>
                </div>
                <br>
                {{-- <div class="custom-card-turquoise col-md-5 mb-3">
                    <div class="card-body">
                        <a href="{{ route('backup.downloadMySQL') }}" class="custom-button-turquoise btn btn-success btn-block" style="text-decoration: none;">
                            <i class="fas fa-database mr-2"></i> Descargar backup MySQL
                        </a>
                    </div>
                </div> --}}
            </div>
        </div>
    </div>
@endsection

<style>
    .custom-card-blue {
        border: 1px solid #007bff;
        /* Borde azul */
    }

    .custom-card-turquoise {
        border: 1px solid #40E0D0;
        /* Borde turquesa */

    }

    .custom-button-blue {
        border-color: #007bff;
        color: #007bff;
        background-color: transparent;
    }

    .custom-button-turquoise {
        border-color: #40E0D0;
        ;
        color: #40E0D0;
        ;
        background-color: transparent;
    }
</style>
