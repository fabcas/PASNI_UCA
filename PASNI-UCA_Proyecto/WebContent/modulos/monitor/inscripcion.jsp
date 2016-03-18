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

					<div class="row">
						<div class="col-md-12 text-center headf">
							<h3 class="white">Asistencia a Pregrado</h3>
							<h3 class="yellow">Programa de Alumnos Monitores</h3>
						<br>
						
						<div class="white">En asignaturas de primer año que representan un mayor desafío, como
							Matemática Fundamental, Química
							General y Taller de Redacción, podrás
							disponer del apoyo de un monitor o
							monitora, es decir, un estudiante de año
							superior con alto índice académico y
							dispuesto a colaborar con tu aprendizaje.
							Dos veces a la semana, en períodos de
							dos horas, formarás círculos de estudios
							y colaboración para afianzar los saberes
							que has aprendido en tus clases titulares. </div>
					</div>
</div>
					<div class="page-title">
						<div class="title_right">
							<h4 class="white">Inscripción al programa</h4>
						</div>
						<div class="title_left">
							<h4 class="white">Período</h4>
						</div>
					</div>
								
					<div class="clearfix"></div>
					
					<div class="row">
					
						<div class="col-md-12 col-sm-12 col-xs-12">
						
							<form method="post" action="../../SLInscripcion?opc=1">
							
								<div class="x_panel">
								
									<div class="x_title">
										<h2>Datos personales</h2>
										<div class="clearfix"></div>
									</div>
									
									<div class="x_content">
										<br />
										<div class="form-horizontal form-label-left input_mask" >
	
											<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
												<input type="text" class="form-control has-feedback-left" id="primerN" name="primerN" placeholder="Primer Nombre"> <span
												class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
											</div>
	
											<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
												<input type="text" class="form-control has-feedback-left" id="segundN" name="segundoN" placeholder="Segundo Nombre"> <span
													class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
											</div>
	
											<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
												<input type="text" class="form-control has-feedback-left" id="primerA" name="primerA" placeholder="Primer Apellido"> <span
													class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
											</div>
	
											<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
												<input type="text" class="form-control has-feedback-left" id="segundoA" name="segundoA" placeholder="Segundo Apellido"> <span
													class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Teléfono</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input type="text" class="form-control has-feedback-left inputTelefono" id="telefono" name="telefono"> <span
													class="fa fa-mobile form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Correo</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input type="email" class="form-control has-feedback-left" id="email" name="email" onblur="validarCorreo(this.value);">
													<span class="fa fa-envelope-o form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											
											<div class="ln_solid"></div>
											
										</div>
										
									</div>
									
								</div><!-- x_panel Datos Personales -->
								
								<div class="x_panel">
								
									<div class="x_title">
										<h2>Datos académicos</h2>
										<div class="clearfix"></div>
									</div>
									
									<div class="x_content">
										<br />
										<div class="form-horizontal form-label-left input_mask">
										
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Carné</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input type="text" class="form-control has-feedback-left" id="carne" name="carne"> <span
														class="fa fa-credit-card form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Facultad</label>
													<% 
														NGFacultad fac = new NGFacultad();
														ArrayList<Facultad> lista = new ArrayList<Facultad>();
														lista = fac.comboFacultad();
													%>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<select id="facultad" name="facultad" class="form-control has-feedback-left">
														<option>Seleccion una Facultad</option>
														<%
															for(Facultad facu: lista)
	 														{
														%>
															<option value="<%=facu.getIdFacultad()%>"><%=facu.getNombre()%></option>
														<%
	 														}
														%>
													</select>
													 <span class="fa fa-list form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Carrera </label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<%
														NGCarrera nc = new NGCarrera();
														ArrayList<Carrera> list = new ArrayList<Carrera>();	
													%>
													<select id="carrera" name="carrera" class="form-control has-feedback-left">
														<option value="0">Seleccione una carrera</option>
														<%
															for(Carrera carr: list)
	 														{
														%>
															<option value="<%=carr.getIdCarrera()%>"><%=carr.getNombre()%></option>
														<%
	 														}
														%>
													</select>
													<span class="fa fa-list form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Promedio</br>
												<small>(Cuatrimestre anterior)</small></label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input type="text" class="form-control has-feedback-left" id="promedio" name="promedio"> <span
														class="fa fa-pencil-square-o form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="estipendio"><span class="required">Goza de estipendio</span> </label>
												<div class="radio">
													<input type="radio" class="flat" checked name="estipendio" id="estipendio" value="true">Si 
													<input type="radio" class="flat" checked name="estipendio" id="estipendio" value="false">No
												</div>
											</div>
											
											<div class="ln_solid"></div>
										
										</div>
										
									</div>
									
								</div><!-- x_panel Datos Académicos -->
	
								<div class="x_panel">
								
									<div class="x_title">
										<h2>Asignatura a monitorear</h2>
										<div class="clearfix"></div>
									</div>
									
									<div class="x_content">
										<br />
										<div class="form-horizontal form-label-left input_mask" >
										
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Asignatura</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<%
														NGAsignatura nga = new NGAsignatura();
														ArrayList<Asignatura> listac = new ArrayList<Asignatura>();
														listac = nga.comboAsignatura();
													%>
													<select id="asignatura" name="asignatura" class="form-control has-feedback-left">
														<option>Seleccione una asignatura</option>
														<%
															for(Asignatura asig: listac)
	 														{
														%>
															<option value="<%=asig.getIdAsigntatura()%>"><%=asig.getNombre()%></option>
														<%
	 														}
														%>
													</select>
													<span class="fa fa-book form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Calificación (Obtenida en la asignatura seleccionada)</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input type="text" class="form-control has-feedback-left" id="calificacion" name="calificacion"> <span
														class="fa fa-pencil-square-o form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name"><span class="required">Turno</span></label>
												<div class="radio">
													<input type="radio" class="flat" checked name="turno" id="turno" value="diurno">Diurno
													<input type="radio" class="flat" checked name="turno" id="turno" value="vespertino">Vespertino
													<input type="radio" class="flat" checked name="turno" id="turno" value="sabatino"> Sabatino
												</div>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name"><span class="required">¿Por qué quiere pertenecer al programa?</span> </label>
												<div
													class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
													<textarea id="motivo" name="motivo" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10"
														data-parsley-maxlength="200" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
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
										</div>
									</div> 
									
								</div> <!-- x_panel -->
								
							</form><!-- method post -->
							
						</div><!-- xpanel -->
												
					</div><!-- row -->

					<div class=" text-center">
						<p>&copy; Copyright 2016, Todos los Derechos Reservados</p>
						<p>Universidad Centroamericana</p>
					</div>
					
			</div><!-- /page content -->
			
		</div> <!-- main_container -->
		
	</div> <!-- container body -->
	
	<div id="custom_notifications" class="custom-notifications dsp_none">
        <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
        </ul>
        <div class="clearfix"></div>
        <div id="notif-group" class="tabbed_notifications"></div>
    </div>
	
	<!-- Select Facultad y Carrera -->
	<script type="text/javascript">
	$("#facultad").change(function()
			{
				var facultad=$("#facultad").val();
				console.log(facultad);
				if (facultad=="0")
				{
					$("#carrera").val("0");
					$("#carrera").prop('disabled',true);
				}
				else 
				{
					$("#carrera").prop('disabled',false);
					$.ajax({		    
				          url:"../../SLComboCarreras",
				          type:"post",
				          datatype:"html",
				          data:{'idFacultad':facultad},
				          success:function(data) 
				          {
				        		$('#carrera').html(data);  
				          }
				        });
				};			
			});
		
	</script>
	
			
			<!-- notificaciones de CRUD -->
		<%
			String msj ="";
			msj = request.getParameter("msj");
		
		%>
		<script type="text/javascript">
		
		  function cargarNotify()
			{
				var mensaje = "<%=msj%>";
				
					if(mensaje=="1" )
					{
							new PNotify({
				                title: "Inscripción Guardado",
				                type: "info",
				                text: "¡Su inscripción se ha enviado!",
				                nonblock: {
	                                nonblock: true,
	                                nonblock_opacity: .2}
							});
					}
			}	 
		</script>
	
	<!-- Mensajes CRUD -->
	<script>
		$(function() {
	    	$("#botonEnviar").tooltip();
	     });
	</script>
	
	<script src="../../js/bootstrap.min.js"></script>
	<script src="../../js/custom.js"></script>
	<!-- icheck -->
	<script src="../../js/icheck.min.js"></script>
	<!-- librerias externas -->
	<script src="assets/js/custom.js"></script>
	<script type="text/javascript" src="../../js/notify/pnotify.core.js"></script>
    <script type="text/javascript" src="../../js/notify/pnotify.buttons.js"></script>
    <script type="text/javascript" src="../../js/notify/pnotify.nonblock.js"></script>
</body>
</html>