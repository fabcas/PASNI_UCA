<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="datos.*, entidades.*,servlets.*,negocio.*, java.util.*,java.text.SimpleDateFormat, java.io.InputStream"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", -1);
	
	//String email = "";	
	int rol = 0;
	int idUsuario = 0;
	int idMonitor = 0;
	String idCarrera = "";
	String carne = "";
	String nombreP = "";
	String nombreS = "";
	String apellidoP = "";
	String apellidoS = "";
	String correo = "";
	String celular = "";
	String carrera = "";
	float promedio = 0;
	
	ArrayList <UsuarioGenerico> listadmin = new ArrayList <UsuarioGenerico>();
	listadmin = (ArrayList <UsuarioGenerico>) session.getAttribute("login");
	if(listadmin != null)
 	{
		for (UsuarioGenerico user: listadmin)
		{	
			idUsuario = user.getIdUsuario();
		}
 	}
	else
	{
		response.sendRedirect("../../index.jsp");
		return;
	}
	
	NGMonitor m = new NGMonitor();
	ArrayList<Monitor> mo = new ArrayList<Monitor>();
	mo = m.cargarMonitorU(idUsuario);
	if(mo != null)
 	{
		for (Monitor mon: mo)
		{	
			idMonitor = mon.getIdMonitor();
			idCarrera = mon.getCARR();
			carne = mon.getCarne();
			nombreP = mon.getPrimerNombre();
			nombreS = mon.getSegundoNombre();
			apellidoP = mon.getPrimerApellido();
			apellidoS = mon.getSegundoApellido();
			correo = mon.getEmail();
			celular = mon.getTelefono();
			carrera = mon.getCarrera();
			promedio = mon.getPromedio();
			
		}
 	}
	
%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>PASNI-UCA | Perfil Estudiante Monitor </title>
	
	<link href="../../css/bootstrap.min.css" rel="stylesheet">
	
	<link href="../../fonts/css/font-awesome.min.css" rel="stylesheet">
	<link href="../../css/animate.min.css" rel="stylesheet">
	
	<!-- Custom styling plus plugins -->
	<link href="../../css/custom.css" rel="stylesheet">
	<link href="../../css/icheck/flat/green.css" rel="stylesheet">
	
	<script src="../../js/jquery.min.js"></script>
</head>

<body class="nav-md">

	<div class="container body">

		<div class="main_container">

			<jsp:include page="../menu.jsp" flush="true" />
			
			<div class="right_col" role="main">

				<div class="page-title">
					<div class="title_left">
						<h3>Perfil Estudiante Monitor</h3>
					</div>
				</div>
				
				<div class="col-md-12 col-sm-12 col-xs-12">
                	<div class="x_panel">
                    	 <div class="x_content">
                        	<div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                        	
                       			 <div class="profile_img"><!-- este -->

                                            <!-- end of image cropping -->
                                            <div id="crop-avatar">
                                                <!-- Current avatar -->
                                                <div class="avatar-view" title="Cambiar o subir foto">
                                                    <img src="../../img/profile.png" alt="Avatar">
                                                </div>

                                                <!-- Cropping modal -->
                                                <div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
                                                    <div class="modal-dialog modal-lg">
                                                        <div class="modal-content">
                                                            <form class="avatar-form" enctype="multipart/form-data" method="post" action="../../SLSubirArchivo">
                                                                <div class="modal-header">
                                                                    <button class="close" data-dismiss="modal" type="button">&times;</button>
                                                                    <h4 class="modal-title" id="avatar-modal-label">Subir / Cambiar Foto</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="avatar-body">
																		<input type="hidden" id="idMonitor" name="idMonitor" class="form-control" value="<%=idMonitor%>"> <br>
																		<!-- Upload image and data -->
                                                                        <div class="avatar-upload">
                                                                            <label for="avatarInput">Foto</label>
                                                                            <input class="avatar-input" id="photo" name="photo" type="file">
                                                                        </div>

                                                                        <!-- Crop and preview -->
                                                                        <div class="row">
                                                                            <div class="col-md-9">
                                                                                <div class="avatar-wrapper"></div>
                                                                            </div>
                                                                            <div class="col-md-3 ">
                                                                                <div class="message_wrapper">
                                                                                    <h4><b>Recomendaciones</b></h4>
                                                                                    <blockquote class="message">
                                                                                    	<ul>
                                                                                    		<li>Prueba</li>
                                                                                    		<li>Prueba</li>
                                                                                    		<li>Prueba</li>
                                                                                    	</ul>
                                                                                    </blockquote>
                                                                                </div>
                                                                                <button class="btn btn-primary btn-block avatar-save" type="submit">Hecho</button>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                                <!-- /.modal -->

                                                <!-- Loading state -->
                                                <div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
                                        </div><br>
                                <h3><%=nombreP %> <%=apellidoP%></h3>

                               	<ul class="list-unstyled ">
                         			<li><i class="fa fa-phone"></i> <%=celular%></li>
									<li><i class="fa fa-graduation-cap user-profile-icon"></i><%=carrera%></li>
                               	</ul>
							</div>
							
                          	<div class="col-md-9 col-sm-9 col-xs-12">
	                        		<div class="x_title">
					                	<h2>Editar Datos Personales</h2>
					                    <div class="clearfix"></div>
					           		</div>
                                    <form class="form-horizontal form-label-left " name="form" method="post" action="../../SLMonitor?opc=3">
										<div class="item form-group">	
											<label >Carné</label><input type="text" id="carneE" name="carneE" class="form-control" disabled="disabled" value="<%=carne%>" >
																<input type="hidden" id="idMonitorE" name="idMonitorE" class="form-control" value="<%=idMonitor%>"> <br>
											<label >Nombres</label> 
											<div class="form-group">
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input type="text" id="nombrePE" name="nombrePE" required="required" class="form-control" value="<%=nombreP%>">
												</div>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input type="text" id="nombreSE" name="nombreSE" class="form-control" value="<%=nombreS%>">
												</div>
											</div>
											<label >Apellidos</label>
											<div class="form-group">
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input type="text" id="apellidoEP" name="apellidoEP" required="required" class="form-control" value="<%=apellidoP%>">
												</div>
												<div class="col-md-6 col-sm-6 col-xs-12">
													<input type="text" id="apellidoSE" name="apellidoSE" class="form-control" value="<%=apellidoS%>">
												</div>
											</div>
											<label>Correo</label><input type="email" class="form-control" id="emailE" name="emailE" required="required" value="<%=correo%>"><br>
											<label>Celular</label><input type="text" class="form-control " id="telefonoE" name="telefonoE" required="required" value="<%=celular%>"> <br>
											<label>Carrera</label><input type="text" class="form-control " id="carreraE" name="carreraE" disabled="disabled" value="<%=carrera%>"><br>
																<input type="hidden" id="carrera" name="carrera" class="form-control" value="<%=idCarrera%>">
											<label >Promedio</label> <input type="text" id="promedioEM" name="promedioEM" required="required" class="form-control" value="<%=promedio%>"><br>
															
											<div class="modal-footer">
												<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
												<button type="submit" class="btn btn-primary">Editar</button>
											</div>
										</div>
									</form>
                       		</div>
							
                    	</div><!-- /x-content -->
                 	</div><!-- /panel -->
                </div><!-- /col m12 -->
                 
				<div class="clearfix"></div>

			</div><!-- /right-col -->
			
			<div class="clearfix"></div>

			<jsp:include page="../footer.jsp" flush="true" /><!-- /footer content -->
			
		</div><!-- /main container-->
		
		<div id="custom_notifications" class="custom-notifications dsp_none">
			<ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group"> </ul>
			<div class="clearfix"></div>
			<div id="notif-group" class="tabbed_notifications"></div>
		</div>
	</div> <!-- /container -->
</body>

<script src="../../js/custom.js"></script>
<script src="../../js/bootstrap.min.js"></script>

<!-- image cropping -->
<script src="../../js/nicescroll/jquery.nicescroll.min.js"></script>
<script src="../../js/cropping/cropper.min.js"></script>
<script src="../../js/cropping/main.js"></script>
</html>