@extends('layouts.panel')

@section('content')
    @include('chequeo.modal')
    <div class="row">
        <div class="col-6">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex justify-content-between">
                        <h3>Chequeo </h3>
                    </div>
                </div>
                <div class="card-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Número de Diente</th>
                                <th>Daño</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($dientes as $item)
                                <tr>
                                    <td>{{ $item->id }}</td>
                                    <td>{{ $item->tooth_number }}</td>
                                    <td>
                                        @if ($item->icono == 'circulo')
                                            <div
                                                style="border-radius: 50%; background-color: {{ $item->color }}; width: 20px; height:20px; padding: 10px;">
                                            </div>
                                        @else
                                            <label style="color: {{ $item->color }}; font-size: 14pt;">
                                                {{ $item->icono }}</label>
                                        @endif
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>


                </div>
            </div>
        </div>
        <div class="col-6">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex justify-content-between">
                        <h3>Radiografias</h3>
                        <a href="{{ url()->previous() }}" class="btn btn-primary">
                             Regresar</a>
                    </div>
                </div>
                <div class="card-body">
                    <form action="{{ route('radiografias.store') }}" method="POST" enctype="multipart/form-data"
                        class="g-4">
                        @csrf
                        <input type="hidden" name="chequeo_id" value="{{ $id }}" />
                        <div class="form-group">
                            <label for="imagen">Radiografia</label>
                            <input type="file" name="imagen" class="form-control" accept="image/*" />
                        </div>
                        <button type="submit" class="btn btn-sm btn-primary mb-3">Agregar</button>
                    </form>

                    @php
                        $counter = 1;
                    @endphp
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Archivo</th>

                            </tr>
                        </thead>
                        <tbody>

                            @foreach ($radiografias as $item)
                                <tr>
                                    <td>{{ $counter }}</td>
                                    <td> <img class="img-fluid imgzoom img-thumbnail" width="100px" id="imgzoom"
                                            data-pathimage="{{ asset('/img/radiografias/' . $item->imagen) }}"
                                            src="{{ asset('img/radiografias/' . $item->imagen) }}"> </td>
                                </tr>
                                @php
                                    $counter++;
                                @endphp
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        $(document).on("click", "#imgzoom", function() {
            var imgsrc = $(this).data("pathimage");
            $("#my_image").attr("src", imgsrc);
            $("#showimagen").modal("show");
        });
    </script>
@endsection
