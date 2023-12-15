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
            <div id="container" class="">

                <!-- Buscador de Pacientes -->
                <form action="{{ route('reportes.index') }}" method="get" target="_blank" class="row mb-3">
                    <input type="hidden" name="tipo" value="pdf">
                    <div class="col-12 mb-3">
                        <select name="pacientes" id="pacientes" class="custom-select"></select>
                    </div>
                    <div class="col-6">
                        <label for="">Desde</label>
                        <input type="date" name="desde" id="desde" class="form-control">
                    </div>
                    <div class="col-6">
                        <label for="">Hasta</label>
                        <input type="date" name="hasta" id="hasta" class="form-control">
                    </div>
                    <div class="col-12 text-center mt-4">
                        <input type="submit" value="Enviar" class="btn btn-primary">

                    </div>
                </form>
                <hr>
            </div>
        </div>
    </div>
@endsection
@section('styles')
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/@ttskch/select2-bootstrap4-theme@x.x.x/dist/select2-bootstrap4.min.css">
@endsection
@section('scripts')
    <!-- Incluye jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <!-- Incluye los archivos CSS y JS de select2 -->

    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <!-- Código JavaScript personalizado -->
    <script>
        $(document).ready(function() {
            // Resto del código JavaScript ...
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $('#pacientes').select2({
                theme: 'bootstrap4',
                placeholder: "Seleccione...",
                allowClear: true,
                ajax: {
                    url: '../paciente/seleccionar',
                    dataType: 'json',
                    delay: 250,
                    data: function(params) {
                        return {
                            term: params.term || "",
                            page: params.page || 1,
                        };
                    },
                    cache: true,
                }
            });
        });
    </script>
@endsection
