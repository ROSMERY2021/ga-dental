<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Log;
use Spatie\DbDumper\Databases\MySql;

class BackupController extends Controller
{
    public function index()
    {
        return view('backup.index');
    }

    public function downloadPhpMyAdmin()
    {
        $file = public_path('citamedica.sql');
        if (file_exists($file)) {
            $nombreDescarga = 'citamedica-' . date('d-m-Y') . '.sql';
            return response()->download($file, $nombreDescarga);
        } else {
            abort(404, 'Archivo no encontrado');
        }
    }

    public function downloadMySQL()
    {
        $backupPath = 'C:\Users\DELL\Desktop\backup\MySQL.sql';

        if (!file_exists($backupPath)) {
            return back()->with('error', 'El archivo MySQL.sql no se encontró en la ruta especificada.');
        }

        return response()->download($backupPath, 'MySQL.sql', [
            'Content-Type' => 'application/octet-stream',
            'Content-Disposition' => 'attachment'
        ]);
    }

    public function downloadUsers()
    {
        $users = User::all();
        $headers = array(
            "Content-type" => "text/csv",
            "Content-Disposition" => "attachment; filename=users.csv",
            "Pragma" => "no-cache",
            "Cache-Control" => "must-revalidate, post-check=0, pre-check=0",
            "Expires" => "0"
        );
        $callback = function () use ($users) {
            $file = fopen('php://output', 'w');
            fputcsv($file, array('ID', 'Nombre', 'Correo electrónico', 'Rol')); // Headers
            foreach ($users as $user) {
                fputcsv($file, array($user->id, $user->name, $user->email, $user->role)); // Data
            }
            fclose($file);
        };
        return Response::stream($callback, 200, $headers);
    }

    public function restore(Request $request)
    {
        $backupFilePath = storage_path('C:\Users\DELL\Downloads\users.sql');

        if (File::exists($backupFilePath)) {
            $command = sprintf('mysql -u %s -p%s %s < %s', env('DB_USERNAME'), env('DB_PASSWORD'), env('DB_DATABASE'), $backupFilePath);

            try {
                exec($command);
                Log::info('Backup was successfully restored from ' . $backupFilePath);
                return back()->with('success', 'El archivo de respaldo se ha restaurado correctamente en la base de datos.');
            } catch (\Exception $e) {
                Log::error('Error restoring backup: ' . $e->getMessage());
                return back()->with('error', 'Ocurrió un error al intentar restaurar el archivo de respaldo.');
            }
        } else {
            return back()->with('error', 'El archivo de respaldo no se encontró en la ubicación especificada.');
        }
    }
}
