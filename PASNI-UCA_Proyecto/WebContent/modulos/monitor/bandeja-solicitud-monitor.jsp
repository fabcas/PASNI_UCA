<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="servlets.*,entidades.*,datos.*, negocio.*, java.util.*"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", -1);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PASNI-UCA | Inscripción Estudiante Monitor</title>
<!-- Bootstrap core CSS -->

<link href="../../css/bootstrap.min.css" rel="stylesheet">

<link href="../../fonts/css/font-awesome.min.css" rel="stylesheet">
<link href="../../css/animate.min.css" rel="stylesheet">

<!-- Custom styling plus plugins -->
<link href="../../css/custom.css" rel="stylesheet">
<link href="../../css/green.css" rel="stylesheet">

<script src="../../js/jquery.min.js"></script>
<script src="../../js/utilidades.js"></script>
<script src="../../js/icheck.min.js"></script>
</head>
<body class="nav-md">

	<div class="container body">

		<div class="main_container">

			<jsp:include page="../menu.jsp" flush="true" />
			
			<div class="right_col" role="main">

				<div class="page-title">
						<div class="title_left">
							<h3>Estudiante Monitor</h3>
						</div>
				</div>
				
				<div class="col-md-12 col-sm-12 col-xs-12">
                	<div class="x_panel">
                    	<div class="x_title">
                        	<h2>Lista de Inscripciones Estudiante Monitor</h2>
                            	<div class="clearfix"></div>
                             <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalAgregar">Agregar Inscripción</button>
                        </div>
                        <div class="x_content">
							<div class="" role="tabpanel" data-example-id="togglable-tabs">
                            	<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                 	<li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Todas</a></li>
                                    <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab"  aria-expanded="false">Aceptadas</a></li>
                                    <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Rechazadas</a></li>
                                </ul>
                            	<div id="myTabContent" class="tab-content">
                                	<div role="tabpanel" class="tab-pane fade active in" id="tab_content1">
                                    	<div class="col-md-12 col-sm-12 col-xs-12">
				                            <div class="x_panel">
				                                <div class="x_title">
				                                    <h2>Todas las Inscripciones</h2>
				                                    <div class="clearfix"></div>
				                                </div>
				
				                                <div class="x_content">
				
				                                    <p>Lista de todas las inscripciones</p>
				
													 <%
							                            NGInscripcion ngi = new NGInscripcion();
							                            ArrayList<InscripcionMonitor> lista = new ArrayList<InscripcionMonitor>();
							                            lista = ngi.cargarInscripcionMonitor();
							                        %>
				                                    <table  id="" class="display table table-striped responsive-utilities jambo_table bulk_action">
				                                        <thead>
				                                            <tr class="headings">
				                                               <th class="column-title">Carné </th>
				                                                <th class="column-title">Nombre</th>
				                                                <th class="column-title">Apellido</th>
				                                                <th class="column-title">Carrera</th>
				                                                <th class="column-title">Asignatura</th>
				                                                <th class="column-title">Calificación</th>
				                                                <th class="column-title">Promedio</th>
				                                                <th class="column-title">Fecha Envío</th>
				                                                <th class="column-title">Acción</th>
				                                           	</tr>
				                            			</thead>
				                            			
							                            <tbody>
							                            <%
							                            	for(InscripcionMonitor i : lista)
							                            	{
							                            %>
							                           
							                                <tr class="even pointer">
							                                    <td class=" "><%=i.getCarne()%></td>
							                                   	<td class=" "><%=i.getPrimerNombre()%></td>
							                                    <td class=" "><%=i.getPrimerApellido()%></td>
							                                    <td class=" "><%=i.getNombreC()%></td>
							                                    <td class=" "><%=i.getNombreA()%></td>
							                                    <td class=" "><%=i.getCalificacion() %></td>
							                                    <td class=" "><%=i.getPromedio() %></td>
							                                    <td class=" "><fmt:formatDate type="date" value="<%=i.getFecha()%>"/></td>
							                                    <td>
								                                    <button type="button" id="modalEditar" title="Modificar registro" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalEditar"
																		onclick="cargarDatos('<%=i.getIdInscripcion() %>','<%=i.getCarne()%>', '<%=i.getPrimerNombre()%>','<%=i.getPrimerApellido()%>', '<%=i.getNombreA()%>', '<%=i.getMotivo()%>','<%=i.getCalificacion()%>','<%=i.getPromedio()%>','<%=i.getTurno()%>');">
																		<i class="fa fa-pencil"></i>
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
                                   	<div role="tabpanel" class="tab-pane fade" id="tab_content2" aria-labelledby="profile-tab">
		                                 <div class="col-md-12 col-sm-12 col-xs-12">
				                            <div class="x_panel">
				                                <div class="x_title">
				                                    <h2>Todas las Inscripciones</h2>
				                                    <div class="clearfix"></div>
				                                </div>
				
				                                <div class="x_content">
				
				                                    <p>Lista de todas las inscripciones</p>
				
													 <%
							                            NGInscripcion ngi1 = new NGInscripcion();
							                            ArrayList<InscripcionMonitor> lista1 = new ArrayList<InscripcionMonitor>();
							                            lista1 = ngi1.cargarDatosIaprobados();
							                        %>
				                                    <table  id="" class="display table table-striped responsive-utilities jambo_table bulk_action">
				                                        <thead>
				                                            <tr class="headings">
				                                                <th class="column-title">Carné </th>
				                                                <th class="column-title">Nombre</th>
				                                                <th class="column-title">Apellido</th>
				                                                <th class="column-title">Carrera</th>
				                                                <th class="column-title">Asignatura</th>
				                                                <th class="column-title">Calificación</th>
				                                                <th class="column-title">Promedio</th>
				                                                <th class="column-title">Fecha Envío</th>
				                                                <th class="column-title">Acción</th>
				                                           	</tr>
				                            			</thead>
				                            			
							                            <tbody>
							                            <%
							                            	for(InscripcionMonitor i1 : lista1)
							                            	{
							                            %>
							                           
							                                <tr class="even pointer">
							                                    <td class=" "><%=i1.getCarne()%></td>
							                                   	<td class=" "><%=i1.getPrimerNombre()%></td>
							                                    <td class=" "><%=i1.getPrimerApellido()%></td>
							                                    <td class=" "><%=i1.getNombreC()%></td>
							                                    <td class=" "><%=i1.getNombreA()%></td>
							                                    <td class=" "><%=i1.getCalificacion() %></td>
							                                    <td class=" "><%=i1.getPromedio() %></td>
							                                    <td class=" "><fmt:formatDate type="date" value="<%=i1.getFecha()%>"/></td>
							                                    <td>
								                                    <button type="button" id="modalEditar" title="Modificar registro" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalEditar"
																		onclick="cargarDatos('<%=i1.getIdInscripcion() %>','<%=i1.getCarne()%>', '<%=i1.getPrimerNombre()%>','<%=i1.getPrimerApellido()%>', '<%=i1.getNombreA()%>', '<%=i1.getMotivo()%>','<%=i1.getCalificacion()%>','<%=i1.getPromedio()%>','<%=i1.getTurno()%>');">
																		<i class="fa fa-pencil"></i>
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
                                    <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
				                            <div class="x_panel">
				                                <div class="x_title">
				                                    <h2>Todas las Inscripciones</h2>
				                                    <div class="clearfix"></div>
				                                </div>
				
				                                <div class="x_content">
				
				                                    <p>Lista de todas las inscripciones</p>
				
													 <%
							                            NGInscripcion ngi2 = new NGInscripcion();
							                            ArrayList<InscripcionMonitor> lista2 = new ArrayList<InscripcionMonitor>();
							                            lista2 = ngi2.cargarDatosIReprobados();
							                        %>
				                                    <table  id="" class="display table table-striped responsive-utilities jambo_table bulk_action">
				                                        <thead>
				                                            <tr class="headings">
				                                                <th class="column-title">Carné </th>
				                                                <th class="column-title">Nombre</th>
				                                                <th class="column-title">Apellido</th>
				                                                <th class="column-title">Carrera</th>
				                                                <th class="column-title">Asignatura</th>
				                                                <th class="column-title">Calificación</th>
				                                                <th class="column-title">Promedio</th>
				                                                <th class="column-title">Fecha Envío</th>
				                                                <th class="column-title">Acción</th>
				                                           	</tr>
				                            			</thead>
				                            			
							                            <tbody>
							                            <%
							                            	for(InscripcionMonitor i2 : lista2)
							                            	{
							                            %>
							                           
							                                <tr class="even pointer">
							                                    <td class=" "><%=i2.getCarne()%></td>
							                                   	<td class=" "><%=i2.getPrimerNombre()%></td>
							                                    <td class=" "><%=i2.getPrimerApellido()%></td>
							                                    <td class=" "><%=i2.getNombreC()%></td>
							                                    <td class=" "><%=i2.getNombreA()%></td>
							                                    <td class=" "><%=i2.getCalificacion() %></td>
							                                    <td class=" "><%=i2.getPromedio() %></td>
							                                    <td class=" "><fmt:formatDate type="date" value="<%=i2.getFecha()%>"/></td>
							                                    <td>
								                                    <button type="button" id="modalEditar" title="Modificar registro" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalEditar"
																		onclick="cargarDatos('<%=i2.getIdInscripcion() %>','<%=i2.getCarne()%>', '<%=i2.getPrimerNombre()%>','<%=i2.getPrimerApellido()%>', '<%=i2.getNombreA()%>', '<%=i2.getMotivo()%>','<%=i2.getCalificacion()%>','<%=i2.getPromedio()%>','<%=i2.getTurno()%>');">
																		<i class="fa fa-pencil"></i>
																	</button>
							                                    </td>
							                               </tr>
							                             <%}%>
							                           </tbody>
				                  					</table>
				                                </div>
				                            </div>
                      					</div></div>
                                </div>
                           </div>
						</div><!-- /x-content -->
                    </div><!-- /x-panel -->
                 </div><!-- /col m12 -->                 
				<div class="clearfix"></div>
				<%
					NGAsignatura ng = new NGAsignatura();
					ArrayList<Asignatura> listam = new ArrayList<Asignatura>();
					listam = ng.comboAsignatura();
				%>
				 <!-- Modal Agregar Inscripcion -->
				<div class="modal fade modalAgregar"  id="modalAgregar" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">x</span>
								</button>
								<h5 class="modal-title">
									<b>Agregar Inscripción de Monitor</b>
								</h5>
							</div>
							<div class="modal-body">
							
								<form class="form-horizontal form-label-left " name="form" method="post" >
									<div class="item form-group">
										<label >Carné</label>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="carneA" name="carneA" required="required" class="form-control">
											</div>
											<button type="button" id="buscarC" name="buscarC" class="btn btn-success">Buscar Estudiante</button>
										</div>
										<div class="form-group">
											<div id="monitor">
												<div class="col-md-6 col-sm-6 col-xs-12 form-group">
													<input type="text" id="nombreP" name="nombreP" required="required" class="form-control" disabled="disabled">
												</div>
												<div class="col-md-6 col-sm-6 col-xs-12 form-group">
													<input type="text" id="nombreS" name="nombreS" required="required" class="form-control" disabled="disabled">
												</div>
												<div class="col-md-6 col-sm-6 col-xs-12 form-group">
													<input type="text" id="apellidoP" name="apellidoP" required="required" class="form-control" disabled="disabled">
												</div>
												<div class="col-md-6 col-sm-6 col-xs-12 form-group">
													<input type="text" id="apellidoS" name="apellidoS" required="required" class="form-control" disabled="disabled">
												</div>
											</div>
										</div>
										<label>Asignatura</label>
										<select id="asignaturaA" name="asignaturaA" class="form-control">
											<option>Seleccione una asignatura</option>
											<%for( Asignatura asig: listam){%>
												<option value="<%=asig.getIdAsigntatura()%>"><%=asig.getNombre()%></option>
											<%}%>
										</select><br>
										<label>Calificación</label> <input type="text" id="calificacionA" name="calificacionA" required="required" class="form-control" placeholder=""> <br>
										<label >Motivo</label>
										<div class="form-group has-feedback">
											<textarea id="motivoA" name="motivoA" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" 
												data-parsley-maxlength="200" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10">
											</textarea>
										</div>
										<label>Turno</label>
                                        <p>
                                           	<input type="radio" class="flat" checked name="turnoA" id="turnoA" value="diurno">Diurno
											<input type="radio" class="flat" checked name="turnoA" id="turnoA" value="vespertino">Vespertino
											<input type="radio" class="flat" checked name="turnoA" id="turnoA" value="sabatino"> Sabatino
										</p>
										<label>Aprobar</label> 
										<p>
                                           	<input type="radio" class="flat"  name="estadoA" id="estadoA" value="1">Si
											<input type="radio" class="flat"  name="estadoA" id="estadoA" value="2">No
										</p>
										
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
											<button type="submit" class="btn btn-primary">Agregar</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
					    
			    <!-- Modal Editar Inscripcion -->
				<div class="modal fade modalEditar"  id="modalEditar" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">x</span>
								</button>
								<h5 class="modal-title">
									<b>Editar Inscripción de Monitor</b>
								</h5>
							</div>
							<div class="modal-body">
								<form class="form-horizontal form-label-left " name="form" method="post" action="../../SLInscripcion?opc=2">
									<div class="item form-group">
										<label >Carné</label><input type="text" id="carneE" name="carneE" disabled="disabled" required="required" class="form-control">
															<input type="hidden" id="idInscripcionE" name="idInscripcionE" class="form-control" > <br>
										<label >Estudiante</label> 
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="nombreE" name="nombreE" required="required" class="form-control" disabled="disabled">
											</div>
											<label ></label> 
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="apellidoE" name="apellidoE" required="required" class="form-control" disabled="disabled">
											</div>
										</div>
										<label >Promedio</label> <input type="text" id="promedioE" name="promedioE" required="required" class="form-control" disabled="disabled"><br>
										<label>Asignatura</label>
										<select id="asignaturaE" name="asignaturaE" class="form-control">
											<option id="asignaturaEO"></option>
											<%for(Asignatura asig: listam){%>
												<option value="<%=asig.getIdAsigntatura()%>"><%=asig.getNombre()%></option>
											<%}%>
										</select><br>
										<label>Calificación</label> <input type="text" id="calificacionE" name="calificacionE" required="required" class="form-control" placeholder=""> <br>
										<label >Motivo</label>
										<textarea id="motivoE" name="motivoE" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" 
												data-parsley-maxlength="200" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10">
										</textarea>
										<label>Turno</label>
                                        <p>
                                           	<input type="radio" class="flat"  name="turnoE" id="turnoED" value="diurno">Diurno
											<input type="radio" class="flat"  name="turnoE" id="turnoEV" value="vespertino">Vespertino
											<input type="radio" class="flat"  name="turnoE" id="turnoES" value="sabatino"> Sabatino
                                        </p>
										<label>Aprobar</label> 
										<p>
                                           	<input type="radio" class="flat"  name="estadoE" id="estadoE" value="1">Si
											<input type="radio" class="flat"  name="estadoE" id="estadoE" value="2">No
										</p>
										
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

			</div><!-- /main -->
			 
			<div class="clearfix"></div>

			<jsp:include page="../footer.jsp" flush="true" /><!-- /footer content -->

		</div><!-- /page content -->
	</div>

	<div id="custom_notifications" class="custom-notifications dsp_none">
		<ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group"></ul>
			<div class="clearfix"></div>
			<div id="notif-group" class="tabbed_notifications"></div>
	</div>
</body>
<script src="../../js/custom.js"></script>
<script src="../../js/bootstrap.min.js"></script>

<!-- icheck -->
	<script src="../../js/icheck.min.js"></script>
	
<!-- Datatables -->
<script src="../../js/datatables/js/jquery.js"></script>
<script src="../../js/datatables/js/jquery.dataTables.js"></script>
<script src="../../js/datatables/tools/js/dataTables.tableTools.js"></script>
<script src="../../js/datatables/js/jquery.dataTables.columnFilter.js"></script>
<!-- Fin Datatables -->
		
	<script type="text/javascript">
			$(document).ready(function()
			{	
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