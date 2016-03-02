<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="datos.*, entidades.*,servlets.*,negocio.*, java.util.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>PASNI-UCA | Inscripción</title>

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

			<div class="right_colinsc" role="main">
	
					<div class="masthead ">
						<div class="inner">
							<h3 class="masthead-brand white">PASNI-UCA</h3>
							<nav>
								<ul class="nav masthead-nav">
									<li><a href="http://www.uca.edu.ni/" target="_blank"><img class="img-style" src="../../img/logos/uca.png"></a></li>
									<li><a href="#"><img class="img-style" src="../../img/logos/js.png"></a></li>
									<li><a href="http://www.ausjal.org/" target="_blank"><img class="img-style" src="../../img/logos/asj.png"></a></li>
								</ul>
							</nav>
						</div>
					</div>

					<div class="row ">
						<div class="col-md-12 text-center white headf">
							<h3>Asistencia a Pregrado</h3>
							<h4>Talleres de Formación</h4>
						</div>
					</div>	
					
					<div class="page-title">
						<div class="text-center">
							<h4>Destinado a estudiantes de nuevo ingreso</h4>
						</div>
					</div>
					
					<div class="clearfix"></div>
					
					<div class="row">
					
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
                                
                                <div class="x_content">

                                    <!-- start accordion -->
                                    <div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
                                        <div class="panel">
                                            <a class="panel-heading" ><h4 class="panel-title">Reforzamiento académico</h4></a>
                                            <div >
                                                <div class="panel-body">
	                                                <%
														NGTaller neg = new NGTaller();
														ArrayList<Taller> lista = new ArrayList<Taller>(); 
														lista = neg.cargarTalleres();
													%>
                                                    <table class="table table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Taller</th>
                                                                <th>Descripción</th>
                                                                <th>Cuatrimestre</th>
                                                                <th>Fecha inicio</th>
                                                                <th>Fecha fin</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%for(Taller t: lista){%>
															<tr class="even pointer">
																<td class=""><%=t.getIdTaller()%></td>
																<td class=""><%=t.getNombre()%></td>
																<td class=""><%=t.getDescripcion()%></td>
																<td class=""><%=t.getNombreCuatrimestre()%></td>
																<td class=""><%=t.getFechaInicio()%></td>
																<td class=""><%=t.getFechaFinal()%></td>
															</tr>
															<%}%>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end of accordion -->

                                </div>
                            </div>
							
									
							
						</div><!-- xpanel -->
												
					</div><!-- row -->
				
			</div><!-- /page content -->
			
		</div> <!-- main_container -->
		
	</div> <!-- container body -->
	 <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/custom.js"></script>
</body>
</html>