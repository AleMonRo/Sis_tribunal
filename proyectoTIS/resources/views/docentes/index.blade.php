@extends ('layouts.master')
@section ('contenido')

<div class="box-body">
    <div class="row">
        <div class="col-md-12">
            
            <div class ="box-header with-border">
                <h2><i class ="fa fa-fw fa-list-ul"></i> - Lista de Docentes</h2>
                    <div class="box-tools pull-right">
                        <div class="social-auth-links">                     
                          <a href="#reestablecer" class="btn btn-sm btn-info btn-flat" data-toggle="modal"><h5>Registrar por Lote [ <i class ="fa fa-fw fa-upload"> ]</i></h5></a><br>     
                      
                      <div class="modal fade" id="reestablecer">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="bg-teal color-palette">
                                    <div class="modal-header">
                                        <h3>Cargar informacion del Profesional - Docente - <i class ="fa fa-fw fa-upload"></i></h3> 
                                        
                                    </div>    
                                </div>

                                <div class="modal-body">   

                                
                                     <div class="panel-header">
                                          <div class="box-header hidden-xs hidden-sm">
                                              
                                                  
                                              
                                              <form action="../docentes/" method="POST" role="form" enctype="multipart/form-data">
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
                                                
                                                    <div class="form-group has-warning">
                                                        <label class="control-label" for="inputWarning"> <i class="fa fa-warning"></i> Advertencia !!!...</label>                                                    
                                                    </div>
                                                    <div class="form-group">
                                                      <input name="file" type="file" placeholder="Ingrese el archivo que desea importar">

                                                       <p class="help-block">Solo se permite : "archivo.csv"</p>
                                                      
                                                    </div>
                                                    
                                                    <div class="form-group">
                                                        <div class="modal-footer">     
                                                         <div class="box box-primary"></div>                                
                                                            <input type="submit" class="btn btn-sm btn-info btn-flat" value="Guardar">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                                        </div>
                                                    </div>                                              
                                              </form>
                                          </div>
                                     </div>                                     
                                </div>
                               
                                </div>
                            </div>
                        </div>
                       
                      </div>
                </div>
            </div> 

                        

            <div class="box box-primary">
            </div>
                <table class="table table-hover">
                    <thread>
                    <tr class="bg-purple color-palette">
                        <td>ID</td>
                        <td>NOMBRES</td>
                        <td>A. PATERNO</td>
                        <td>A. MATERNO</td>
                        <td>CORREO</td>
                        <td>TELEFONO</td>
                        <td>DIRECCION</td>
                        <td>TITULO</td>
                    </tr>
                    </thread>
                    <tbody>
                        <?php
                        foreach($docentes as $rows) {?>
                    <tr>
                        <td><?php echo $rows->codigo; ?></td>
                        <td><?php echo $rows->nombre; ?></td>
                        <td><?php echo $rows->apellido_paterno; ?></td>
                        <td><?php echo $rows->apellido_materno; ?></td>
                        <td><?php echo $rows->correo; ?></td>
                        <td><?php echo $rows->telefono; ?></td>
                        <td><?php echo $rows->direccion; ?></td>
                        <td><?php echo $rows->titulo; ?></td>
                    </tr>
                    <?php }?>
                </tbody>
                </table>
            </div>
        </div>
    </div>
@stop