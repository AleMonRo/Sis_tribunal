<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HelpsController extends Controller
{
    public function __construct()
    {

    }
    public function index(){
        return view('help',['user'=>$this->getUser()]);
    }
}
