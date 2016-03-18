<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="servlets.*,entidades.*,datos.*, negocio.*, java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PASNI-UCA | Usuarios</title>

<!-- Librerías -->

<link href="css/bootstrap.min.css" rel="stylesheet">

<link href="fonts/css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">

<!-- Custom styling plus plugins -->
<link href="css/custom.css" rel="stylesheet">
<link href="css/icheck/flat/green.css" rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="css/progressbar/bootstrap-progressbar-3.3.0.css">
<script src="js/jquery.min.js"></script>
<!-- Fin de las librerías -->

</head>

<body class="nav-md">

	<div class="container body">

		<div class="main_container">

			<jsp:include page="menu.jsp" flush="true" />

			<!-- page content -->
			<div class="right_col" role="main">

                    <div class="page-title">
                        <div class="title_left">
                            <h3>Administración</h3>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="">
                       
                       <!-- Inicio del modal para agregar nuevo registro -->
											
									<!-- button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Guardar</button> -->
		
		                                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
		                                    <div class="modal-dialog">
		                                        <div class="modal-content">
		                                            <div class="modal-header">
		                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span>
		                                                </button>
		                                                <h5 class="modal-title"><b>Agregar administrador</b></h5>
		                                            </div>
		                                            <div class="modal-body">
		                                                <h4><b>Complete los campos</b></h4>
		                                                <form class="form-horizontal form-label-left" name="form" method="post" action="./SLUsuario?opc=1">
		                                                	<div class="item form-group">
		                                                		<%
																	NGUsuario user = new NGUsuario();
																	ArrayList<Rol> listaRoles = new ArrayList<Rol>();
																	listaRoles = user.cargarRoles();
																%>
																<br><br><label>Rol:</label> 
																<select id="rolUser" class="select2_single form-control" name="rolUser" required="required"  tabindex="-1">
																		<option value="0">Seleccione..</option>
																		<%
																			for(Rol r : listaRoles)
																		  	{ 
																		%>
																				<option value="<%=r.getIdRol() %>" ><%=r.getNombre()%></option>
																		<%	
																			}
																		%>	
																</select>
															
																<br><label>Nombre de usuario:</label> 
																<input id="nombreUsuario" name="nombreUsuario" required="required" class="form-control" placeholder="Nombre">
																<br><label>Contraseña:</label>
																<input type="password" id="pass" name="pass" class="form-control" value="">
																
															</div>
															<div class="m-footer">
			                                                	<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
			                                                	<button type="submit" class="btn btn-primary">Guardar</button>
		                                           			</div>
		                                                </form>
		                                            </div>
		                                            
		                                        </div>
		                                    </div>
		                                </div>
										
										<!-- Final del modal para guardar nuevo registro -->
										
										
											<!-- Inicio del modal para editar registro -->
										
		                                <div class="modal fade modalEditar" tabindex="-1" role="dialog" aria-hidden="true">
		                                    <div class="modal-dialog ">
		                                        <div class="modal-content">
		                                            <div class="modal-header">
		                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span>
		                                                </button>
		                                                <h5 class="modal-title"><b>Editar Administrador</b></h5>
		                                            </div>
		                                            <div class="modal-body">
		                                                <h4><b>Complete los campos</b></h4>
		                                                <form class="form-horizontal form-label-left" name="form" method="post" action="./SLUsuario?opc=2">
		                                                	<div class="item form-group">
		                                                	
		                                                		<%
																	NGUsuario user2 = new NGUsuario();
																	ArrayList<Rol> listaRoles2 = new ArrayList<Rol>();
																	listaRoles2 = user2.cargarRoles();
																%>
																<input class="form-control" id="IdUsuario" name="IdUsuario" disabled="disabled">
																<input class="form-control" type="hidden" id="IdUsuarioEditar" name="IdUsuarioEditar">
																<br><br><label>Rol:</label> 
																<select id="rolUserEditar" class="select2_single form-control" name="rolUserEditar" required="required"  tabindex="-1">
																		<option value="0">Seleccione..</option>
																		<%
																			for(Rol r : listaRoles2)
																		  	{ 
																		%>
																				<option value="<%=r.getIdRol() %>" ><%=r.getNombre()%></option>
																		<%	
																			}
																		%>	
																</select>
															
																<br><label>Nombre de usuario:</label> 
																<input id="nombreUsuarioEditar" name="nombreUsuarioEditar" required="required" class="form-control" placeholder="Nombre">
																<br><label>Contraseña:</label>
																<input type="password" id="passEditar" name="passEditar" class="form-control" value="">
																
															</div>
															<div class="m-footer">
			                                                	<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
			                                                	<button type="submit" class="btn btn-primary">Guardar</button>
		                                           			</div>
		                                                </form>
		                                            </div>
		                                            
		                                        </div>
		                                    </div>
		                                </div>
		                                
		                                <!-- Fin del modal de editar  -->
		                                
		                                
		                                <!-- Inicio del modal para eliminar registro -->
                                            
        
                                        <div class="modal fade" id="modalEliminar" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog modal-sm">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span>
                                                        </button>
                                                        <h5 class="modal-title"><b>Eliminar usuario administrador</b></h5>
                                                    </div>
                                                    <div class="modal-body">
                                                       
                                                        <form class="form-horizontal form-label-left" name="form" method="post" action="./SLUsuario?opc=3">
                                                            <div class="item form-group">
                                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                                    <input type="hidden" name="idUsuarioAdminEliminar" id="idUsuarioAdminEliminar">
                                                                    <!-- <input type="text" name="nombre_TallerEliminado" id="nombre_TallerEliminado" disabled="disabled"> -->
                                                                    <p>¿Seguro que desea eliminar este administrador?</p>
                                                                </div>
                                                            </div>
                                                            <div class="m-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                                                <button type="submit" class="btn btn-primary">Eliminar</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <!-- Fin del modal de eliminar  -->  

                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Catálogo de Usuarios </h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                            	
								<div class="" role="tabpanel" data-example-id="togglable-tabs">
                                        <ul id="myTab1" class="nav nav-tabs bar_tabs left" role="tablist">
                                            <li role="presentation" class="active"><a href="#tab_content11" id="home-tabb" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Administradores</a>
                                            </li>
                                            <li role="presentation" class=""><a href="#tab_content22" role="tab" id="profile-tabb" data-toggle="tab" aria-controls="profile" aria-expanded="false">Monitores</a>
                                            </li>
                                            <li role="presentation" class=""><a href="#tab_content33" role="tab" id="profile-tabb3" data-toggle="tab" aria-controls="profile" aria-expanded="false">Profesores</a>
                                            </li>
                                        </ul>
                                        <div id="myTabContent2" class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade active in" id="tab_content11" aria-labelledby="home-tab">
                                                <button type="button" id="botonNuevo" title="Nuevo registro" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Ingresar nuevo administrador</button>
                                                <br><br>
                                                <%
											
													NGUsuario neg = new NGUsuario();
													ArrayList<Usuario> lista = new ArrayList<Usuario>(); 
													lista = neg.cargarAdministradores();
										
												%>
													<table id="" class="display table table-striped responsive-utilities jambo_table">
						                                        <thead>
						                                            <tr class="headings">
						                                                <th>
						                                                <input type="checkbox" class="tableflat">
						                                                </th>
						                                                <th>Id Usuario </th>
						                                                <th>Rol </th>
						                                                <th>Nombre de usuario</th>
						                                                <th>Contraseña</th>
						                                                <th><span class="nobr">Acción</span></th>
						                                            </tr>
						                                        </thead>
						
						                                        <tbody>
						                                        
						                                        		<%
																			for(Usuario u: lista)
																			{
																		%>
						                                            		<tr class="even pointer">
						                                                		<td class="a-center ">
						                                                    		<input type="checkbox" class="tableflat">
						                                                		</td>
									                                                <td class=""><%=u.getIdUsuario() %></td>
									                                                <td class=""><%=u.getNombreRol() %></td>
									                                                <td class=""><%=u.getUsuario() %></td>
									                                                <td class=""><%=u.getPassword() %></td>
								                                                <td> 
								                                                    <button type="button" id="botonModificar" title="Modificar registro" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalEditar" onclick="cargarDatos('<%=u.getIdUsuario()%>', '<%=u.getIdRol()%>', '<%=u.getUsuario()%>', '<%=u.getPassword()%>');"><i class="fa fa-pencil"></i></button>
								                                                    <button type="button" id="botonEliminar" title="Eliminar registro" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#modalEliminar" onclick="cargarDatos('<%=u.getIdUsuario()%>', '<%=u.getIdRol()%>', '<%=u.getUsuario()%>', '<%=u.getPassword()%>');"><i class="fa fa-trash-o"></i></button>
								                                                </td>
								                                            </tr>
						                                            
						                                           		<%
																			} 
																		%>
						                                           
						                                        </tbody>
						                          			</table>
						                                                
                                                
                                            </div>
                                            
                                            <div role="tabpanel" class="tab-pane fade" id="tab_content22" aria-labelledby="profile-tab">
                                                
                                                <%
											
	                                                NGUsuario neg2 = new NGUsuario();
													ArrayList<Usuario> lista2 = new ArrayList<Usuario>(); 
													lista2 = neg2.cargarMonitores();
										
												%>
													<table id="" class=" display table table-striped responsive-utilities jambo_table">
						                                        <thead>
						                                            <tr class="headings">
						                                                <th>
						                                                <input type="checkbox" class="tableflat">
						                                                </th>
						                                                <th>Id Usuario </th>
						                                                <th>Rol </th>
						                                                <th>Nombre de usuario</th>
						                                                <th>Contraseña</th>
						                                                <th>Monitor</th>
						                                                <th><span class="nobr">Acción</span></th>
						                                            </tr>
						                                        </thead>
						
						                                        <tbody>
						                                        
						                                        		<%
																			for(Usuario u: lista2)
																			{
																		%>
						                                            		<tr class="even pointer">
						                                                		<td class="a-center ">
						                                                    		<input type="checkbox" class="tableflat">
						                                                		</td>
									                                                <td class=""><%=u.getIdUsuario() %></td>
									                                                <td class=""><%=u.getNombreRol() %></td>
									                                                <td class=""><%=u.getUsuario() %></td>
									                                                <td class=""><%=u.getPassword() %></td>
									                                                <td class=""><%=u.getNombreMonitor() %></td>
								                                                <td> 
								                                                    <button type="button" id="botonModificar" title="Modificar registro" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalEditar" onclick="cargarDatos('<%=u.getIdUsuario()%>', '<%=u.getIdRol()%>', '<%=u.getUsuario()%>', '<%=u.getPassword()%>');"><i class="fa fa-pencil"></i></button>
								                                                    <button type="button" id="botonEliminar" title="Eliminar registro" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#modalEliminar" onclick="cargarDatos('<%=u.getIdUsuario()%>', '<%=u.getIdRol()%>', '<%=u.getUsuario()%>', '<%=u.getPassword()%>');"><i class="fa fa-trash-o"></i></button>
								                                                </td>
								                                            </tr>
						                                            
						                                           		<%
																			} 
																		%>
						                                           
						                                        </tbody>
						                          			</table>
                                                
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="tab_content33" aria-labelledby="profile-tab">
                                                
                                                <%
											
													NGSolicitudTaller neg3 = new NGSolicitudTaller();
													ArrayList<SolicitudTaller> listaDesaprobados = new ArrayList<SolicitudTaller>(); 
													listaDesaprobados = neg3.cargarSolicitudesDesaprobadas();
										
												%>
													<table id="" class="display table table-striped responsive-utilities jambo_table">
						                                        <thead>
						                                            <tr class="headings">
						                                                <th>
						                                                    <input type="checkbox" class="tableflat">
						                                                </th>
						                                                <th>Id Solicitud </th>
						                                                <th>Profesor Guía </th>
						                                                <th>Taller </th>
						                                                <th>Fecha </th>
						                                                <th>Estado </th>
						                                                <th><span class="nobr">Acción</span></th>
						                                            </tr>
						                                        </thead>
						
						                                        <tbody>
						                                        
						                                        <%
																			for(SolicitudTaller st: listaDesaprobados)
																			{
																		%>
						                                            		<tr class="even pointer">
						                                                		<td class="a-center ">
						                                                    		<input type="checkbox" class="tableflat">
						                                                		</td>
									                                                <td class=""><%=st.getIdSolicitudTaller() %></td>
									                                                <td class=""><%=st.getNombreProfesor() %></td>
									                                                <td class=""><%=st.getNombreTaller() %>
								                                                </td>
									                                                <td class=""><%=st.getFechaSolicitud() %></td>
									                                                <td class=""><%=st.getCadenaEstado() %></td>
								                                                <td> 
								                                                    <!-- <button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalEditar" onclick=""><i class="fa fa-check-square-o"></i></button> -->
								                                                </td>
								                                            </tr>
						                                            
						                                           		<%
																			} 
																		%>
						                                           
						                                        </tbody>
						                          			</table>
                                                
                                            </div>
                                        </div>
                                    </div>
                                
                            </div>
                        </div>
                    </div>
            </div>
            
			</div>
			
			<jsp:include page="footer.jsp" flush="true" /><!-- /footer content -->
			
		</div><!-- /page content -->

	</div>

	<div id="custom_notifications" class="custom-notifications dsp_none">
		<ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group"></ul>
		<div class="clearfix"></div>
		<div id="notif-group" class="tabbed_notifications"></div>
	</div>
</body>


<script src="js/bootstrap.min.js"></script>
	
	    <script src="js/nicescroll/jquery.nicescroll.min.js"></script>
	    <!-- icheck -->
	    <script src="js/icheck/icheck.min.js"></script>
	
	    <script src="js/custom.js"></script>
	
     	<!-- Datatables -->
     
        <script src="js/datatables/js/jquery.js"></script>
    	<script src="js/datatables/js/jquery.dataTables.js"></script>
		<script src="js/datatables/tools/js/dataTables.tableTools.js"></script>
    	<script src="js/pluging-datatable/jquery.dataTables.columnFilter.js"></script>
        <!-- Fin Datatables -->
        
        <!-- PNotify -->
	    <script type="text/javascript" src="js/notify/pnotify.core.js"></script>
	    <script type="text/javascript" src="js/notify/pnotify.buttons.js"></script>
	    <script type="text/javascript" src="js/notify/pnotify.nonblock.js"></script>
	    <!-- Fin PNotify -->
	    
	    <!-- Datepicker -->
	    <script type="text/javascript" src="js/datepicker/daterangepicker.js"></script>
        
        <!-- Select2 -->
        	<script src="js/select/select2.full.js"></script>
        <!-- Fin Select2 -->
        
        
        <!-- Cargar datos -->
        <script type="text/javascript">
		
        	function cargarDatos(id, idr, nombre, pass){
				
        		$("#IdUsuario").val(id);
				$("#IdUsuarioEditar").val(id);
				$("#idUsuarioAdminEliminar").val(id);
				$("#rolUser").val(idr);
				$("#rolUserEditar").val(idr);
				$("#nombreUsuarioEditar").val(nombre);
				$("#passEditar").val(pass);
				//$("#nombre_TallerEliminado").val(nombre);
				
		}

	</script>
        
           <!-- avisos de CRUD -->
    	<%
    		String msj ="";
    		msj = request.getParameter("msj");
    		System.out.println(msj);
    	%>
        
        <script type="text/javascript">
    		function cargarNotify()
    		{
    			var mensaje = "<%=msj%>";
    			
    			if(mensaje=="1")
    			{
    				new PNotify({
    	                title: "Registro Guardado",
    	                type: "info",
    	                text: "El usuario fue almacenado exitosamente!!!",
    	                nonblock: {
                                  nonblock: true,
                                  nonblock_opacity: .9}
    				});
    			}
    			 if(mensaje=="2")
    			 {
    				 new PNotify({
    		                title: "Registro Modificado",
    		                type: "success",
    		                text: "El usuario se editó  exitosamente!!!",
    		                nonblock: {
                                   nonblock: true,
                                   nonblock_opacity: .9}
    					}); 
    			 }
    			 if(mensaje=="3")
    			{
    				 new PNotify({
    		                title: "Registro Eliminado",
    		                type: "error",
    		                text: "El usuario se eliminó exitosamente!!!",
    		                nonblock: {
                                   nonblock: true,
                                   nonblock_opacity: .9}
    					}); 
    			}
    			 
    			 if(mensaje=="4")
     			{
     				 new PNotify({
     		                title: "Registro no Encontrado",
     		                type: "error",
     		                text: "Hubo un problema!!",
     		                nonblock: {
                                    nonblock: true,
                                    nonblock_opacity: .9}
     					}); 
     			}
    		}
        </script>
        
    
       <script type="text/javascript">

			$(document).ready(function()
			{
				cargarNotify();
				$('table.display').dataTable(
						{
							// "dom": 'T<"clear">lfrtip',
				            //"tableTools": {
				             //   "sSwfPath": "js/datatables/tools/swf/copy_csv_xls_pdf.swf",
				              //  "aButtons": ["pdf", "xls"]
				           //},
							
							"sPaginationType": "full_numbers",
							"oLanguage": {
								"sSearch": "Buscar: ",
								"sEmptyTable": "No hay registros disponibles",
								"sInfo": "Mostrando un total de _TOTAL_ registros (_START_ de _END_)",
								"sInfoEmpty": "No hay registros disponibles",
								"sInfoFiltered": " - filtrando de _MAX_ registros",
								 "sLengthMenu": "Mostrar _MENU_ registros",
								 "sLoadingRecords": "Por favor esperar - cargando...",
								 "sProcessing": "Por favor, espere un momento mientras se procesa su petición",
								 "sZeroRecords": "No se encontró ningún registro",
								 "pagingType": "full_numbers",
									 "oPaginate": {
										   "sFirst": "Primero",
								           "sLast": "Último",
								           "sPrevious": "Atrás",
								           "sNext": "Siguiente"
								         }
							}	
						}	
				)
				.columnFilter({
					aoColumns: [ { type: "text" },
					             { type: "text" },
					 			 { type: "text" },
					 			 { type: "text" },
					 			 { type: "text" },
					 			 { type: "text" },
					 			 null
					 			]
				});
				
			});
		</script>
        
        <script>
        $(document).ready(function () {
        	cargarNotify();
            $(".select2_single").select2({
                placeholder: "Seleccione un rol",
                allowClear: true
            })
        });
        </script>
        
        <script>
         $(function() {
        	$("#botonNuevo").tooltip();
            $("#botonModificar").tooltip();
            $("#botonEliminar").tooltip();
         });
      </script>
</html>