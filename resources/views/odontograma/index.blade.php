@extends('layouts.panel')

@section('styles')
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/@ttskch/select2-bootstrap4-theme@x.x.x/dist/select2-bootstrap4.min.css">
@endsection
@section('content')

    <!-- Agrega el meta tag para el token CSRF -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- Incluye el enlace a tu archivo de script -->
    <script src="{{ asset('public/js/script.js') }}"></script>



    <!-- Agrega los scripts de Highcharts para exportación y exportación de datos -->
@section('scripts')
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/offline-exporting.js"></script>
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
                    url: '../filtroDinamico?tipo=paciente',
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
            $('#doctores').select2({
                theme: 'bootstrap4',
                placeholder: "Seleccione...",
                allowClear: true,
                ajax: {
                    url: '../filtroDinamico?tipo=doctor',
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

<div class="card shadow">
    <div class="card-header border-0">
        <div class="container-fluid">
            <h1 class="text-center" style="margin-bottom: 20px; margin-top: 20px;">Odontograma</h1>
            <div style="margin-bottom: 40px;">
                <div class="form-group" style="margin-bottom: 20px;">
                </div>
            </div>



            <div class="d-flex justify-content-between align-items-center">
                <div class="form-group text-center"
                    style="margin-bottom: 20px; flex: 2; display: flex; flex-direction: column; align-items: center;">
                    <label for="pacientes" style="margin-bottom: 0;">Pacientes</label>
                    <select id="pacientes" class="form-control" title="Seleccionar pacientes"
                        style="background-color: #5e72e4; color: white; margin-top: 10px;">
                        <option disabled selected>Seleccionar</option>

                    </select>
                </div>

                <div style="width: 20px;"></div> <!-- Espacio entre los dos elementos -->
                <div class="form-group text-center"
                    style="margin-bottom: 20px; flex: 2; display: flex; flex-direction: column; align-items: center;">
                    <label for="doctores" style="margin-bottom: 0;">Doctor</label>
                    <select id="doctores" class="form-control" title="Seleccionar doctores"
                        style="background-color: #5e72e4; color: white; margin-top: 10px;">
                        <option disabled selected>Seleccionar</option>

                    </select>
                </div>


            </div>




            <div class="row justify-content-center" style="margin-top: 45px;">
                <div class="col-12 text-center">
                    <div class="dientes-fila">
                        @php
                            $imagenesDientes = [
                                11 => 'img/11.png',
                                12 => 'img/12.png',
                                13 => 'img/13.png',
                                14 => 'img/14.png',
                                15 => 'img/15.png',
                                16 => 'img/16.png',
                                17 => 'img/17.png',
                                18 => 'img/18.png',
                            ];
                        @endphp
            
                        @for ($i = 18; $i >= 11; $i--)
                            <div class="diente" onclick="marcarDiente(this, {{ $i }})">
                                <img src="{{ asset($imagenesDientes[$i]) }}" alt="Diente {{ $i }}" style="width: 40px; height: 58px;">
                                <img src="{{ asset('img/diente.png') }}" alt="Diente {{ $i }}" style="width: 40px; height: 40px;">
                                <div>{{ $i }}</div>
                                <div class="diente-symbol diente-color"></div>
                                <!-- Agrega esta línea para mostrar el símbolo con color -->
                            </div>
                        @endfor
            
                        @php
                        $imagenesDientes2 = [
                            21 => 'img/21.png',
                            22 => 'img/22.png',
                            23 => 'img/23.png',
                            24 => 'img/24.png',
                            25 => 'img/25.png',
                            26 => 'img/26.png',
                            27 => 'img/27.png',
                            28 => 'img/28.png',
                        ];
                    @endphp
                    
                    @for ($i = 21; $i <= 28; $i++)
                        <div class="diente" onclick="marcarDiente(this, {{ $i }})">
                            <img src="{{ asset($imagenesDientes2[$i]) }}" alt="Diente {{ $i }}" style="width: 40px; height: 58px;">
                            <img src="{{ asset('img/diente.png') }}" alt="Diente {{ $i }}" style="width: 40px; height: 40px;">
                            <div>{{ $i }}</div>
                            <div class="diente-symbol diente-color"></div>
                            <!-- Agrega esta línea para mostrar el símbolo con color -->
                        </div>
                    @endfor
                    
                </div>
                <div class="dientes-fila">
                    @php
                    $imagenesDientes6 = [
                        41 => 'img/41.png',
                        42 => 'img/42.png',
                        43 => 'img/43.png',
                        44 => 'img/44.png',
                        45 => 'img/45.png',
                        46 => 'img/46.png',
                        47 => 'img/47.png',
                        48 => 'img/48.png',
                    ];
                @endphp
                
                @for ($i = 48; $i >= 41; $i--)
                    <div class="diente" onclick="marcarDiente(this, {{ $i }})">
                        <img src="{{ asset($imagenesDientes6[$i]) }}" alt="Diente {{ $i }}" style="width: 40px; height: 58px;">
                        <img src="{{ asset('img/diente.png') }}" alt="Diente {{ $i }}" style="width: 40px; height: 40px;">
                        <div>{{ $i }}</div>
                        <div class="diente-symbol diente-color"></div>
                        <!-- Agrega esta línea para mostrar el símbolo con color -->
                    </div>
                @endfor
                
                @php
                $imagenesDientes4 = [
                    31 => 'img/31.png',
                    32 => 'img/32.png',
                    33 => 'img/33.png',
                    34 => 'img/34.png',
                    35 => 'img/35.png',
                    36 => 'img/36.png',
                    37 => 'img/37.png',
                    38 => 'img/38.png',
                ];
            @endphp
        
            @for ($i = 31; $i <= 38; $i++)
                <div class="diente" onclick="marcarDiente(this, {{ $i }})">
                    <img src="{{ asset($imagenesDientes4[$i]) }}" alt="Diente {{ $i }}" style="width: 40px; height: 58px;">
                    <img src="{{ asset('img/diente.png') }}" alt="Diente {{ $i }}" style="width: 40px; height: 40px;">
                    <div>{{ $i }}</div>
                    <div class="diente-symbol diente-color"></div>
                    <!-- Agrega esta línea para mostrar el símbolo con color -->
                </div>
            @endfor
            


                    </div>
                </div>
            </div>
            <div>

                <div class="row">
                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon icon-rojo"
                                onclick="seleccionarSimbolo(this, 'X', 'red')"style="font-size: 27px;">X</div>

                        </div>
                    </div>

                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon icon-azul"
                                onclick="seleccionarSimbolo(this,'X', 'blue')"style="font-size: 27px;">X</div>

                        </div>
                    </div>

                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon" style="background-color: #ff0000;"
                                onclick="seleccionarSimbolo(this,'circulo', 'red')"style="font-size: 27px;"></div>

                        </div>
                    </div>

                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon" style="background-color: #0000ff;"
                                onclick="seleccionarSimbolo(this,'circulo', 'blue')"style="font-size: 27px;"></div>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon-u icon-rojo"
                                onclick="seleccionarSimbolo(this,'○', 'red')"style="font-size: 40px;">○</div>

                        </div>
                    </div>

                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon-u icon-azul"
                                onclick="seleccionarSimbolo(this,'○', 'blue')"style="font-size: 40px;">○</div>

                        </div>
                    </div>

                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon-i icon-rojo-i"
                                onclick="seleccionarSimbolo(this,'║', 'red')"style="font-size: 27px;">II</div>

                        </div>
                    </div>

                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon-i icon-azul-i"
                                onclick="seleccionarSimbolo(this,'║', 'blue')"style="font-size: 27px;">II</div>

                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon-flecha informacion-icon-flecha-roja"
                                onclick="seleccionarSimbolo(this,'🡢', 'red')"style="font-size: 27px;">🡢</div>

                        </div>
                    </div>
                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon-flecha informacion-icon-flecha-azul-i"
                                onclick="seleccionarSimbolo(this,'🡢', 'blue')"style="font-size: 27px;">🡢</div>

                        </div>
                    </div>


                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon-flecha informacion-icon-flecha-roja-i"
                                onclick="seleccionarSimbolo(this,'🡠', 'red')"style="font-size: 27px;">🡠</div>

                        </div>
                    </div>
                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon-flecha informacion-icon-flecha-azul"
                                onclick="seleccionarSimbolo(this,'🡠', 'blue')"style="font-size: 27px;">🡠</div>
                        </div>
                    </div>


                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon-flecha-up icon-rojo"
                                onclick="seleccionarSimbolo(this,'🡡', 'red')"style="font-size: 27px;">🡡</div>

                        </div>
                    </div>

                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon-flecha-up icon-azul"
                                onclick="seleccionarSimbolo(this,'🡡', 'blue')"style="font-size: 27px;">🡡</div>

                        </div>
                    </div>



                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon-flecha-down icon-roja-h"
                                onclick="seleccionarSimbolo(this,'🡣', 'red')"style="font-size: 27px;">🡣</div>

                        </div>
                    </div>
                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon-flecha-down icon-azul"
                                onclick="seleccionarSimbolo(this,'🡣', 'blue')"style="font-size: 27px;">🡣</div>

                        </div>
                    </div>

                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon-flecha-down-c icon-roja-c"
                                onclick="seleccionarSimbolo(this,'↺', 'red')"style="font-size: 27px;">↺</div>

                        </div>
                    </div>

                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon-flecha-down-c icon-azul-c"
                                onclick="seleccionarSimbolo(this,'↺', 'blue')"style="font-size: 27px;">↺</div>

                        </div>
                    </div>

                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon-flecha-down-z icon-roja-z"
                                onclick="seleccionarSimbolo(this,'z', 'red')"style="font-size: 27px;">z</div>

                        </div>
                    </div>

                    <div class="col-3">
                        <div class="informacion-item">
                            <div class="informacion-icon-flecha-down-z icon-azul-z"
                                onclick="seleccionarSimbolo(this,'z', 'blue')"style="font-size: 27px;">z</div>

                        </div>
                    </div>


                </div>


                <div class="form-group" style="margin-top: 19px;">
                    <label for="observaciones">Observaciones</label>
                    <textarea class="form-control" id="observaciones" rows="2">
        </textarea>

                    <div class="card-footer text-center">
                        <button class="btn btn-primary" onclick="guardarCambios()">Guardar</button>
                    </div>


                    @if (session('success'))
                        <div class="alert alert-success">
                            {{ session('success') }}
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>


    <!-- Tu código HTML existente -->

    <script>
        let selectedSymbol = '';
        let selectedColor = '';
        let selectIcoColor = '';
        let arrayDientes = [];

        function marcarDiente(element, numDiente) {
            if (selectedSymbol) {
                let dienteSymbolElement = element.querySelector('.diente-symbol');
                if (dienteSymbolElement) {
                    element.removeChild(dienteSymbolElement);
                    arrayDientes = arrayDientes.filter(e => e.numero !== numDiente);
                } else {
                    dienteSymbolElement = document.createElement('div');
                    dienteSymbolElement.classList.add('diente-symbol');

                    dienteSymbolElement.style.position = 'absolute';
                    dienteSymbolElement.style.fontSize = '18px';
                    dienteSymbolElement.style.fontWeight = 'bold';
                    dienteSymbolElement.style.top = '61%';
                    dienteSymbolElement.style.left = '52%';
                    dienteSymbolElement.style.transform = 'translate(-50%, -50%)';
                    if (selectedSymbol === 'circulo') {
                        dienteSymbolElement.style.borderRadius = '50%';
                        dienteSymbolElement.style.backgroundColor = selectIcoColor;
                        dienteSymbolElement.style.width = '20px';
                        dienteSymbolElement.style.height = '20px';
                    } else {
                        dienteSymbolElement.textContent = selectedSymbol;
                        dienteSymbolElement.style.color = selectedColor; // Agregar el color seleccionado al símbolo
                    }

                    element.appendChild(dienteSymbolElement);
                    arrayDientes.push({
                        numero: numDiente,
                        simbolo: selectedSymbol,
                        color: selectIcoColor // Guardar el color seleccionado en la matriz
                    });
                }
                console.log(arrayDientes);
            } else {
                console.error('Por favor, selecciona un símbolo antes de marcar el diente.');
            }
        }

        function seleccionarSimbolo(element, simbolo, color) {
            selectedSymbol = simbolo;
            selectIcoColor = color;
            selectedColor = window.getComputedStyle(element).getPropertyValue('color');
        }


        function guardarCambios() {
            let dientes = document.querySelectorAll('.diente');
            let observaciones = document.getElementById('observaciones').value;
            let pacientes = document.getElementById('pacientes').value;
            let doctores = document.getElementById('doctores').value;

            let data = {
                doctores: doctores,
                pacientes: pacientes,
                dientes: arrayDientes,
                observaciones: observaciones
            };

            fetch('/guardar-cambios', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                    },
                    body: JSON.stringify(data)
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        console.log('Cambios guardados exitosamente');

                        // Aquí puedes mostrar un mensaje de éxito en la página
                    }
                    location.reload()

                })
                .catch((error) => {
                    console.error('Error:', error);
                });
        }
    </script>

    <style>
       


        /* Estilos CSS para los elementos del odontograma */
        .diente {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 10px 5px;
            /* Ajusta el margen superior e inferior a 15px */
            position: relative;
        }

        .dientes-fila {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .x-mark {
            position: absolute;
            top: 0;
            right: 0;
        }

        select {
            margin-top: 20px;
            /* Ajusta el margen superior del select a 15px */
        }

        .informacion-item {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .informacion-icon {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            margin-right: 10px;
        }

        /* ... estilos x ... */
        .informacion-icon {
            width: 20px;
            height: 20px;
            text-align: center;
            line-height: 20px;
            /* No es necesario establecer background-color en transparent aquí */
        }

        .icon-rojo {
            color: #ff0000;
            /* Color rojo para la 'X' */
        }

        .icon-azul {
            color: #0000ff;
            /* Color azul para la 'X' */
        }

        /* ... estilos U ... */

        .informacion-icon-u {
            width: 20px;
            height: 20px;
            text-align: center;
            line-height: 20px;
            /* No es necesario establecer background-color en transparent aquí */
            font-size: 20px;
        }

        .icon-rojo-u {
            color: #ff0000;
            /* Color rojo para la 'U' */
        }

        .icon-azul-u {
            color: #0000ff;
            /* Color azul para la 'U' */
        }

        /* ... estilos II ... */

        .informacion-icon-i {
            width: 20px;
            height: 20px;
            text-align: center;
            line-height: 20px;
            /* No es necesario establecer background-color en transparent aquí */
            font-size: 23px;
        }

        .icon-rojo-i {
            color: red;
            /* Color rojo para 'II' */
        }

        .icon-azul-i {
            color: blue;
            /* Color azul para 'II' */
        }

        /* ... estilos flechas ... */
        .informacion-icon-flecha {
            width: 25px;
            height: 22px;
            text-align: center;
            line-height: 22px;
            border: none;
        }

        .informacion-icon-flecha-roja {
            color: red;
        }

        .informacion-icon-flecha-azul {
            color: blue;
        }

        .informacion-icon-flecha {
            width: 25px;
            height: 22px;
            text-align: center;
            line-height: 22px;
            border: none;
        }

        .informacion-icon-flecha-azul-i {
            color: blue;
        }

        .informacion-icon-flecha-roja-i {
            color: red;
        }


        /* ... estilos flechas arriba  ... */
        .informacion-icon-flecha-up {
            width: 20px;
            height: 20px;
            text-align: center;
            line-height: 20px;
            border: none;
        }

        .icon-rojo {
            color: #ff0000;
        }

        .icon-azul {
            color: #0000ff;
        }




        .informacion-icon-flecha-down-c {
            width: 20px;
            height: 20px;
            text-align: center;
            line-height: 20px;
            border: none;
        }


        .icon-roja-h {
            color: #ff0000;
        }

        .icon-azul {
            color: #0000ff;
        }

        .informacion-icon-flecha-down-c {
            width: 20px;
            height: 20px;
            text-align: center;
            line-height: 20px;
            border: none;
        }


        .icon-roja-c {
            color: #ff0000;
        }

        .icon-azul-c {
            color: #0000ff;
        }

        .informacion-icon-flecha-down-z {
            width: 28px;
            height: 20px;
            text-align: center;
            line-height: 20px;
            border: none;
        }


        .icon-roja-z {
            color: #ff0000;
        }

        .icon-azul-z {
            color: #0000ff;
        }
    </style>

    <!-- Agrega un enlace a tu archivo de hoja de estilos de impresión -->
    <link rel="stylesheet" href="{{ asset('public/css/print-styles.css') }}">



@endsection


<script>
    function imprimirPagina() {
        // Agrega los scripts de Highcharts para impresión
        let scripts = document.querySelectorAll('script');
        scripts.forEach(script => {
            if (script.src.includes('highcharts')) {
                let scriptTag = document.createElement('script');
                scriptTag.src = script.src;
                document.body.appendChild(scriptTag);
            }
        });

        // Funcionalidad de impresión
        window.print();
    }


    function seleccionarSimbolo(simbolo) {
        selectedSymbol = simbolo;
    }
</script>