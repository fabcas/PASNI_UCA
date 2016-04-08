<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "servlets.*,entidades.*,datos.*, negocio.*, java.util.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", -1);
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PASNI-UCA | Instancias UCA</title>

<!-- Librerías -->
		
		<link href="../../css/bootstrap.min.css" rel="stylesheet">
		<script src="../../js/jquery.min.js"></script> 

	    <link href="../../fonts/css/font-awesome.min.css" rel="stylesheet">
	    <link href="../../css/animate.min.css" rel="stylesheet">
	
	    <!-- Custom styling plus plugins -->
	    <link href="../../css/custom.css" rel="stylesheet">
	<!-- Fin de las librerías -->


</head>
<body class="nav-md">
    <div class="container body">
        <div class="main_container">

            <div class="col-md-3 left_col">
                <div class="left_col scroll-view">

                    <div class="navbar nav_title" style="border: 0;">
                        <a href="../../index.jsp" class="site_title"> <span>PASNI-UCA</span></a>
                    </div>
                    <div class="clearfix"></div>

                    <br/>

                    <!-- menu prile quick info -->
                   <!--  <div class="profile">
                        <div class="profile_pic">
                            <img src="images/img.jpg" alt="..." class="img-circle profile_img">
                        </div>
                        <div class="profile_info">
                            <span>Welcome,</span>
                            <h2>Anthony Fernando</h2>
                        </div>
                    </div>
                    <!-- /menu prile quick info -->

                    <br /> 
					
                    <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">

                        <div class="menu_section">
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-graduation-cap"></i> Alumno Monitor <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="index.html">Dashboard</a>
                                        </li>
                                        <li><a href="index2.html">Dashboard2</a>
                                        </li>
                                        <li><a href="index3.html">Dashboard3</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-edit"></i> Profesor Guía <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="modulos/profesorGuia/inscripcion-profesor.jsp">Inscribir profesor guía</a>
                                        </li>
                                        <li><a href="modulos/profesorGuia/lista-profesores.jsp">Lista de profesores guías</a>
                                        </li>
                                        <li><a href="modulos/profesorGuia/informe-guiatura.jsp">Enviar informe guiatura</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-desktop"></i> Taller de Formación <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                       <li><a href="modulos/taller/solicitarTaller.jsp">Solicitar Taller de Reforzamiento</a>
                                        </li>
                                        <li><a href="modulos/taller/taller.jsp">Catálogo de Taller</a>
                                        </li>
                                        <li><a href="modulos/taller/bandejaSolicitudesTaller.jsp">Bandeja de Solicitudes de Talleres</a>
                                        </li>
                                        <li><a href="modulos/taller/categoria-taller.jsp">Catálogo de Categoría</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-magic"></i> Administración <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                       	 <li><a href="Seg_CuentasUsuarios.jsp">Cuentas de usuarios</a>
                                         </li>
                                         <li><a href="Seg_Rol.jsp">Rol</a>
                                         </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        
                    </div>
                    <!-- /sidebar menu -->

                    <!-- /menu footer buttons -->
                    <div class="sidebar-footer hidden-small">
                        <a data-toggle="tooltip" data-placement="top" >
                            <img class="imgsize" src="../../img/logos/uca.png">
                        </a>
                        <a data-toggle="tooltip" data-placement="top" >
                            <img class="imgsize" src="../../img/logos/js.png" >
                        </a>
                        <a data-toggle="tooltip" data-placement="top" >
                             <img class="imgsize" src="../../img/logos/asj.png">
                        </a>
                    </div>
                    <!-- /menu footer buttons -->
                </div>
            </div>

            <!-- top navigation -->
            <div class="top_nav">

                <div class="nav_menu">
                    <nav class="" role="navigation">
                        <div class="nav toggle">
                            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                        </div>

                        <ul class="nav navbar-nav navbar-right">
                            <li class="">
                                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <img src="images/img.jpg" alt="">John Doe
                                    <span class=" fa fa-angle-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                                    <li><a href="javascript:;">  Profile</a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="badge bg-red pull-right">50%</span>
                                            <span>Settings</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">Help</a>
                                    </li>
                                    <li><a href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
                                    </li>
                                </ul>
                            </li>

                            <li role="presentation" class="dropdown">
                                <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-envelope-o"></i>
                                    <span class="badge bg-green">6</span>
                                </a>
                                <ul id="menu1" class="dropdown-menu list-unstyled msg_list animated fadeInDown" role="menu">
                                    <li>
                                        <a>
                                            <span class="image">
                                        <img src="images/img.jpg" alt="Profile Image" />
                                    </span>
                                            <span>
                                        <span>John Smith</span>
                                            <span class="time">3 mins ago</span>
                                            </span>
                                            <span class="message">
                                        Film festivals used to be do-or-die moments for movie makers. They were where... 
                                    </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a>
                                            <span class="image">
                                        <img src="images/img.jpg" alt="Profile Image" />
                                    </span>
                                            <span>
                                        <span>John Smith</span>
                                            <span class="time">3 mins ago</span>
                                            </span>
                                            <span class="message">
                                        Film festivals used to be do-or-die moments for movie makers. They were where... 
                                    </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a>
                                            <span class="image">
                                        <img src="images/img.jpg" alt="Profile Image" />
                                    </span>
                                            <span>
                                        <span>John Smith</span>
                                            <span class="time">3 mins ago</span>
                                            </span>
                                            <span class="message">
                                        Film festivals used to be do-or-die moments for movie makers. They were where... 
                                    </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a>
                                            <span class="image">
                                        <img src="images/img.jpg" alt="Profile Image" />
                                    </span>
                                            <span>
                                        <span>John Smith</span>
                                            <span class="time">3 mins ago</span>
                                            </span>
                                            <span class="message">
                                        Film festivals used to be do-or-die moments for movie makers. They were where... 
                                    </span>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="text-center">
                                            <a>
                                                <strong>See All Alerts</strong>
                                                <i class="fa fa-angle-right"></i>
                                            </a>
                                        </div>
                                    </li>
                                </ul>
                            </li>

                        </ul>
                    </nav>
                </div>

            </div>
            <!-- /top navigation -->

            <!-- page content -->
            <div class="right_col" role="main">

                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3>Catálogo de Instancias</h3>
                        </div>

                        <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search for...">
                                    <span class="input-group-btn">
                            <button class="btn btn-default" type="button">Go!</button>
                        </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="">
                       
                              
                          
                       <!-- Inicio del modal para agregar nuevo registro -->
											
									<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Nueva categoría</button> --> 
		
		                                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
		                                    <div class="modal-dialog">
		                                        <div class="modal-content">
		
		                                            <div class="modal-header">
		                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span>
		                                                </button>
		                                                <h5 class="modal-title"><b>Agregar Instancia</b></h5>
		                                            </div>
		                                            <div class="modal-body">
		                                                <h4><b>Complete los campos</b></h4>
		                                                <form class="form-horizontal form-label-left" name="form" method="post" action="../../SLInstanciasUCA?opc=1">
		                                                	<div class="item form-group">
		                                                	
																<br><label>Nombre:</label> 
																<input id="nombre" name="nombre" required="required" class="form-control" placeholder="Nombre">
																<br><label>Descripcion:</label> 
																<input id="descripcion" name="descripcion" required="required" class="form-control" placeholder="Descripcion">
																
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
		                                                <h5 class="modal-title"><b>Editar Instancia</b></h5>
		                                            </div>
		                                            <div class="modal-body">
		                                                <h4><b>Complete los campos</b></h4>
		                                                <form class="form-horizontal form-label-left" name="form" method="post" action="../../SLInstanciasUCA?opc=2">
		                                                	<div class="item form-group">
		                                                		<br> <label>Código de la Instancia: </label> <input
																class="form-control" id="IdInstancia" name="IdInstancia"
																disabled="disabled"> <input class="form-control"
																type="hidden" id="IdInstanciaEditar" name="IdInstanciaEditar">
		                                                		<br><label>Nombre:</label> 
																<input id="nombreEditar" name="nombreEditar" required="required" class="form-control" placeholder="Primer Nombre">
																<br><label>Descripción:</label>
																<input id="descripcionEditar" name="descripcionEditar" required="required" class="form-control" placeholder="Primer Nombre">
															</div>
															<div class="m-footer">
			                                                	<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
			                                                	<button type="submit" class="btn btn-primary">Guardar cambios</button>
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
		                                                <h5 class="modal-title"><b>Eliminar Instancia</b></h5>
		                                            </div>
		                                            <div class="modal-body">
		                                               
		                                                <form class="form-horizontal form-label-left" name="form" method="post" action="../../SLInstanciasUCA?opc=3">
		                                                	<div class="item form-group">
		                                                		<div class="col-md-12 col-sm-12 col-xs-12">
																	<input type="hidden" name="IdInstanciaEliminar" id="IdInstanciaEliminar">
																	<!-- <input type="text" name="nombre_TallerEliminado" id="nombre_TallerEliminado" disabled="disabled"> -->
																	<p>¿Seguro que desea eliminar esta instancia?</p>
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
                                <h2>Catálogo de Instancias</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="#">Settings 1</a>
                                            </li>
                                            <li><a href="#">Settings 2</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                                    </li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
								<button type="button" id="botonNuevo" title="Nuevo registro" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Ingresar nueva instancia</button>
								<br>		
										<%
											
											NGInstanciasUCA fac = new NGInstanciasUCA();
											ArrayList<InstanciasUCA> lista = new ArrayList<InstanciasUCA>(); 
											lista = fac.cargarFacilitador();
										
										%>
							<br>
							<table id="table" class="table table-striped responsive-utilities jambo_table">
                                        <thead>
                                            <tr class="headings">
                                                <th>
                                                    <input type="checkbox" class="tableflat">
                                                </th>
                                                <th>Id Instancia </th>
                                                <th>Nombre </th>
                                                <th>Descripcion</th>
                                                <th><span class="nobr">Acción</span></th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                        
                                        <%
													for(InstanciasUCA f: lista)
													{
												%>
                                            		<tr class="even pointer">
                                                		<td class="a-center ">
                                                    		<input type="checkbox" class="tableflat">
                                                		</td>
			                                                <td class=""><%=f.getIdInstancia() %></td>
			                                                <td class=""><%=f.getNombre() %></td>
			                                                <td class=""><%=f.getDescripcion() %></td>
		                                                <td> 
		                                                    <button type="button" id="botonModificar" title="Modificar registro" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalEditar" onclick="cargarDatos('<%=f.getIdInstancia() %>', '<%=f.getNombre()%>', '<%=f.getDescripcion()%>')"><i class="fa fa-pencil"></i></button>
		                                                    <button type="button" id="botonEliminar" title="Eliminar registro" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#modalEliminar" onclick="cargarDatos('<%=f.getIdInstancia() %>', '<%=f.getNombre()%>', '<%=f.getDescripcion()%>')"><i class="fa fa-trash-o"></i></button>
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
                <div class="clearfix"></div>

                <!-- footer content -->
                <footer>
                    <div class="">
                        <p class="pull-right">Programa de Acompañamiento y Seguimiento a Nuevo Ingreso <a> | Asistencia de Pregrado</a>.
                            
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </footer>
                <!-- /footer content -->

            </div>
            <!-- /page content -->
        </div>

    </div>

    <div id="custom_notifications" class="custom-notifications dsp_none">
        <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
        </ul>
        <div class="clearfix"></div>
        <div id="notif-group" class="tabbed_notifications"></div>
    </div>

    </div>
</body>

	<script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/custom.js"></script>
    
    <!-- Datatables -->
    	<script src="../../js/datatables/js/jquery.js"></script>
    	<script src="../../js/datatables/js/jquery.dataTables.js"></script>
		<script src="../../js/datatables/tools/js/dataTables.tableTools.js"></script>
    	<script src="../../js/pluging-datatable/jquery.dataTables.columnFilter.js"></script>
    <!-- END Datatables -->
    
    <!-- PNotify -->
	    <script type="text/javascript" src="../../js/notify/pnotify.core.js"></script>
	    <script type="text/javascript" src="../../js/notify/pnotify.buttons.js"></script>
	    <script type="text/javascript" src="../../js/notify/pnotify.nonblock.js"></script>
    <!-- End PNotify -->
    
    <script>
    	
    	function cargarDatos(id, nombre, descripcion)
    	{
    		$("#IdInstancia").val(id);
    		$("#IdInstanciaEditar").val(id);
    		$("#IdInstanciaEliminar").val(id);
    		$("#nombreEditar").val(nombre);
    		$("#descripcionEditar").val(descripcion);
    		
    	}
    
    </script>
    
       <!-- avisos de CRUD -->
    	<%
    		String msj = "";
    		msj = request.getParameter("msj");
    		System.out.println(msj);
    	%>
        
        <script type="text/javascript">
    		function cargarNotify()
    		{
    			var mensaje = <%=msj%>;
    			
    			if(mensaje=="1")
    			{
    				new PNotify({
    	                title: "Registro Guardado",
    	                type: "info",
    	                text: "El facilitador fue almacenado exitosamente!!!",
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
    		                text: "El facilitador se editó  exitosamente!!!",
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
    		                text: "El facilitador se eliminó exitosamente!!!",
    		                nonblock: {
                                   nonblock: true,
                                   nonblock_opacity: .9}
    					}); 
    			}
    			 if(mensaje=="4")
     			{
     				 new PNotify({
     		                title: "Registro no encontrado",
     		                type: "error",
     		                text: "El facilitador no fue encontrado!!!",
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
				//cargarNotify();
				cargarNotify();
				$('#table').dataTable(
						{
							"dom": 'T<"clear">lfrtip',
				            "tableTools": {
				                "sSwfPath": "../../js/datatables/tools/swf/copy_csv_xls_pdf.swf",
				                "aButtons": [
				                             {
				                            	 "sExtends": "xls",
				                            	 "sButtonText": "Excel"
				                             },
				                             {
				                            	 "sExtends": "pdf",
				                            	 "sButtonText": "PDF"
				                             }
				                            ]
				            },
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
					aoColumns: [ { data: "cuatrimestre" },
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
         $(function() {
        	$("#botonNuevo").tooltip();
            $("#botonModificar").tooltip();
            $("#botonEliminar").tooltip();
         });
      </script>
</html>