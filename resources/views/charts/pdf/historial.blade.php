<!DOCTYPE html>
<html lang="es">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Historial del paciente</title>
    <style>
        html {
            margin: 0;
        }

        body {
            font-family: "Times New Roman", serif;
            margin: 5mm 5mm 5mm 5mm;
        }

        h1 {
            color: #0B6FA4;
        }

        h1 img {
            margin-right: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th,
        td {
            border: 1px solid #e3eaed;
            padding: 15px;
            /* Añade espacio entre las celdas */
            text-align: left;
            width: 25%;
        }

        th {
            background-color: #0B6FA4;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #E6F7FF;
        }

        tr:nth-child(odd) {
            background-color: #B3E0FF;
        }

        table.paleBlueRows {
            font-family: "Times New Roman", Times, serif;
            border: 1px solid #FFFFFF;
            width: 100%;

            text-align: center;
            border-collapse: collapse;
        }


        table.paleBlueRows td,
        table.paleBlueRows th {
            border: 1px solid #FFFFFF;
            padding: 3px 2px;
        }

        table.paleBlueRows tbody td {
            font-size: 13px;
        }

        table.paleBlueRows tr:nth-child(even) {
            background: #D0E4F5;
        }

        table.paleBlueRows thead {
            background: #0B6FA4;
            border-bottom: 5px solid #FFFFFF;
        }

        table.paleBlueRows thead th {
            font-size: 17px;
            font-weight: bold;
            color: #FFFFFF;
            text-align: center;
            border-left: 2px solid #FFFFFF;
        }

        table.paleBlueRows thead th:first-child {
            border-left: none;
        }

        table.paleBlueRows tfoot {
            font-size: 14px;
            font-weight: bold;
            color: #333333;
            background: #D0E4F5;
            border-top: 3px solid #444444;
        }

        table.paleBlueRows tfoot td {
            font-size: 14px;
        }
    </style>
</head>
@php
    $counter = 1;
@endphp

<body>
    <h1 style="display: inline-block;">
        <img src="{{ public_path('img/brand/dental.png') }}" alt="Logo Dental" width="80" style="max-width: 100%; vertical-align: middle;">
        Historial del Paciente
    </h1>
    <table>
        <thead>
            <tr>
                <th colspan="4">Datos del Paciente</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><strong>Codigo de paciente:</strong></td>
                <td>{{ $user->id }}</td>
                <td><strong>Nombre:</strong></td>
                <td>{{ $user->name }}</td>
            </tr>
            <tr>
                <td><strong>Correo:</strong></td>
                <td>{{ $user->email }}</td>
                <td><strong>DUI:</strong></td>
                <td>{{ $user->dui }}</td>
            </tr>
            <tr>
                <td><strong>Edad:</strong></td>
                <td>{{ $user->edad }}</td>
                <td><strong>Dirección:</strong></td>
                <td>{{ $user->address }}</td>
            </tr>
            <tr>
                <td><strong>Teléfono:</strong></td>
                <td>{{ $user->phone }}</td>
                <td><strong>Whatsapp:</strong></td>
                <td>{{ $user->whatsapp }}</td>
            </tr>
            <tr>
                <td><strong>Red social:</strong></td>
                <td>{{ $user->red_social }}</td>
                <td><strong>Música:</strong></td>
                <td>{{ $user->musica }}</td>
            </tr>
            <tr>
                <td><strong>Profesión:</strong></td>
                <td>{{ $user->profesion }}</td>
                <td><strong>Alteraciones:</strong></td>
                <td>{{ $user->alteraciones }}</td>
            </tr>
            <tr>
                <td><strong>Como lo conoció:</strong></td>
                <td>{{ $user->como_conocio }}</td>
                <td><strong>Historial:</strong></td>
                <td>{{ $user->historial }}</td>
            </tr>
        </tbody>
    </table>
    <p></p>
    @foreach ($chequeos as $chequeo)
        <table class="paleBlueRows">
            <thead>
                <tr>
                    <th>ID de Paciente</th>
                    <th>Número de Diente</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Doctor</th>
                    <th>Observaciones</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td>
                        @isset($chequeo->user)
                            {{ $chequeo->user->name }}
                        @endisset
                    </td>
                    <td>{{ $chequeo->tooth_number }}</td>
                    <td>{{ $chequeo->date }}</td>
                    <td>{{ $chequeo->time }}</td>
                    <td>
                        @isset($chequeo->doctor_logueado)
                            {{ $chequeo->doctor_logueado->name }}
                        @endisset
                    </td>
                    <td>{{ $chequeo->observaciones }}</td>
                </tr>
            </tbody>
        </table>
        <table class="paleBlueRows">
            <thead>
                <tr>
                    <th colspan="5">Detalles</th>
                </tr>
                <tr>
                    <th colspan="2">ID</th>
                    <th>Número de Diente</th>
                    <th colspan="2">Daño</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($chequeo->dientes as $item)
                    <tr>
                        <td colspan="2">{{ $item->id }}</td>
                        <td>{{ $item->tooth_number }}</td>
                        <td colspan="2">
                            @if ($item->icono == 'circulo')
                                <div
                                    style="margin-left:40%; border-radius: 50%; background-color: {{ $item->color }}; width: 5px; height:5px; padding: 5px;">
                                </div>
                            @else
                                @if ($item->color == 'blue' && $item->icono == '↺')
                                    <img style="margin-left:40%; "
                                        src="{{ public_path('img/iconoOdontrograma/flecha_curva_azul.png') }}">
                                @endif
                                @if ($item->color == 'red' && $item->icono == '↺')
                                    <img style="margin-left:40%; "
                                        src="{{ public_path('img/iconoOdontrograma/flecha_curva_roja.png') }}">
                                @endif
                                @if ($item->color == 'blue' && $item->icono == '║')
                                    <img style="margin-left:40%; "
                                        src="{{ public_path('img/iconoOdontrograma/flecha_pareja_azul.png') }}">
                                @endif
                                @if ($item->color == 'red' && $item->icono == '║')
                                    <img style="margin-left:40%; "
                                        src="{{ public_path('img/iconoOdontrograma/flecha_pareja_roja.png') }}">
                                @endif
                                @if ($item->color == 'blue' && $item->icono == '○')
                                    <img style="margin-left:40%; "
                                        src="{{ public_path('img/iconoOdontrograma/circulo_sinrelleno_azul.png') }}">
                                @endif
                                @if ($item->color == 'red' && $item->icono == '○')
                                    <img style="margin-left:40%; "
                                        src="{{ public_path('img/iconoOdontrograma/circulo_sinrelleno_rojo.png') }}">
                                @endif
                                @if ($item->color == 'blue' && $item->icono == '🡠')
                                    <img style="margin-left:40%; "
                                        src="{{ public_path('img/iconoOdontrograma/flecha_izquierda_azul.png') }}">
                                @endif
                                @if ($item->color == 'red' && $item->icono == '🡠')
                                    <img style="margin-left:40%; "
                                        src="{{ public_path('img/iconoOdontrograma/flecha_izquierda_roja.png') }}">
                                @endif
                                @if ($item->color == 'blue' && $item->icono == '🡢')
                                    <img style="margin-left:40%; "
                                        src="{{ public_path('img/iconoOdontrograma/flecha_derecha_azul.png') }}">
                                @endif
                                @if ($item->color == 'red' && $item->icono == '🡢')
                                    <img style="margin-left:40%; "
                                        src="{{ public_path('img/iconoOdontrograma/flecha_derecha_roja.png') }}">
                                @endif
                                @if ($item->color == 'blue' && $item->icono == '🡡')
                                    <img style="margin-left:40%; "
                                        src="{{ public_path('img/iconoOdontrograma/flecha_arriba_azul.png') }}">
                                @endif
                                @if ($item->color == 'red' && $item->icono == '🡡')
                                    <img style="margin-left:40%; "
                                        src="{{ public_path('img/iconoOdontrograma/flecha_arriba_roja.png') }}">
                                @endif
                                @if ($item->color == 'blue' && $item->icono == '🡣')
                                    <img style="margin-left:40%; "
                                        src="{{ public_path('img/iconoOdontrograma/flecha_abajo_azul.png') }}">
                                @endif
                                @if ($item->color == 'red' && $item->icono == '🡣')
                                    <img style="margin-left:40%; "
                                        src="{{ public_path('img/iconoOdontrograma/flecha_abajo_roja.png') }}">
                                @endif
                                @if ($item->icono == 'X')
                                    <label style="margin-left:40%; color: {{ $item->color }}; font-size: 14pt;">
                                        {!! $item->icono !!}
                                    </label>
                                @endif
                                @endif
                                @if ($item->icono == 'z')
                                    <label style="margin-left:40%; color: {{ $item->color }}; font-size: 14pt;">
                                        {!! $item->icono !!}
                                    </label>
                                @endif
                           
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        <table class="paleBlueRows">
            <thead>
                <tr>
                    <th colspan="6">Radiografias</th>
                </tr>
                <tr>
                    <th colspan="3">ID</th>
                    <th colspan="3">Imagen</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($chequeo->radiografia as $radio)
                    <tr>
                        <td colspan="3">{{ $radio->id }}</td>
                        <td colspan="3"><img src="{{ public_path('img/radiografias/' . $radio->imagen) }}"
                                width="100px" alt="">
                        </td>

                    </tr>
                @endforeach
            </tbody>
        </table>
    @endforeach
</body>

</html>
