<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Docente extends Model
{
    protected $table='profesional';
    protected $table2='docente';
    protected $primaryKey='codigo';
    public $timestamps=false;

    public function getAll(){
        $profesionales=\DB::table('profesional')->select('codigo', 'nombre', 'apellido_paterno', 
        'apellido_materno', 'titulo', 'cod_docente', 'correo')->where('cod_docente', '>', 0)->get();
        return $profesionales;
    }
}
