<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="datos.*, entidades.*,servlets.*,negocio.*, java.util.*,java.text.SimpleDateFormat"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", -1);
	
	Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy");
	String anio = format.format(date);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>PASNI-UCA | Inscripci�n</title>

<!-- Bootstrap core CSS-->

<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../fonts/css/font-awesome.min.css" rel="stylesheet">

<link href="../../css/custom.css" rel="stylesheet">
<link href="../../css/green.css" rel="stylesheet">

<script src="../../js/jquery.min.js"></script>
<script src="../../js/utilidades.js"></script>
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
							<h3 class="white">Asistencia de Pregrado</h3>
							<h3 class="yellow">Programa de Estudiantes Monitores</h3>
							<br>
							<p class="white">
								Si eres estudiante de un a�o superior, estas dispuesto a ayudar a los dem�s y tienes un s�lido conocimiento
								en asignaturas como Matem�tica Fundamental, Qu�mica General y Taller de Redacci�n, es tu oportunidad para ser 
								<b>�Estudiante Monitor(a)!</b> Llena la siguiente inscripci�n y en caso de ser admitido en el programa, 
								recibir�s una beca que equivale a un estipendio de C$ 1,000.00 mensuales durante el cuatrimestre correspondiente. 
							</p>
							<div class="req col-md-6 col-sm-6 col-xs-12">
								<b>Los requisitos son:</b>
								<ul> 
									<li>Promedio mayor o igual a los 80 puntos en el cuatrimestre anterior</li>
									<li >Haber aprobado con un m�nimo de 80 puntos la asignatura que se desea monitorear</li>
									<li>No tener ninguna asignatura reprobada en el historial acad�mico</li>
								</ul>
							</div>
						</div>
					</div>
					<%
						NGPeriodoInscripcion ngpi = new NGPeriodoInscripcion();
						ArrayList<PeriodoInscripcion> lis = ngpi.cargarPI();
							
						NGFacultad fac = new NGFacultad();
						ArrayList<Facultad> lista = new ArrayList<Facultad>();
						lista = fac.comboFacultad();
							
						NGCarrera nc = new NGCarrera();
						ArrayList<Carrera> list = new ArrayList<Carrera>();	
							
						NGAsignatura nga = new NGAsignatura();
						ArrayList<Asignatura> listac = new ArrayList<Asignatura>();
						listac = nga.comboAsignatura();
					%>
					<div class="page-title">
						<div class="title_right">
							<h4 class="white">Inscripci�n al programa</h4>
						</div>
						<div class="title_left white">
						<%for(PeriodoInscripcion pi : lis)
						{%>
							<h4 class="white">Periodo <%=pi.getNombreC()%> | Del <fmt:formatDate type="date" value="<%=pi.getFechaInicio() %>"/> al <fmt:formatDate type="date" value="<%=pi.getFechaFin()%>"/></h4>
						<%}%>
						</div>
					</div>
								
					<div class="clearfix"></div>
					
					<div class="row">
					
						<div class="col-md-12 col-sm-12 col-xs-12">
						
							<form method="post" action="../../SLInscripcion?opc=1" onsubmit="return cargarNotify()">
							
								<div class="x_panel">
								
									<div class="x_title">
										<h2>Datos personales</h2>
										<div class="clearfix"></div>
									</div>
									
									<div class="x_content">
										<br />
										<div class="form-horizontal form-label-left input_mask" >
	
											<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
												<input type="text" class="form-control has-feedback-left" required="required" id="primerN" name="primerN" placeholder="Primer Nombre"> <span
												class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
											</div>
	
											<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
												<input type="text" class="form-control has-feedback-left" id="segundN" name="segundoN" placeholder="Segundo Nombre"> <span
													class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
											</div>
	
											<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
												<input type="text" class="form-control has-feedback-left" required="required" id="primerA" name="primerA" placeholder="Primer Apellido"> <span
													class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
											</div>
	
											<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
												<input type="text" class="form-control has-feedback-left" id="segundoA" name="segundoA" placeholder="Segundo Apellido"> <span
													class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Celular</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input type="text" class="form-control has-feedback-left inputTelefono" required="required" id="telefono" name="telefono"> <span
													class="fa fa-mobile form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Correo</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input type="email" class="form-control has-feedback-left" required="required" id="email" name="email" onblur="validarCorreo(this.value);">
													<span class="fa fa-envelope-o form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											
											<div class="ln_solid"></div>
											
										</div>
										
									</div>
									
								</div><!-- x_panel Datos Personales -->
								
								<div class="x_panel">
								
									<div class="x_title">
										<h2>Datos acad�micos</h2>
										<div class="clearfix"></div>
									</div>
									
									<div class="x_content">
										<br />
										<div class="form-horizontal form-label-left input_mask">
										
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Carn�</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input type="text" class="form-control has-feedback-left" required="required" id="carne" name="carne"> <span
														class="fa fa-credit-card form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Facultad</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<select id="facultad" name="facultad" required="required" class="form-control has-feedback-left">
														<option>Seleccion una facultad</option>
														<%for(Facultad facu: lista){%>
														<option value="<%=facu.getCOFA()%>"><%=facu.getNOMBRE()%></option>
														<%}%>
													</select>
													 <span class="fa fa-list form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Carrera </label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<select id="carrera" name="carrera" class="form-control has-feedback-left" required="required">
														<option value="0">Seleccione una carrera</option>
														<%for(Carrera carr: list){%>
														<option value="<%=carr.getCARR()%>"><%=carr.getNOMBRE()%></option>
														<%}%>
													</select>
													<span class="fa fa-list form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Promedio<br>
												<small>(Cuatrimestre anterior)</small></label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input type="text" class="form-control has-feedback-left" required="required" id="promedio" name="promedio"> <span
														class="fa fa-pencil-square-o form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>											
											<div class="ln_solid"></div>
										
										</div>
										
									</div>
									
								</div><!-- x_panel Datos Acad�micos -->
	
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
													<select id="asignatura" name="asignatura" required="required"  class="form-control has-feedback-left">
														<option>Seleccione una asignatura</option>
														<%for(Asignatura asig: listac){%>
														<option value="<%=asig.getIdAsigntatura()%>"><%=asig.getNombre()%></option>
														<%}%>
													</select>
													<span class="fa fa-book form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Calificaci�n (Obtenida en la asignatura seleccionada)</label>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input type="text" class="form-control has-feedback-left" required="required" id="calificacion" name="calificacion"> <span
														class="fa fa-pencil-square-o form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name"><span class="required">�En qu� turno podr�as impartir monitoreo?</span></label>
												<div class="radio">
													<input type="radio" class="flat" checked name="turno" id="turno" value="diurno">Diurno
													<input type="radio" class="flat" checked name="turno" id="turno" value="vespertino">Vespertino
													<input type="radio" class="flat" checked name="turno" id="turno" value="sabatino"> Sabatino
												</div>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name"><span class="required">�Por qu� quiere pertenecer al programa?</span> </label>
												<div
													class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
													<textarea id="motivo" name="motivo" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10"
														data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 500 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
												</div>
											</div>
											
											<div class="ln_solid"></div>
											
											<div class="form-group">
												<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-5">
													<label>Recuerda! Todos los datos son requeridos.</label>
													<button type="submit" class="btn btn-primary">Cancelar</button>
													<button type="submit" class="btn btn-success" value="Submit">Enviar</button>
												</div>
											</div>
										</div>
									</div> 
									
								</div> <!-- x_panel -->
								
							</form><!-- method post -->
							
						</div><!-- xpanel -->
												
					</div><!-- row -->

					<div class="mastfoot">
						<div class="white text-center">
							<h5>&copy; Copyright <%=anio %>, Todos los Derechos Reservados</h5>
							<h2>Universidad Centroamericana</h2>
						</div>            
					</div>
					
			</div><!-- /page content -->
			
		</div> <!-- main_container -->
		
		<div id="custom_notifications" class="custom-notifications dsp_none">
			<ul class="list-unstyled notifications clearfix"
				data-tabbed_notifications="notif-group">
			</ul>
			<div class="clearfix"></div>
			<div id="notif-group" class="tabbed_notifications"></div>
		</div>
		
	</div> <!-- container body -->
	
</body>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/custom.js"></script>
<!-- icheck -->
<script src="../../js/icheck.min.js"></script>
<!-- librerias externas -->
<script type="text/javascript" src="../../js/notify/pnotify.core.js"></script>
<script type="text/javascript" src="../../js/notify/pnotify.buttons.js"></script>
<script type="text/javascript" src="../../js/notify/pnotify.nonblock.js"></script>


<!-- notificaciones de CRUD -->
<%
	String msj ="";
	msj = request.getParameter("msj");
%>
<script type="text/javascript">
	function cargarNotify()
	{
		var mensaje = <%=msj%>;
		if(mensaje=="1")
		{
	    	new PNotify({
	    	title: "Inscripci�n Enviada",
	    	type: "info",
	    	text: "�La inscripci�n se ha enviado exitosamente!",
	   		nonblock: {
	        	nonblock: true,
	        	nonblock_opacity: .9}
	    	});
		}
	}
</script>
</html>