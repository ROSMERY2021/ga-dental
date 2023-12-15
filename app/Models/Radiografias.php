<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Radiografias extends Model
{
    use HasFactory;

    protected $table = 'radiografias';

    protected $fillable = [
        'chequeo_id', 'imagen'
    ];

    public function chequeo()
    {
        return $this->belongsTo(Chequeo::class, 'chequeo_id');
    }
}
