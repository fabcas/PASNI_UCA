<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>PASNI-UCA | Inscripción </title>

    <!-- Bootstrap core CSS-->

    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../fonts/css/font-awesome.min.css" rel="stylesheet">
    
    <link href="../../css/custom.css" rel="stylesheet">
    <link href="../../css/green.css" rel="stylesheet">
    
    <script src="../../js/jquery.min.js"></script>

    <script src="../../js/validaciones.js" type="text/javascript"></script>
</head>

<body class="nav-md">

    <div class="container body">

        <div class="main_container">

            <!-- page content -->
            <div class="right_colinsc" role="main">
                <div class="">
                    <div class="masthead ">
            <div class="inner">
              <h3 class="masthead-brand white">PASNI-UCA</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li><a href="#"><img class="img-style" src="../../img/logos/lg_uca.png"></a></li>
                  <li><a href="#"><img class="img-style" src="../../img/logos/lg_ausjal.png"></a></li>
                  <li><a href="#"><img class="img-style" src="../../img/logos/lg_js.png"></a></li>
                  <li><a href="#"><img class="img-style s5" src="../../img/logos/55.png"></a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="row ">
            <div class="col-md-12 text-center white headf">
              <h3> Coordinación de Asistencia a Pregrado</h3>
              <h4>Programa de Alumnos Monitores </h4>
            </div>
          </div>

                    <div class="page-title">
                        <div class="title_right">
                            <h4>Inscripción al programa</h4>
                        </div>
                        <div class="title_left">
                            <h4>Período</h4>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <!--Datos Personales-->
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Datos personales</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form class="form-horizontal form-label-left input_mask">

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <input type="text" class="form-control has-feedback-left" id="inputSuccess2" placeholder="Primer Nombre">
                                            <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <input type="text" class="form-control has-feedback-left" id="inputSuccess3" placeholder="Segundo Nombre">
                                            <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <input type="text" class="form-control has-feedback-left" id="inputSuccess4" placeholder="Primer Apellido">
                                            <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                        </div>

                                        <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                            <input type="text" class="form-control has-feedback-left" id="inputSuccess5" placeholder="Segundo Apellido">
                                            <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Teléfono</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control has-feedback-left inputTelefono" id="inputTelefono">
                                            <span class="fa fa-mobile form-control-feedback left" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Correo</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="email" class="form-control has-feedback-left" id="inputCorreo" onblur="validarCorreo(this.value);">
                                            <span class="fa fa-envelope-o form-control-feedback left" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                        <div class="ln_solid"></div>
                                    </form>
                                </div>
                            </div>
                            <!--Datos Académicos-->
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Datos académicos</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form class="form-horizontal form-label-left input_mask">
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Carrera</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control has-feedback-left" id="inputSuccess3">
                                                <span class="fa fa-list form-control-feedback left" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Carné </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control has-feedback-left inputCarne" id="inputCarne">
                                                <span class="fa fa-credit-card form-control-feedback left" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Promedio</br><small>(Cuatrimestre anterior)</small></label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control has-feedback-left" id="inputSuccess3">
                                                <span class="fa fa-pencil-square-o form-control-feedback left" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                        <div class="ln_solid"></div>
                                    </form>
                                </div>
                            </div>

                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Asignatura a monitorear</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <form class="form-horizontal form-label-left input_mask">

                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Asignatura</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control has-feedback-left" id="inputSuccess3">
                                            <span class="fa fa-book form-control-feedback left" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Calificación</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control has-feedback-left" id="inputSuccess3">
                                            <span class="fa fa-pencil-square-o form-control-feedback left" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name"><span class="required">Turno</span>
                                            </label>
                                            <div class="radio">
                                                <input type="radio" class="flat" checked name="iCheck"> Diurno
                                                <input type="radio" class="flat" checked name="iCheck"> Vespertino
                                                <input type="radio" class="flat" checked name="iCheck"> Sabatino
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name"><span class="required">¿Por qué quiere pertenecer al programa?</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
                                                <textarea id="message" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-maxlength="200" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="estipendio"><span class="required">Goza de estipendio</span>
                                            </label>
                                            <div class="radio">
                                                <input type="radio" class="flat" checked name="iCheck1"> Si
                                                <input type="radio" class="flat" checked name="iCheck1"> No
                                            </div>
                                        </div>
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
                                                <label>Recuerda! Todos los datos son requeridos.</label>
                                                <button type="submit" class="btn btn-primary">Cancelar</button>
                                                <button type="submit" class="btn btn-success">Enviar</button>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- /page content -->
        </div>
    </div>

        <script src="../../js/bootstrap.min.js"></script>
        <script src="../../js/custom.js"></script>
        <!-- icheck -->
        <script src="../../js/icheck.min.js"></script>
</body>
</html>