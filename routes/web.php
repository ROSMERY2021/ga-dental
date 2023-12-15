<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\OdontogramaController;
use App\Http\Controllers\ChequeoController;
use App\Http\Controllers\BackupController;
use App\Http\Controllers\Admin\ChartController;
use App\Http\Controllers\RadiografiasController;

Route::get('/', function () {
    return view('auth.login');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::middleware(['auth', 'admin'])->group(function () {
    //Rutas Especialidades
    Route::get('/especialidades', [App\Http\Controllers\admin\SpecialtyController::class, 'index']);
    Route::get('/especialidades/create', [App\Http\Controllers\admin\SpecialtyController::class, 'create']);
    Route::get('/especialidades/{specialty}/edit', [App\Http\Controllers\admin\SpecialtyController::class, 'edit']);
    Route::post('/especialidades', [App\Http\Controllers\admin\SpecialtyController::class, 'sendData']);
    Route::put('/especialidades/{specialty}', [App\Http\Controllers\admin\SpecialtyController::class, 'update']);
    Route::delete('/especialidades/{specialty}', [App\Http\Controllers\admin\SpecialtyController::class, 'destroy']);

    //Rutas Médicos
    Route::resource('medicos', 'App\Http\Controllers\admin\DoctorController');

    //Rutas Pacientes
    Route::resource('pacientes', 'App\Http\Controllers\admin\PatientController');
    Route::put('/pacientes/{id}/reactivar', 'App\Http\Controllers\Admin\PatientController@reactivate')->name('pacientes.reactivar');



    //Rutas Reportes
    Route::get('/reportes/citas/line', [App\Http\Controllers\admin\ChartController::class, 'appointments']);
    Route::get('/reportes/doctors/column', [App\Http\Controllers\admin\ChartController::class, 'doctors']);
    Route::get('/reportes/doctors/column/data', [App\Http\Controllers\admin\ChartController::class, 'doctorsJson']);

    // historial

    Route::get('/reportes/historial', [App\Http\Controllers\Admin\ChartController::class, 'patientHistory'])->name('charts.edit');
    Route::post('/guardar_historial', [App\Http\Controllers\Admin\ChartController::class, 'guardarHistorial']);
    Route::get('/reportes/index', [ChartController::class, 'index'])->name('reportes.index');
    Route::get('/paciente/seleccionar', [ChartController::class, 'selectPatient']);
    Route::post('/guardar_historial', [HistorialController::class, 'guardarHistorial'])->name('guardar_historial');
    Route::get('/historial/{id}', 'ChartController@show')->name('historial.show');

    Route::get('/pacientes/{id}/ver-historial', 'ChartController@showHistorial')->name('ver_historial');
    Route::get('/pacientes/{id}/editar-historial', 'Admin\ChartController@editHistorial')->name('editar_historial');

    //subir archivo

    Route::get('/pacientes/search', 'PacientesController@search');
    Route::post('/upload/file', 'UploadController@upload')->name('upload.file');
});

Route::middleware(['auth', 'doctor'])->group(function () {
    Route::get('/horario', [App\Http\Controllers\doctor\HorarioController::class, 'edit']);
    Route::post('/horario', [App\Http\Controllers\doctor\HorarioController::class, 'store']);
});

Route::middleware('auth')->group(function () {

    Route::get('/reservarcitas/create', [App\Http\Controllers\AppointmentController::class, 'create']);
    Route::post('/reservarcitas', [App\Http\Controllers\AppointmentController::class, 'store']);
    Route::get('/miscitas', [App\Http\Controllers\AppointmentController::class, 'index']);
    Route::get('/miscitas/{appointment}', [App\Http\Controllers\AppointmentController::class, 'show']);
    Route::post('/miscitas/{appointment}/cancel', [App\Http\Controllers\AppointmentController::class, 'cancel']);
    Route::post('/miscitas/{appointment}/confirm', [App\Http\Controllers\AppointmentController::class, 'confirm']);

    Route::get('/miscitas/{appointment}/cancel', [App\Http\Controllers\AppointmentController::class, 'formCancel']);

    //JSON
    Route::get('/especialidades/{specialty}/medicos', [App\Http\Controllers\Api\SpecialtyController::class, 'doctors']);
    Route::get('/horario/horas', [App\Http\Controllers\Api\HorarioController::class, 'hours']);

    // odontograma

    Route::resource('radiografias', RadiografiasController::class)->names('radiografias');
    // Ruta para mostrar el odontograma
    Route::get('/odontograma', [OdontogramaController::class, 'show'])->name('odontograma.show');
    Route::get('/filtroDinamico', [OdontogramaController::class, 'filtroDinamico'])->name('filtroDinamico');

    // Ruta para actualizar el color de un diente
    Route::put('/odontograma/{tooth}', [OdontogramaController::class, 'update'])->name('odontograma.update');

    Route::get('/odontograma/{id}/edit', [OdontogramaController::class, 'edit'])->name('odontograma.edit');
    Route::post('/guardar-cambios', [OdontogramaController::class, 'guardarCambios'])->name('guardarCambios');


    //Chequeo
    Route::get('/chequeo', [ChequeoController::class, 'mostrarChequeos'])->name('chequeo.index');

    Route::get('/chequeos/{chequeo}/edit', [App\Http\Controllers\ChequeoController::class, 'edit'])->name('chequeo.edit');
    Route::get('/chequeos/create', [App\Http\Controllers\ChequeoController::class, 'create'])->name('chequeo.create');
    Route::delete('/chequeos/{chequeo}', [App\Http\Controllers\ChequeoController::class, 'destroy'])->name('chequeo.destroy');
    Route::post('/chequeo', [ChequeoController::class, 'store'])->name('chequeo.store');


    //respaldo
    Route::get('/backup', [BackupController::class, 'index'])->name('backup.index');
    Route::post('/backup', [BackupController::class, 'performBackup'])->name('backup.perform');
    Route::post('/backup/restore', [BackupController::class, 'restore'])->name('backup.restore');
    Route::get('/backup/downloadPhpMyAdmin', [BackupController::class, 'downloadPhpMyAdmin'])->name('backup.downloadPhpMyAdmin');
    Route::get('/backup/download-mysql', [BackupController::class, 'downloadMySQL'])->name('backup.downloadMySQL');
    Route::get('/backup/download/users', 'BackupController@downloadUsers')->name('backup.downloadUsers');
});
