<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="servlets.*,entidades.*,datos.*, negocio.*, java.util.*,
	java.util.Date,java.text.SimpleDateFormat"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PASNI-UCA | Horario de Talleres</title>
<!-- Librerías -->
		
		<link href="../../css/bootstrap.min.css" rel="stylesheet">
		<script src="../../js/jquery.min.js"></script> 

	    <link href="../../fonts/css/font-awesome.min.css" rel="stylesheet">
	    <link href="../../css/animate.min.css" rel="stylesheet">
	    <!-- <link href="../../bootstrap-datetimepicker.min.css" rel="stylesheet"> -->
		<link rel="stylesheet" href="../../css/bootstrap-datetimepicker.min.css">
	    <!-- Custom styling plus plugins -->
	    <link href="../../css/custom.css" rel="stylesheet">
	<!-- Fin de las librerías -->


</head>
<body class="nav-md">
    <div class="container body">
        <div class="main_container">

				<jsp:include page="../menu.jsp" flush="true" />

            <!-- page content -->
            <div class="right_col" role="main">

                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3>Catálogo de Horarios de Taller</h3>
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
		                                                <h5 class="modal-title"><b>Agregar Horario</b></h5>
		                                            </div>
		                                            <div class="modal-body">
		                                                <h4><b>Complete los campos</b></h4>
		                                                <form class="form-horizontal form-label-left" name="form" method="post" action="../../SLHorarioTaller?opc=1">
		                                                	<div class="item form-group">
		                                                	
																<br><label>Hora Inicio:</label> 
																<input id="horainicio" name="horainicio" type="time" require="required" class="form-control">
																<br><label>Hora Fin:</label> 
																<input id="horafin" name="horafin" type="time" required="required" class="form-control">
																<br><label>Turno:</label><br> 
																<select id="turno" name="turno" class="form-control">
																	<option value="0">Seleccione...</option>
																	<option value="1">AM</option>
																	<option value="2">PM</option>
																</select>
																
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
		                                                <h5 class="modal-title"><b>Editar Horario</b></h5>
		                                            </div>
		                                            <div class="modal-body">
		                                                <h4><b>Complete los campos</b></h4>
		                                                <form class="form-horizontal form-label-left" name="form" method="post" action="../../SLHorarioTaller?opc=2">
		                                                	<div class="item form-group">
		                                                		<label>Código del Taller: </label> <br>
		                                                		<input
																	class="form-control" id="IdHorarioTaller" name="IdHorarioTaller"
																	disabled="disabled"> <input class="form-control"
																	type="hidden" id="IdHorarioTallerEditar" name="IdHorarioTallerEditar">
		                                                		<br><label>Hora Inicio:</label> 
																<input id="horainicioEditar" name="horainicioEditar" type="time" require="required" class="form-control">
																<br><label>Hora Fin:</label> 
																<input id="horafinEditar" name="horafinEditar" type="time" required="required" class="form-control">
																<br><label>Turno:</label><br> 
																<select id="turnoEditar" name="turnoEditar" class="form-control">
																	<option value="0">Seleccione...</option>
																	<option value="1">AM</option>
																	<option value="2">PM</option>
																</select>
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
		                                                <h5 class="modal-title"><b>Eliminar Horario</b></h5>
		                                            </div>
		                                            <div class="modal-body">
		                                               
		                                                <form class="form-horizontal form-label-left" name="form" method="post" action="../../SLHorarioTaller?opc=3">
		                                                	<div class="item form-group">
		                                                		<div class="col-md-12 col-sm-12 col-xs-12">
																	<input type="hidden" name="IdHorarioTallerEliminar" id="IdHorarioTallerEliminar">
																	<!-- <input type="text" name="nombre_TallerEliminado" id="nombre_TallerEliminado" disabled="disabled"> -->
																	<p>¿Seguro que desea eliminar este horario?</p>
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
                                <h2>Catálogo de Horarios de Taller</h2>
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
								<button type="button" id="botonNuevo" title="Nuevo registro" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Ingresar nuevo horario</button>
								<br>		
										<%
											
											NGHorarioTaller ht = new NGHorarioTaller();
											ArrayList<HorarioTaller> lista = new ArrayList<HorarioTaller>(); 
											lista = ht.cargarHorarioTaller();
										
										%>
							<br>
							<table id="table" class="table table-striped responsive-utilities jambo_table">
                                        <thead>
                                            <tr class="headings">
                                                <th>
                                                    <input type="checkbox" class="tableflat">
                                                </th>
                                                <th>Id Horario </th>
                                                <th>Hora Inicio </th>
                                                <th>Hora Fin</th>
                                                <th>Turno</th>
                                                <th><span class="nobr">Acción</span></th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                        
                                        <%
													for(HorarioTaller h: lista)
													{
												%>
                                            		<tr class="even pointer">
                                                		<td class="a-center ">
                                                    		<input type="checkbox" class="tableflat">
                                                		</td>
			                                                <td class=""><%=h.getIdHorarioTaller() %></td>
			                                                <td class=""><%=h.getHoraInicio() %></td>
			                                                <td class=""><%=h.getHoraFin() %></td>
			                                                <td class=""><%=h.getTurno() %></td>
			                                                
		                                                <td> 
		                                                    <button type="button" id="botonModificar" title="Modificar registro" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalEditar" onclick="cargarDatos('<%=h.getIdHorarioTaller() %>', '<%=h.getHoraInicio() %>', '<%=h.getHoraFin() %>', '<%=h.getTurno()%>')"><i class="fa fa-pencil"></i></button>
		                                                    <button type="button" id="botonEliminar" title="Eliminar registro" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#modalEliminar" onclick="cargarDatos('<%=h.getIdHorarioTaller() %>', '<%=h.getHoraInicio() %>', '<%=h.getHoraFin() %>', '<%=h.getTurno()%>')"><i class="fa fa-trash-o"></i></button>
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
                	<jsp:include page="../footer.jsp" flush="true" />
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
    <!--  <script src="../../js/bootstrap-datetimepicker.min.js"></script> -->

    
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
    	
    	function cargarDatos(id, horainicio, horafin, turno)
    	{
    		$("#IdHorarioTaller").val(id);
    		$("#IdHorarioTallerEditar").val(id);
    		$("#IdHorarioTallerEliminar").val(id);
    		$("#horainicioEditar").val(horainicio);
    		$("#horafinEditar").val(horafin);
    		$("#turnoEditar").val(turno);
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
    	                text: "El horario fue almacenado exitosamente!!!",
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
    		                text: "El horario se editó  exitosamente!!!",
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
    		                text: "El horario se eliminó exitosamente!!!",
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
     		                text: "El horario no fue encontrado!!!",
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
				
			});
		</script>
		
		<script type="text/javascript">
            $(function () {
            	//cargarNotify();
                $('#datetimepicker3').datetimepicker({
                    format: 'LT'                
                });
            });
        </script>
		
		<script type="text/javascript">
         $(function() {
        	$("#botonNuevo").tooltip();
            $("#botonModificar").tooltip();
            $("#botonEliminar").tooltip();
         });
      </script>
      
      
</html>