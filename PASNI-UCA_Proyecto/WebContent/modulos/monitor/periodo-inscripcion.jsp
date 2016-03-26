<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="datos.*, entidades.*,servlets.*,negocio.*, java.util.*"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>PASNI-UCA | Período Inscripción </title>
	
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
						<h3>Alumno Monitor</h3>
					</div>
				</div>
				
				<div class="col-md-12 col-sm-12 col-xs-12">
                	<div class="x_panel">
                    	<div class="x_title">
                        	<h2>Período de Inscripción Alumno Monitor</h2>
                           <div class="clearfix"></div>
                           <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalAgregar">Agregar Período</button>
                        </div>
                        <div class="x_content">
							<div class="" role="tabpanel" data-example-id="togglable-tabs">
                            	<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                 	<li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Todos</a></li>
                                    <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab"  aria-expanded="false">Finalizados</a></li>
                                </ul>
                            	<div id="myTabContent" class="tab-content">
                                	<div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
                                    	<div class="col-md-12 col-sm-12 col-xs-12">
				                            <div class="x_panel">
				                                <div class="x_title">
				                                    <h2>Períodos Registrados</h2>
				                                    <div class="clearfix"></div>
				                                </div>
				
				                                <div class="x_content">
				
				                                    <p>Listado de Períodos</p>
				
													 <%
							                            NGPeriodoInscripcion ngpi = new NGPeriodoInscripcion();
							                            ArrayList<PeriodoInscripcion> lista = new ArrayList<PeriodoInscripcion>();
							                            lista = ngpi.cargarPI();
							                        %>
				                                    <table class="display table table-striped responsive-utilities jambo_table bulk_action">
				                                        <thead>
				                                            <tr class="headings">
				                                                <th class="column-title">IdPeriodo </th>
				                                                <th class="column-title">Cuatrimestre</th>
				                                                <th class="column-title">Fecha Inicio</th>
				                                                <th class="column-title">Fecha Fin</th>
				                                                <th class="column-title">Acción</th>
				                                           	</tr>
				                            			</thead>
				                            			
							                            <tbody>
							                            <%
							                            	for(PeriodoInscripcion pi : lista)
							                            	{
							                            %>
							                           
							                                <tr class="even pointer">
							                                    <td class=" "><%=pi.getIdPeriodoInscripcion()%></td>
							                                   	<td class=" "><%=pi.getNombreC() %></td>
							                                    <td><fmt:formatDate type="date" value="<%=pi.getFechaInicio() %>"/> </td>
							                                    <td><fmt:formatDate type="date" value="<%=pi.getFechaFin() %>"/></td>
							                                    <td>
							                                    <button type="button" id="modalEditar" title="Modificar registro" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalEditar"
																onclick="cargarDatos('<%=pi.getIdPeriodoInscripcion()%>', '<%=pi.getNombreC()%>','<%=pi.getFechaInicio()%>', '<%=pi.getFechaFin()%>');">
																	<i class="fa fa-pencil"></i>
																</button>
																<button type="button" id="modalEliminar" title="Modificar registro" class="btn btn-danger btn-xs" data-toggle="modal" data-target=".modalEliminar"
																onclick="cargarDatos('<%=pi.getIdPeriodoInscripcion()%>', '<%=pi.getNombreC()%>','<%=pi.getFechaInicio()%>', '<%=pi.getFechaFin()%>');">
																	<i class="fa fa-trash-o"></i>
																</button>
							                                    </td>
							                               </tr>
							                             <%}%>
							                           </tbody>
				                  					</table>
				                                </div>
				                            </div>
                      					</div>
                                    </div>
                                   	<div role="tabpanel1" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
                                   		<div class="col-md-12 col-sm-12 col-xs-12">
				                            <div class="x_panel">
				                                <div class="x_title">
				                                    <h2>Períodos Finalizados</h2>
				                                    <div class="clearfix"></div>
				                                </div>
				
				                                <div class="x_content">
				
				                                    <p>Listado de Períodos</p>
													 <%
							                            NGPeriodoInscripcion ngpif = new NGPeriodoInscripcion();
							                            ArrayList<PeriodoInscripcion> listaf = new ArrayList<PeriodoInscripcion>();
							                            listaf = ngpif.cargarPIF();
							                        %>
				                                    <table class="display table table-striped responsive-utilities jambo_table bulk_action">
				                                        <thead>
				                                            <tr class="headings">
				                                               <th class="column-title">IdPeriodo </th>
				                                                <th class="column-title">Cuatrimestre</th>
				                                                <th class="column-title">Fecha Inicio</th>
				                                                <th class="column-title">Fecha Fin</th>
				                                           	</tr>
				                            			</thead>
				                            			<tbody>
							                             <%
							                            	for(PeriodoInscripcion pif : listaf)
							                            	{
							                            %>
							                           
							                                <tr class="even pointer">
							                                    <td class=" "><%=pif.getIdPeriodoInscripcion()%></td>
							                                   	<td class=" "><%=pif.getNombreC() %></td>
							                                    <td class=" "><fmt:formatDate type="date" value="<%=pif.getFechaInicio()%>"/></td>
							                                    <td class=" "><fmt:formatDate type="date" value="<%=pif.getFechaFin()%>"/></td>
							                               </tr>
							                             <%}%>
							                           </tbody>
				                  					</table>
				                                </div>
				                            </div>
                                   	
                                    </div>
                                </div>
                           </div>
						</div><!-- /x-content -->
                    </div><!-- /x-panel -->
                 	</div><!-- /panel -->
                 </div><!-- /col m12 -->
				<div class="clearfix"></div>
				
				<!-- Modal Agregar Periodo -->

				<div class="modal fade bs-example-modal-lg"  id="modalAgregar" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">x</span>
								</button>
								<h5 class="modal-title">
									<b>Agregar Período Inscripción</b>
								</h5>
							</div>
							<div class="modal-body">
								<form class="form-horizontal form-label-left" name="form" method="post" action="../../SLPeriodoInscripcion?opc=1">
									<div class="item form-group">
										<%
											NGTaller tallerNegocio = new NGTaller();
											ArrayList<Cuatrimestre> listaCuatrimestre = new ArrayList<Cuatrimestre>();
											listaCuatrimestre = tallerNegocio.comboCuatrimestre();
										%>
										<label>Cuatrimestre:</label> 
										<select id="idCuatrimestre" class="select2_single form-control" name="idCuatrimestre" required="required" tabindex="-1">
											<option>Seleccione..</option>
												<%for(Cuatrimestre cuatri : listaCuatrimestre){%>
													<option value="<%=cuatri.getIdCuatrimestre() %>"><%=cuatri.getNombre()%></option>
												<%}%>
										</select>
										<label>Fecha inicio:</label> <input type="date" id="fechaInicio" name="fechaInicio" required="required" class="form-control" placeholder=""> <br>
										<label>Fecha final:</label> <input type="date" id="fechaFin" name="fechaFin" required="required" class="form-control" placeholder="">
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
			    <!-- Modal Agregar -->
			    
			    <!-- Modal Modificar Periodo -->

				<div class="modal fade modalEditar"  id="modalEditar" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">x</span>
								</button>
								<h5 class="modal-title">
									<b>Editar Período Inscripción</b>
								</h5>
							</div>
							<div class="modal-body">
								<form class="form-horizontal form-label-left" name="form" method="post" action="../../SLPeriodoInscripcion?opc=2">
									<div class="item form-group">
										<label >idPeriodo:</label> <input type="text" id="IdPI" name="IdPIEditar" disabled="disabled" required="required" class="form-control" placeholder="">
																	<input type="hidden" id="IdPIEditar" name="IdPIEditar" class="form-control" placeholder=""> <br>
										<label >Cuatrimestre:</label> <input type="text" id="idCuatrimestreE" name="idCuatrimestreE" disabled="disabled" required="required" class="form-control" placeholder=""> <br>
										<label>Fecha inicio:</label> <input type="date" id="fechaIEditar" name="fechaIEditar" required="required" class="form-control" placeholder=""> <br>
										<label>Fecha final:</label> <input type="date" id="fechaFEditar" name="fechaFEditar" required="required" class="form-control" placeholder="">
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
			    <!-- Modal Agregar -->
			    
			    <div class="modal fade modalEliminar"  id="modalEliminar" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">x</span>
								</button>
								<h5 class="modal-title">
									<b>Eliminar Período Inscripción</b>
								</h5>
							</div>
							<div class="modal-body">
								<form class="form-horizontal form-label-left" name="form" method="post" action="../../SLPeriodoInscripcion?opc=3">
											<div class="item form-group">
												<div class="col-md-12 col-sm-12 col-xs-12">
													<input type="hidden" name=IdPIEliminar
														id="IdPIEliminar">
													<p>¿Seguro que desea eliminar este período de inscripción?</p>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Cancelar</button>
												<button type="submit" class="btn btn-primary">Eliminar</button>
											</div>
										</form>
							</div>
						</div>
					</div>
				</div>
			    <!-- Modal Eliminar -->

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

<!-- PNotify -->
<script type="text/javascript" src="../../js/notify/pnotify.core.js"></script>
<script type="text/javascript" src="../../js/notify/pnotify.buttons.js"></script>
<script type="text/javascript" src="../../js/notify/pnotify.nonblock.js"></script>
<!-- Fin PNotify -->

<!-- Datatables -->
<script src="../../js/datatables/js/jquery.js"></script>
<script src="../../js/datatables/js/jquery.dataTables.js"></script>
<script src="../../js/datatables/tools/js/dataTables.tableTools.js"></script>
<script src="../../js/datatables/js/jquery.dataTables.columnFilter.js"></script>
<!-- Fin Datatables -->

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
    	                title: "Registro Agregado",
    	                type: "info",
    	                text: "¡Registro Agregado con Éxito!",
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
    		                text: "¡Registro Modificado con Éxito!",
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
    		                text: "¡Registro Eliminado con Éxito!",
    		                nonblock: {
                                   nonblock: true,
                                   nonblock_opacity: .9}
    					}); 
    			}
    		}
    </script>
	
	<!-- Cargar datos -->
	<script type="text/javascript">
		
        	function cargarDatos(idPeriodoInscripcion, idCuatrimestre, fechaInicio, fechaFin){
        		$("#IdPI").val(idPeriodoInscripcion);
        		$("#IdPIEditar").val(idPeriodoInscripcion);
        		$("#IdPIEliminar").val(idPeriodoInscripcion);
        		$("#idCuatrimestreE").val(idCuatrimestre);
				$("#fechaIEditar").val(fechaInicio);
				$("#fechaFEditar").val(fechaFin);
				
		}
	</script>
	
	<script type="text/javascript">
			$(document).ready(function()
			{
				cargarNotify();
				$('table.display').dataTable(
						{							
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
</html>