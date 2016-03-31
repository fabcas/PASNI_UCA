<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="datos.*, entidades.*,servlets.*,negocio.*, java.util.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", -1);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>PASNI-UCA | Taller de Formación</title>

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
						<div class="col-md-12 text-center headf">
							<h3 class="white">Asistencia a Pregrado</h3>
							<h3 class="yellow">Talleres de Formación</h3>
							<br>
							<div class="white">
								En la universidad no todo lo aprenderás dentro del aula, también hay experiencias que se cultivan en otros espacios
								académicos y mediante actividades extracurriculares. En tu primer año, tienes una gran oportunidad de aprendizaje en
								los talleres de formación que ofrecemos. Cada cuatrimestre, junto a los estudiantes de primer año de tu carrera y bajo 
								la coordinación de los profesores guías, puedes seleccionar un taller en el que estés interesado de recibir. Las temáticas
								están clasificadas en tres enfoques: <br><b>reforzamiento académico, habilidades para la vida e identidad ignaciana.</b>
							</div><br>
						</div>
					</div>	
									
					<div class="clearfix"></div>
					
					<div class="row">
					
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
                                
                                <div class="x_content">

                                    <!-- start accordion -->
                                    <div class="accordion" id="accordion" role="tablist" aria-multiselectable="true">
                                         <div class="panel-body">
	                                                <%
														NGTaller neg = new NGTaller();
														ArrayList<Taller> lista = new ArrayList<Taller>(); 
														lista = neg.cargarTalleres();
													%>
                                                    <table class="table table-bordered ">
                                                        <thead>
                                                            <tr class="table-green text-center">
                                                                <th>Taller</th>
                                                                <th>Descripción</th>
                                                                <th>Categoría</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%for(Taller t: lista){%>
															<tr class="even pointer dark">
																<td class=""><%=t.getNombre()%></td>
																<td class=""><%=t.getDescripcion()%></td>
																<td class=""><%=t.getNombreCategoria()%></td>
															</tr>
															<%}%>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div><!-- end of accordion -->

                                </div>
                                
                            </div>
                    <div class=" text-center">
						<p>&copy; Copyright 2016, Todos los Derechos Reservados</p>
						<p>Universidad Centroamericana</p>
					</div>
                            
		</div> <!-- main_container -->
		
	</div> <!-- container body -->
				
			</div><!-- /page content -->
	 <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/custom.js"></script>
</body>
</html>