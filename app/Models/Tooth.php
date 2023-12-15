<?php

namespace App\Models;



use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Tooth extends Model
{
    use HasFactory;

    public function chequeo()
    {
        return $this->belongsTo(Chequeo::class, 'chequeo_id');
    }
}


