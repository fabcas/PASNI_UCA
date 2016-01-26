<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "controlador.*, datos.*, modelo.*, negocio.*, java.util.*"
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Cat�logo de Taller</title>
</head>

	<link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../fonts/css/font-awesome.min.css" rel="stylesheet">
    
    <link href="../../css/custom.css" rel="stylesheet">
    <link href="../../css/green.css" rel="stylesheet">
    <link href="../../css/icheck/flat/green.css" rel="stylesheet">
    

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
                                        <li><a href="index.html">Dashboard</a>
                                        </li>
                                        <li><a href="index2.html">Dashboard2</a>
                                        </li>
                                        <li><a href="index3.html">Dashboard3</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a><i class="fa fa-desktop"></i> Taller de Formaci�n <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                       <li><a href="index.html">Dashboard</a>
                                        </li>
                                        <li><a href="index2.html">Dashboard2</a>
                                        </li>
                                        <li><a href="index3.html">Dashboard3</a>
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
                        
                    </div><!-- /sidebar menu -->
					
						
					
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
                    </div> <!-- /menu footer buttons -->
                </div>
            </div><!--/col-md-3 left_col-->
            
            <div class="top_nav">

                <div class="nav_menu">
                    <nav class="" role="navigation">
                        <div class="nav toggle">
                            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                        </div>

                        <ul class="nav navbar-nav navbar-right">
                            <li class="">
                                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                    <img src="../../img/user.png" alt="">Usuario
                                    <span class=" fa fa-angle-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                                    <li><a href="index.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
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
                            <h3>Cat�logo de Taller</h3>
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

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel" style="height:600px;">
                                <div class="x_title">
                                    <h2>Talleres de Reforzamiento</h2>
                                    
                                 
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
                                		
										<!-- Inicio del modal para agregar nuevo registro -->
											
										<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">Guardar</button>
		
		                                <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true">
		                                    <div class="modal-dialog modal-sm">
		                                        <div class="modal-content">
		
		                                            <div class="modal-header">
		                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">�</span>
		                                                </button>
		                                                <h5 class="modal-title">Agregar Taller de Reforzamiento</h5>
		                                            </div>
		                                            <div class="modal-body">
		                                                <h4>Complete los campos</h4>
		                                                <form class="form-horizontal form-label-left" name="form" method="post" action="../../SLTaller?opc=1">
		                                                	<div class="item form-group">
		                                                		<%
																	NGTaller negC1 = new NGTaller();
																	ArrayList<Cuatrimestre> arrayLC1 = new ArrayList<Cuatrimestre>();
																	arrayLC1 = negC1.comboCuatrimestre();
															%>
																<br><label>Cuatrimestre:</label> 
																<select id="cuatri" name="cuatri" required="required" class="form-control">
																		<option>Seleccione...</option>
																		<%for(Cuatrimestre entiC1 : arrayLC1)
																		  { 
																		%>
																			<option value="<%=entiC1.getIdCuatrimestre() %>" ><%=entiC1.getNombre()%></option>
																		<%}%>
																	</select>
																<!--<input type="number" id="cuatri" name="cuatri" required="required" class="form-control" placeholder="">-->
																<label>Nombre:</label> 
																<input id="nombre" name="nombre" required="required" class="form-control" placeholder="">
																<label>Descripci�n:</label> 
																<textarea id="descripcion" name="descripcion" required="required" class="form-control" placeholder=""></textarea>
																<label>Fecha inicio:</label> 
																<input type="date" id="fechaini" name="fechaini" required="required" class="form-control" placeholder="">
																<label>Fecha final:</label> 
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
											
										<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".modalEditar">Editar</button> 
		
		                                <div class="modal fade modalEditar" tabindex="-1" role="dialog" aria-hidden="true">
		                                    <div class="modal-dialog modal-sm">
		                                        <div class="modal-content">
		                                            <div class="modal-header">
		                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">�</span>
		                                                </button>
		                                                <h5 class="modal-title">Editar Taller de Reforzamiento</h5>
		                                            </div>
		                                            <div class="modal-body">
		                                                <h4>Complete los campos</h4>
		                                                <form class="form-horizontal form-label-left" name="form" method="post" action="../../SLTaller?opc=2">
		                                                	<div class="item form-group">
		                                                		<%
																	NGTaller negt = new NGTaller();
																	ArrayList<Cuatrimestre> arrayt = new ArrayList<Cuatrimestre>();
																	arrayt = negt.comboCuatrimestre();
																%>
																<label>Cuatrimestre:</label> 
																<select id="cuatri" name="cuatri" required="required" class="form-control">
																		<option>Seleccione...</option>
																		<%for(Cuatrimestre negtw : arrayt)
																		  { 
																		%>
																			<option value="<%=negtw.getIdCuatrimestre() %>" ><%=negtw.getNombre()%></option>
																		<%}%>
																	</select>
																<!--<input type="number" id="cuatri" name="cuatri" required="required" class="form-control" placeholder="">-->
																<label>Nombre:</label> 
																<input id="nombre" name="nombre" required="required" class="form-control" placeholder="">
																<label>Descripci�n:</label> 
																<input id="descripcion" name="descripcion" required="required" class="form-control" placeholder="">
																<label>Fecha inicio:</label> 
																<input type="date" id="fechaini" name="fechaini" required="required" class="form-control" placeholder="">
																<label>Fecha final:</label> 
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
		                                
		                                <!-- Fin del modal de editar  -->
		                                
		                                <!-- Inicio del modal para eliminar registro -->
											
										 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalEliminar">eliminar</button>  
		
		                                <div class="modal fade" id="modalEliminar" tabindex="-1" role="dialog" aria-hidden="true">
		                                    <div class="modal-dialog modal-sm">
		                                        <div class="modal-content">
		                                            <div class="modal-header">
		                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">�</span>
		                                                </button>
		                                                <h5 class="modal-title">Eliminar Taller de Reforzamiento</h5>
		                                            </div>
		                                            <div class="modal-body">
		                                               
		                                                <form class="form-horizontal form-label-left" name="form" method="post" action="../../SLTaller?opc=3">
		                                                	<div class="item form-group">
		                                                		<div class="col-md-12 col-sm-12 col-xs-12">
																	<input type="hidden" name="idTallerEliminar" id="idTallerEliminar">
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
										
										
										
										<!-- Mostrar registros -->
										<%
											
											NGTaller neg = new NGTaller();
											ArrayList<Taller> arrayL = new ArrayList<Taller>(); 
											arrayL = neg.cargarDPTaller();
										
										%>
										
                                	<table id="example" class="table table-striped responsive-utilities jambo_table">
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
													for(Taller enti: arrayL)
													{
												%>
                                            		<tr class="even pointer">
                                                		<td class="a-center ">
                                                    		<input type="checkbox" class="tableflat">
                                                		</td>
			                                                <td class=""><%=enti.getIdTaller() %></td>
			                                                <td class=""><%=enti.getNombreCuatrimestre() %></td>
			                                                <td class=""><%=enti.getNombre() %>
		                                                </td>
			                                                <td class=""><%=enti.getDescripcion() %></td>
			                                                <td class=""><%=enti.getFechaInicio() %></td>
			                                                <td class=""><%=enti.getFechaFinal()%></td>
		                                                <td> 
		                                                    <a class="btn btn-info btn-xs" data-toogle="modal" data-target=".modalEditar"><i class="fa fa-pencil"></i></a>
		                                                    <a class="btn btn-danger btn-xs" data-toogle="modal" data-target="#modalEliminar"><i class="fa fa-trash-o"></i></a>
		                                                </td>
		                                            </tr>
                                            
                                           		<%
													} 
												%>
                                           
                                            </tbody>
                                          </table>
                                
                              
                        </div>
                    </div>
                                   <!-- Fin del formulario -->
                            </div>
                        </div>
                    </div>							
		</div>
        </div><!-- /main_container -->

   <!--   </div> -->  <!-- /container body-->

	    <script src="../../js/bootstrap.min.js"></script>
	    <script src="../../js/jquery.min.js"></script>
	    <script src="../../js/custom.js"></script>
        <!-- icheck -->
        <script src="../../js/icheck.min.js"></script>

</body>
	<script>
   		$(function () { $('#modalEliminar').modal('show')});
	</script>
	
	<script type="text/javascript">
		function validarFecha(inicio, fin)
		{
			
		}
	</script>

	<script type="text/javascript">
	
		function cargarDatos(id, idc, nombre, descripcion, fechaini, fechafin){
			$("#IdTaller").val(id);
			//$("#Id_PaisE").val(id);
			$("#cuatri").val(idc);
			$("#nombre").val(nombre);
			$("#descripcion").val(descripcion);
			$("#fechaini").val(fechaini);
			$("#fechafin").val(fechafin);
			
		}

	<%
		String msj ="";
		msj = request.getParameter("msj");
	
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
	                text: "El pais fue almacenado exitosamente!!!",
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
		                text: "El pais se edito  exitosamente!!!",
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
		                text: "El pais se elimino exitosamente!!!",
		                nonblock: {
                               nonblock: true,
                               nonblock_opacity: .9}
					}); 
			}
		}
	</script>
</html>