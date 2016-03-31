<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="datos.*, entidades.*,servlets.*,negocio.*, java.util.*"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", 0);
	
	//String email = "";
	int rol = 0;
	int idUsuario = 0;
	int idMonitor = 0;
	String carne = "";
	String nombreP = "";
	String nombreS = "";
	String apellidoP = "";
	String apellidoS = "";
	String correo = "";
	String celular = "";
	String carrera = "";
	float promedio = 0;
	
	ArrayList <Monitor> listadmin = new ArrayList <Monitor>();
	listadmin = (ArrayList <Monitor>) session.getAttribute("login");
	
	if(listadmin != null)
 	{
		for (Monitor user: listadmin)
		{	
			idMonitor = user.getIdMonitor();
			carne = user.getCarne();
			nombreP = user.getPrimerNombre();
			nombreS = user.getSegundoNombre();
			apellidoP = user.getPrimerApellido();
			apellidoS = user.getSegundoApellido();
			correo = user.getEmail();
			celular = user.getTelefono();
			carrera = user.getCarrera();
			promedio = user.getPromedio();
		}
  	}
	else
	{
		response.sendRedirect("index.jsp");
		return;
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

                                        <div class="profile_img">

                                            <!-- end of image cropping -->
                                            <div id="crop-avatar">
                                                <!-- Current avatar -->
                                                <div class="avatar-view">
                                                    <img src="../../img/profile.png" alt="Avatar">
                                                </div>
                                                <!-- Loading state -->
                                            </div>
                                            <!-- end of image cropping -->

                                        </div>
                                        <h3><%= nombreP %> <%= apellidoP %></h3>

                                        <ul class="list-unstyled user_data">
                                            <li><i class="fa fa-map-marker user-profile-icon"></i> Celular</li>

                                            <li><i class="fa fa-briefcase user-profile-icon"></i> Carrera</li>

                                            <li class="m-top-xs"><i class="fa fa-external-link user-profile-icon"></i></li>
                                        </ul>

                                        <br />

                                    </div>
                                    <div class="col-md-9 col-sm-9 col-xs-12">

                                        <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                            <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                                <li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Informes Semanales</a>
                                                </li>
                                                <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab" aria-expanded="false">Grupos / Horarios</a>
                                                </li>
                                                <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Perfil</a>
                                                </li>
                                            </ul>
                                            <div id="myTabContent" class="tab-content">
                                                <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

                                                </div>
                                                <div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">

                                                </div>
                                                <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                                               		<div class="x_title">
					                                    <h2>Editar Datos Personales</h2>
					                                    <div class="clearfix"></div>
				                                	</div>
                                               		<form class="form-horizontal form-label-left " name="form" method="post" action="../../SLMonitor?opc=2">
														<div class="item form-group">
														
															<label >Carné</label><input type="text" id="carneE" name="carneE" required="required" class="form-control" disabled="disabled" value="<%=carne%>" >
																				<input type="hidden" id="idMonitorE" name="idMonitorE" class="form-control" value="<%=idMonitor%>"> <br>
															<label >Nombres</label> 
															<div class="form-group">
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input type="text" id="nombrePE" name="nombrePE" required="required" class="form-control" value="<%=nombreP%>">
																</div>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input type="text" id="nombreSE" name="nombreSE" required="required" class="form-control" value="<%=nombreS%>">
																</div>
															</div>
															<label >Apellidos</label>
															<div class="form-group">
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input type="text" id="apellidoEP" name="apellidoEP" required="required" class="form-control" value="<%=apellidoP%>">
																</div>
																<div class="col-md-6 col-sm-6 col-xs-12">
																	<input type="text" id="apellidoSE" name="apellidoSE" required="required" class="form-control" value="<%=apellidoS%>">
																</div>
															</div>
															<label>Correo</label><input type="email" class="form-control" id="emailE" name="emailE" value="<%=correo%>"><br>
															<label>Celular</label><input type="text" class="form-control " id="telefonoE" name="telefonoE" value="<%=celular%>"> <br>
															<label>Carrera</label><input type="text" class="form-control " id="carreraE" name="telefonoE" disabled="disabled" value="<%=carrera%>"> <br>
															<label >Promedio</label> <input type="text" id="promedioEM" name="promedioEM" required="required" class="form-control" value="<%=promedio%>"><br>
															
															<div class="modal-footer">
																<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
																<button type="submit" class="btn btn-primary">Editar</button>
															</div>
														</div>
													</form>
                                                </div>
                                            </div>
                                        </div>
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
</html>