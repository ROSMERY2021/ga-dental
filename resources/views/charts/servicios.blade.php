@extends('layouts.panel')

@section('content')

    <div class="card shadow">
        <div class="card-header border-0">
            <div class="row align-items-center">
                <div class="col">
                    <h3 class="mb-0">Reporte: Servicios brindados</h3>
                </div>
                
            </div>
        </div>
        <div class="card-body">
            <div id="container"></div>
        </div>
    </div>

@endsection

@section('scripts')
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/series-label.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>

    <script>
        Highcharts.chart('container', {
            chart: {
                type: 'column'
            },
            title: {
                text: 'Servicios brindados por mes'
            },
            xAxis: {
                categories: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Cantidad de Servicios'
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f} servicios</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
            series: [{
                name: 'Relleno',
                data: [5, 3, 4, 7, 2, 6, 4, 5, 9, 6, 5, 4]
            }, {
                name: 'Puente',
                data: [2, 2, 3, 2, 1, 3, 2, 1, 3, 4, 2, 1]
            }, {
                name: 'Corona',
                data: [3, 4, 4, 2, 5, 3, 4, 3, 2, 3, 4, 3]
            }, {
                name: 'Fractura',
                data: [3, 4, 4, 2, 5, 3, 4, 3, 2, 3, 4, 3]
            }]
        });

    </script>
@endsection
