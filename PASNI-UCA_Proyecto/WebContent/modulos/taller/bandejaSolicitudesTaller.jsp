<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "servlets.*,entidades.*,datos.*, negocio.*, java.util.*"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bandeja de Solicitudes de Talleres</title>

	<!-- Librerías -->
		
		<link href="../../css/bootstrap.min.css" rel="stylesheet">

	    <link href="../../fonts/css/font-awesome.min.css" rel="stylesheet">
	    <link href="../../css/animate.min.css" rel="stylesheet">
	
	    <!-- Custom styling plus plugins -->
	    <link href="../../css/custom.css" rel="stylesheet">
	    <link href="../../css/icheck/flat/green.css" rel="stylesheet">
	
	    <link rel="stylesheet" type="text/css" href="../../css/progressbar/bootstrap-progressbar-3.3.0.css">
	    <script src="../../js/jquery.min.js"></script>
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
                                        <li><a href="../profesorGuia/inscripcion-profesor.jsp">Inscribir profesor guía</a>
                                        </li>
                                        <li><a href="../profesoresGuia/lista-profesores.jsp">Lista de profesores guías</a>
                                        </li>
                                        <li><a href="uu.html">Aún pensando....</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-desktop"></i> Taller de Formación <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                       <li><a href="solicitarTaller.jsp">Solicitar Taller de Reforzamiento</a>
                                        </li>
                                        <li><a href="taller.jsp">Catálogo de Taller</a>
                                        </li>
                                        <li><a href="bandejaSolicitudesTaller.jsp">Bandeja de Solicitudes de Talleres</a>
                                        </li>
                                        <li><a href="categoria-taller.jsp">Catálogo de Categoría</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-magic"></i> Administración <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="index.html">Dashboard</a>
                                        </li>
                                        <li><a href="index2.html">Dashboard2</a>
                                        </li>
                                        <li><a href="index3.html">Dashboard3</a>
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
                            <img class="imgsize" src="../../img/logos/lg_uca.png">
                        </a>
                        <a data-toggle="tooltip" data-placement="top" >
                            <img class="s5s" src="../../img/logos/55.png">
                        </a>
                        <a data-toggle="tooltip" data-placement="top" >
                            <img class="imgsize" src="../../img/logos/lg_js.png" >
                        </a>
                        <a data-toggle="tooltip" data-placement="top" >
                             <img class="imgsize" src="../../img/logos/lg_ausjal.png">
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
                            <h3>Bandeja de Solicitudes</h3>
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
                    
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Lista de solicitudes de talleres</h2>
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
                            
                            <div class="modal fade" id="modalAprobar" tabindex="-1" role="dialog" aria-hidden="true">
		                                    <div class="modal-dialog modal-sm">
		                                        <div class="modal-content">
		                                            <div class="modal-header">
		                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span>
		                                                </button>
		                                                <h5 class="modal-title"><b>Aprobar Solicitud</b></h5>
		                                            </div>
		                                            <div class="modal-body">
		                                               
		                                                <form class="form-horizontal form-label-left" name="form" method="post" action="../../SLSolicitudTaller?opc=1">
		                                                	<div class="item form-group">
		                                                		<div class="col-md-12 col-sm-12 col-xs-12">
																	<input type="hidden" name="idSolicitudTaller" id="idSolicitudTaller">
																	<!-- <input type="text" name="nombre_TallerEliminado" id="nombre_TallerEliminado" disabled="disabled"> -->
																	<p>¿Seguro que desea aprobar ésta solicitud?</p>
																</div>
															</div>
															<div class="modal-footer">
			                                                	<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
			                                                	<button type="submit" class="btn btn-primary">Aprobar</button>
		                                           			</div>
		                                                </form>
		                                            </div>
		                                            
		                                        </div>
		                                    </div>
		                                </div>
                            
								<div class="" role="tabpanel" data-example-id="togglable-tabs">
                                        <ul id="myTab1" class="nav nav-tabs bar_tabs left" role="tablist">
                                            <li role="presentation" class="active"><a href="#tab_content11" id="home-tabb" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Solicitudes pendientes</a>
                                            </li>
                                            <li role="presentation" class=""><a href="#tab_content22" role="tab" id="profile-tabb" data-toggle="tab" aria-controls="profile" aria-expanded="false">Solicitudes aprobadas</a>
                                            </li>
                                            <li role="presentation" class=""><a href="#tab_content33" role="tab" id="profile-tabb3" data-toggle="tab" aria-controls="profile" aria-expanded="false">Solicitudes desaprobadas</a>
                                            </li>
                                        </ul>
                                        <div id="myTabContent2" class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade active in" id="tab_content11" aria-labelledby="home-tab">
                                                
                                                <%
											
													NGSolicitudTaller neg = new NGSolicitudTaller();
													ArrayList<SolicitudTaller> lista = new ArrayList<SolicitudTaller>(); 
													lista = neg.cargarSolicitudesPendientes();
										
												%>
													<table id="table" class="table table-striped responsive-utilities jambo_table">
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
																			for(SolicitudTaller st: lista)
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
								                                                    <button type="button" id="botonAprobar" title="Aprobar solicitud" class="btn btn-success btn-xs" data-toggle="modal" data-target="#modalAprobar" onclick="cargarDatos('<%= st.getIdSolicitudTaller() %>')"><i class="fa fa-check-square-o"></i></button>
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
											
													NGSolicitudTaller neg2 = new NGSolicitudTaller();
													ArrayList<SolicitudTaller> listaAprobados = new ArrayList<SolicitudTaller>(); 
													listaAprobados = neg2.cargarSolicitudesAprobadas();
										
												%>
													<table id="table" class="table table-striped responsive-utilities jambo_table">
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
																			for(SolicitudTaller st: listaAprobados)
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
                                            <div role="tabpanel" class="tab-pane fade" id="tab_content33" aria-labelledby="profile-tab">
                                                
                                                <%
											
													NGSolicitudTaller neg3 = new NGSolicitudTaller();
													ArrayList<SolicitudTaller> listaDesaprobados = new ArrayList<SolicitudTaller>(); 
													listaDesaprobados = neg3.cargarSolicitudesDesaprobadas();
										
												%>
													<table id="table" class="table table-striped responsive-utilities jambo_table">
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

    <!-- chart js -->
    <script src="../../js/chartjs/chart.min.js"></script>
    <!-- bootstrap progress js -->
    <script src="../../js/progressbar/bootstrap-progressbar.min.js"></script>
    <script src="../../js/nicescroll/jquery.nicescroll.min.js"></script>
    <!-- icheck -->
    <script src="../../js/icheck/icheck.min.js"></script>

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
    
    <!-- Capturar los valores de la fila -->
    	
    	<script type="text/javascript">
		
        	function cargarDatos(id){
				
        		$("#idSolicitudTaller").val(id);
				
			}
        	
        </script>
    	
    <!-- Fin de capturar valores de la fila -->
    
     <!-- avisos de CRUD -->
    	<%
    		String msj ="";
    		msj = request.getParameter("msj");
    	
    	%>
        
        <script type="text/javascript">
    		function cargarNotify()
    		{
    			var mensaje = "<%=msj%>";
    			
    			if(mensaje == "1")
    			{
    				new PNotify({
    	                title: "Registro aprobado",
    	                type: "info",
    	                text: "La solicitud ha sido aprobada exitosamente.",
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
    		                text: "El taller se editó  exitosamente!!!",
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
    		                text: "El taller se elimino exitosamente!!!",
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
				
				$('#table').dataTable(
						{
							// "dom": 'T<"clear">lfrtip',
				            //"tableTools": {
				             //   "sSwfPath": "../../js/datatables/tools/swf/copy_csv_xls_pdf.swf",
				             //   "aButtons": ["pdf", "xls"]
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
         $(function() {
            $("#botonAprobar").tooltip();
         });
      </script>
</html>