<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="servlets.*,entidades.*,datos.*, negocio.*, java.util.*"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PASNI-UCA | Estudiante Monitor</title>
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
                        	<h2>Lista de Estudiante Monitor</h2>
                            	<div class="clearfix"></div>
                             <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalAgregar">Agregar Estudiante</button>
                        </div>
                        <div class="x_content">
							<div class="" role="tabpanel" data-example-id="togglable-tabs">
                            	<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                 	<li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Todos</a></li>
                                <!--<li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab"  aria-expanded="false">Historial</a></li>
                                    <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Rechazadas</a></li>  -->
                                </ul>
                            	<div id="myTabContent" class="tab-content">
                                	<div role="tabpanel" class="tab-pane fade active in" id="tab_content1">
                                    	<div class="col-md-12 col-sm-12 col-xs-12">
				                            <div class="x_panel">
				                                <div class="x_title">
				                                    <h2>Todas los/las Estudiantes Monitores</h2>
				                                    <div class="clearfix"></div>
				                                </div>
				
				                                <div class="x_content">
				
				                                    <p>Lista de todas los/las estudiantes monitores</p>
				
													 <%
							                            NGMonitor ngm = new NGMonitor();
							                            ArrayList<Monitor> lista = new ArrayList<Monitor>();
							                            lista = ngm.cargarMonitor();
							                        %>
				                                    <table  id="table" class=" table table-striped responsive-utilities jambo_table bulk_action">
				                                        <thead>
				                                            <tr class="headings">
				                                               <th class="column-title">Carné </th>
				                                                <th class="column-title">Nombre</th>
				                                                <th class="column-title">Apellido</th>
				                                                <th class="column-title">Carrera</th>
				                                                <th class="column-title">Promedio</th>
				                                                <th class="column-title">Fecha Envío</th>
				                                                <th class="column-title">Acción</th>
				                                           	</tr>
				                            			</thead>
				                            			
							                            <tbody>
							                            <%
							                            	for(Monitor m : lista)
							                            	{
							                            %>
							                           
							                                <tr class="even pointer">
							                                    <td class=" "><%=m.getCarne()%></td>
							                                   	<td class=" "><%=m.getPrimerNombre()%></td>
							                                    <td class=" "><%=m.getPrimerApellido()%></td>
							                                    <td class=" "><%=m.getCarrera()%></td>
							                                    <td class=" "><%=m.getPromedio()%></td>
							                                    <td class=" "><fmt:formatDate type="date" value="<%=m.getFecha()%>"/></td>
							                                    <td>
								                                    <button type="button" id="modalEditar" title="Modificar registro" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalEditar"
																		onclick="cargarDatosM('<%=m.getIdMonitor() %>','<%=m.getCarne()%>', '<%=m.getPrimerNombre()%>', '<%=m.getSegundoNombre()%>','<%=m.getPrimerApellido()%>', '<%=m.getSegundoApellido()%>', '<%=m.getEmail() %>', '<%=m.getTelefono()%>', '<%=m.getCarrera()%>', '<%=m.getPromedio()%>');">
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
                                </div>
                           </div>
						</div><!-- /x-content -->
                    </div><!-- /x-panel -->
                 </div><!-- /col m12 -->                 
				<div class="clearfix"></div>
				
				 <!-- Modal Agregar Inscripcion -->
				<div class="modal fade modalAgregar"  id="modalAgregar" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">x</span>
								</button>
								<h5 class="modal-title">
									<b>Agregar Estudiante Monitor</b>
								</h5>
							</div>
							<div class="modal-body">
							
								<form class="form-horizontal form-label-left " name="form" method="post" action="../../SLMonitor?opc=1">
									<div class="item form-group">
										<label >Carné</label><input type="text" id="carneA" name="carneA" required="required" class="form-control">
										<label >Nombres</label> 
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="nombrePA" name="nombrePA" required="required" class="form-control">
											</div>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="nombreSA" name="nombreSA" required="required" class="form-control">
											</div>
										</div>
										<label >Apellidos</label>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="apellidoEA" name="apellidoPA" required="required" class="form-control">
											</div>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="apellidoSA" name="apellidoSA" required="required" class="form-control">
											</div>
										</div>
										<label>Correo</label><input type="email" class="form-control" id="emailA" name="emailA"><br>
										<label>Celular</label><input type="text" class="form-control " id="telefonoA" name="telefonoA"><br>
										<% 
											NGFacultad fac = new NGFacultad();
											ArrayList<Facultad> lis = new ArrayList<Facultad>();
											lis = fac.comboFacultad();
										%>
										<label >Facultad</label>
										<select id="facultad" name="facultad" class="form-control ">
											<option>Seleccion una facultad</option>
											<%for(Facultad facu: lis){%>
												<option value="<%=facu.getCOFA()%>"><%=facu.getNOMBRE()%></option>
											<%}%>
										</select><br>
										<label >Carrera</label>
										<select id="carrera" name="carrera" class="form-control"></select> <br>
										<label >Promedio</label> <input type="text" id="promedioA" name="promedioA" required="required" class="form-control" ><br>
										
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
									<b>Editar Estudiante Monitor</b>
								</h5>
							</div>
							<div class="modal-body">
								<form class="form-horizontal form-label-left " name="form" method="post" action="../../SLMonitor?opc=2">
									<div class="item form-group">
										<label >Carné</label><input type="text" id="carneE" name="carneE" required="required" class="form-control">
															<input type="hidden" id="idMonitorE" name="idMonitorE" class="form-control" > <br>
										<label >Nombres</label> 
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="nombrePE" name="nombrePE" required="required" class="form-control">
											</div>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="nombreSE" name="nombreSE" required="required" class="form-control">
											</div>
										</div>
										<label >Apellidos</label>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="apellidoEP" name="apellidoEP" required="required" class="form-control">
											</div>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="apellidoSE" name="apellidoSE" required="required" class="form-control">
											</div>
										</div>
										<label>Correo</label><input type="email" class="form-control" id="emailE" name="emailE"><br>
										<label>Celular</label><input type="text" class="form-control " id="telefonoE" name="telefonoE"> <br>
										<label>Carrera</label><input type="text" class="form-control " id="carreraE" name="telefonoE" disabled="disabled"> <br>
										<label >Promedio</label> <input type="text" id="promedioEM" name="promedioEM" required="required" class="form-control" ><br>
										
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
				$('#table').dataTable(
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