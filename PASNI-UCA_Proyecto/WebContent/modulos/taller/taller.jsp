<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "servlets.*,entidades.*,datos.*, negocio.*, java.util.*"
 %>
 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>PASNI-UCA | Cat�logo de Taller </title>

    <!-- Bootstrap core CSS -->

    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <link href="../../fonts/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../css/animate.min.css" rel="stylesheet">

    <!-- Custom styling plus plugins -->
    <link href="../../css/custom.css" rel="stylesheet">
    <link href="../../css/icheck/flat/green.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="../../css/progressbar/bootstrap-progressbar-3.3.0.css">
    <script src="../../js/jquery.min.js"></script>
    <!-- select2 -->
    <link href="../../css/select/select2.min.css" rel="stylesheet">

    <!--[if lt IE 9]>
        <script src="../assets/js/ie8-responsive-file-warning.js"></script>
        <![endif]-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

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
                                <li><a><i class="fa fa-edit"></i> Profesor Gu�a <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="inscripcion-profesor.jsp">Inscribir profesor gu�a</a>
                                        </li>
                                        <li><a href="lista-profesores.jsp">Lista de profesores gu�as</a>
                                        </li>
                                        <li><a href="uu.html">A�n pensando....</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-desktop"></i> Taller de Formaci�n <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                       <li><a href="solicitarTaller.jsp">Solicitar Taller de Reforzamiento</a>
                                        </li>
                                        <li><a href="taller.jsp">Cat�logo de Taller</a>
                                        </li>
                                        <li><a href="bandejaSolicitudesTaller.jsp">Bandeja de Solicitudes de Talleres</a>
                                        </li>
                                        <li><a href="categoria-taller.jsp">Cat�logo de Categor�a</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-magic"></i> Administraci�n <span class="fa fa-chevron-down"></span></a>
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
                            <h3>Taller de Formaci�n</h3>
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
											
									<!-- button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Guardar</button> -->
		
		                                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
		                                    <div class="modal-dialog">
		                                        <div class="modal-content">
		
		                                            <div class="modal-header">
		                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span>
		                                                </button>
		                                                <h5 class="modal-title"><b>Agregar Taller de Reforzamiento</b></h5>
		                                            </div>
		                                            <div class="modal-body">
		                                                <h4><b>Complete los campos</b></h4>
		                                                <form class="form-horizontal form-label-left" name="form" method="post" action="../../SLTaller?opc=1">
		                                                	<div class="item form-group">
		                                                		<%
																	NGTaller tallerNegocio = new NGTaller();
																	ArrayList<Cuatrimestre> listaCuatrimestre = new ArrayList<Cuatrimestre>();
																	listaCuatrimestre = tallerNegocio.comboCuatrimestre();
															%>
																<br><br><label>Cuatrimestre:</label> 
																<select id="cuatri" class="select2_single form-control" name="cuatri" required="required"  tabindex="-1">
																		<option value="0">Seleccione..</option>
																		<%
																			for(Cuatrimestre cuatri : listaCuatrimestre)
																		  	{ 
																		%>
																				<option value="<%=cuatri.getIdCuatrimestre() %>" ><%=cuatri.getNombre()%></option>
																		<%	
																			}
																		%>	
																</select>
																<!--<input type="number" id="cuatri" name="cuatri" required="required" class="form-control" placeholder="">-->
																<br><label>Nombre:</label> 
																<input id="nombre" name="nombre" required="required" class="form-control" placeholder="">
																<br><label>Descripci�n:</label> 
																<textarea id="descripcion" name="descripcion" required="required" class="form-control" placeholder=""></textarea>
																<!-- <input type="text" class="form-control has-feedback-left" id="single_cal4" placeholder="Fecha de inicio" aria-describedby="inputSuccess2Status4"> -->
                                                            	<!-- <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span> -->
                                                            	<!-- <span id="inputSuccess2Status4" class="sr-only">(success)</span> -->
																 <br><label>Fecha inicio:</label> 
																<input type="date" id="fechaini" name="fechaini" required="required" class="form-control" placeholder="">
																
																<br><label>Fecha final:</label> 
																<input type="date" id="fechafin" name="fechafin" required="required" class="form-control" placeholder="">
															</div>
															<div class="modal-footer">
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
		                                                <h5 class="modal-title"><b>Editar Taller de Reforzamiento</b></h5>
		                                            </div>
		                                            <div class="modal-body">
		                                                <h4><b>Complete los campos</b></h4>
		                                                <form class="form-horizontal form-label-left" name="form" method="post" action="../../SLTaller?opc=2">
		                                                	<div class="item form-group">
		                                                		<%
																	NGTaller negt = new NGTaller();
																	ArrayList<Cuatrimestre> arrayt = new ArrayList<Cuatrimestre>();
																	arrayt = negt.comboCuatrimestre();
																%>
																<br><br>
																<label>C�digo del Taller: </label>
																<input class="form-control" id="IdTaller" name="IdTaller" disabled="disabled">
																<input class="form-control" type="hidden" id="IdTallerEditar" name="IdTallerEditar">
																<label>Cuatrimestre:</label> 
																<select class="select2_single form-control" id="cuatri_TallerEditado" name="cuatri_TallerEditado" required="required" tabindex="-1">
																		<option >Seleccione...</option>
																		<%for(Cuatrimestre negtw : arrayt)
																		  { 
																		%>
																			<option value="<%=negtw.getIdCuatrimestre() %>" ><%=negtw.getNombre()%></option>
																		<%}%>
																	</select>
																<!--<input type="number" id="cuatri" name="cuatri" required="required" class="form-control" placeholder="">-->
																<label>Nombre:</label> 
																<input id="nombre_TallerEditado" name="nombre_TallerEditado" required="required" class="form-control" placeholder="">
																<label>Descripci�n:</label> 
																<textarea id="descripcion_TallerEditado" name="descripcion_TallerEditado" required="required" class="form-control" placeholder=""></textarea>
																<label>Fecha inicio:</label> 
																<input type="date" id="fechaini_TallerEditado" name="fechaini_TallerEditado" required="required" class="form-control" placeholder="">
																<label>Fecha final:</label> 
																<input type="date" id="fechafin_TallerEditado" name="fechafin_TallerEditado" required="required" class="form-control" placeholder="">
															</div>
															<div class="modal-footer">
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
		                                                <h5 class="modal-title"><b>Eliminar Taller de Reforzamiento</b></h5>
		                                            </div>
		                                            <div class="modal-body">
		                                               
		                                                <form class="form-horizontal form-label-left" name="form" method="post" action="../../SLTaller?opc=3">
		                                                	<div class="item form-group">
		                                                		<div class="col-md-12 col-sm-12 col-xs-12">
																	<input type="hidden" name="idTallerEliminar" id="idTallerEliminar">
																	<!-- <input type="text" name="nombre_TallerEliminado" id="nombre_TallerEliminado" disabled="disabled"> -->
																	<p>�Seguro que desea eliminar este taller?</p>
																</div>
															</div>
															<div class="modal-footer">
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
                                <h2>Cat�logo de Taller</h2>
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
                            	<button type="button" id="botonNuevo" title="Nuevo registro" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Ingresar nuevo taller</button>
							
							<%
											
											NGTaller neg = new NGTaller();
											ArrayList<Taller> lista = new ArrayList<Taller>(); 
											lista = neg.cargarTalleres();
										
							%>
							<table id="table" class="table table-striped responsive-utilities jambo_table">
                                        <thead>
                                            <tr class="headings">
                                                <th>
                                                    <input type="checkbox" class="tableflat">
                                                </th>
                                                <th>Id Taller </th>
                                                <th>Cuatrimestre </th>
                                                <th>Nombre </th>
                                                <th>Descripci�n </th>
                                                <th>Fecha Inicio </th>
                                                <th>Fecha Fin </th>
                                                <th><span class="nobr">Acci�n</span></th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                        
                                        <%
													for(Taller t: lista)
													{
												%>
                                            		<tr class="even pointer">
                                                		<td class="a-center ">
                                                    		<input type="checkbox" class="tableflat">
                                                		</td>
			                                                <td class=""><%=t.getIdTaller() %></td>
			                                                <td class=""><%=t.getNombreCuatrimestre() %></td>
			                                                <td class=""><%=t.getNombre() %>
		                                                </td>
			                                                <td class=""><%=t.getDescripcion() %></td>
			                                                <td class=""><%=t.getFechaInicio() %></td>
			                                                <td class=""><%=t.getFechaFinal()%></td>
		                                                <td> 
		                                                    <button type="button" id="botonModificar" title="Modificar registro" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalEditar" onclick="cargarDatos('<%=t.getIdTaller()%>', '<%=t.getIdCuatrimestre()%>','<%=t.getNombre()%>','<%=t.getDescripcion()%>','<%=t.getFechaInicio()%>','<%=t.getFechaFinal()%>');"><i class="fa fa-pencil"></i></button>
		                                                    <button type="button" id="botonEliminar" title="Eliminar registro" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#modalEliminar" onclick="cargarDatos('<%=t.getIdTaller()%>', '<%=t.getIdCuatrimestre()%>','<%=t.getNombre()%>','<%=t.getDescripcion()%>','<%=t.getFechaInicio()%>','<%=t.getFechaFinal()%>');"><i class="fa fa-trash-o"></i></button>
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
                        <p class="pull-right">Programa de Acompa�amiento y Seguimiento a Nuevo Ingreso <a> | Asistencia de Pregrado</a>.
                            
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
        <!-- Fin Datatables -->
        
        <!-- PNotify -->
	    <script type="text/javascript" src="../../js/notify/pnotify.core.js"></script>
	    <script type="text/javascript" src="../../js/notify/pnotify.buttons.js"></script>
	    <script type="text/javascript" src="../../js/notify/pnotify.nonblock.js"></script>
	    <!-- Fin PNotify -->
	    
	    <!-- Datepicker -->
	    <script type="text/javascript" src="../../js/datepicker/daterangepicker.js"></script>
        
        <!-- Select2 -->
        	<script src="../../js/select/select2.full.js"></script>
        <!-- Fin Select2 -->
        
        <!-- Cargar datos -->
        <script type="text/javascript">
		
        	function cargarDatos(id, idc, nombre, descripcion, fechaini, fechafin){
				
        		$("#IdTaller").val(id);
				$("#IdTallerEditar").val(id);
				$("#idTallerEliminar").val(id);
				$("#cuatri_TallerEditado").val(idc);
				$("#nombre_TallerEditado").val(nombre);
				$("#nombre_TallerEliminado").val(nombre);
				$("#descripcion_TallerEditado").val(descripcion);
				$("#fechaini_TallerEditado").val(fechaini);
				$("#fechafin_TallerEditado").val(fechafin);
				
		}
        	
        	function cargarIdEliminar(id)
        	{
        		$("#IdTaller").val(id);
        		$("#idTallerEliminar").val(id);
        	}
	</script>
        
           <!-- avisos de CRUD -->
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
    	                title: "Registro Guardado",
    	                type: "info",
    	                text: "El taller fue almacenado exitosamente!!!",
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
    		                text: "El taller se edit�  exitosamente!!!",
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
				//cargarNotify();
				$('#table').dataTable(
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
								 "sProcessing": "Por favor, espere un momento mientras se procesa su petici�n",
								 "sZeroRecords": "No se encontr� ning�n registro",
								 "pagingType": "full_numbers",
									 "oPaginate": {
										   "sFirst": "Primero",
								           "sLast": "�ltimo",
								           "sPrevious": "Atr�s",
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
                placeholder: "Seleccione un cuatrimestre",
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