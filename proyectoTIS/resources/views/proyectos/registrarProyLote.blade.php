@extends ('layouts.master')

@section ('contenido')
<h2>Registrar 
    <small> Cargar Informacion </small>
</h2>
<div class="box box-primary">
  <div class="container-fluid">                       
    <form class="form-control" action="../tesis/" method="POST" role="form" enctype="multipart/form-data">
                    {{ csrf_field() }}
                    @if (count($errors) > 0)
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{$error}}</li>
                            @endforeach
                        </ul>
                    </div>
                    @endif
                    <div class="form-group">
                      <label>Ingrese archivo .csv de los proyectos de grado</label>
                      <input name="proyectos" type="file" placeholder="Ingrese el archivo que desea importar">
                    </div>

                    <div class="form-group">
                      <label>Ingrese archivo .csv de la tabla profesionales/tesis</label>
                      <input name="proftesis" type="file" placeholder="Ingrese el archivo que desea importar">
                    </div>

                    <div class="form-group">
                      <label>Ingrese archivo .csv de la tabla estudiantes/tesis</label>
                      <input name="esttesis" type="file" placeholder="Ingrese el archivo que desea importar">
                    </div>

                    <div class="form-group">
                      <label>Ingrese archivo .csv de la tabla areas/tesis</label>
                      <input name="areastesis" type="file" placeholder="Ingrese el archivo que desea importar">
                    </div>
                
                    <div class="form-group">
                      <a href="#dialogo" class="btn btn-primary" data-toggle="modal">Registrar</a>
                      <div class="modal fade" id="dialogo">
                          <div class="modal-dialog">
                              <div class="modal-content">
                                  <div class="modal-header">
                                      <h4>Desea registrar al docente?</h4>
                                  </div>
                                  <div class="modal-footer">
                                      <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                      <input type="submit" class="btn btn-primary" value="Guardar">
                                  </div>
                              </div>
                          </div>
                      </div>
                    </div>
                  
                  </form>
    <!--Añadir contenido-->
    
    <!--Fin contenido-->
    </div>
</div>
@endsection