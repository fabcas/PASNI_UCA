<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="servlets.*,entidades.*,datos.*, negocio.*, java.util.*, java.text.SimpleDateFormat"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", -1);
	
	int idUsuario = 0;
	
	ArrayList <UsuarioGenerico> listadmin = new ArrayList <UsuarioGenerico>();
	listadmin = (ArrayList <UsuarioGenerico>) session.getAttribute("login");
	if(listadmin != null)
 	{
		for (UsuarioGenerico user: listadmin)
		{	
			idUsuario = user.getIdUsuario();
		}
 	}
	else
	{
		response.sendRedirect("../../index.jsp");
		return;
	}
	
	
	
	
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PASNI-UCA | Planificar Monitoreo</title>
<!-- Bootstrap core CSS -->

<link href="../../css/bootstrap.min.css" rel="stylesheet">

<link href="../../fonts/css/font-awesome.min.css" rel="stylesheet">
<link href="../../css/animate.min.css" rel="stylesheet">

<!-- Custom styling plus plugins -->
<link href="../../css/custom.css" rel="stylesheet">
<link href="../../css/icheck/flat/green.css" rel="stylesheet">

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
						<h3>Planificar Monitoreo</h3>
					</div>
				</div>
				
				<div class="col-md-12 col-sm-12 col-xs-12">
                	<div class="x_panel">
                    	<div class="x_title">
                    		<h2>Grupos | Monitor</h2>
                        	<div class="clearfix"></div>
                        	<button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalAsignarG">Asignar Grupo</button>
                    	</div>
                    	
                    	 <div class="x_content">
	                    	 <div class="" role="tabpanel" data-example-id="togglable-tabs">
	                         	<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
	                            	<li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Grupo / Monitor</a></li>
	                            	<li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab"  aria-expanded="false">Horario / Grupo</a></li>
	                        		<li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab" data-toggle="tab"  aria-expanded="false">Informe Semanal</a></li>
	                        		<li role="presentation" class=""><a href="#tab_content4" role="tab" id="profile-tab" data-toggle="tab"  aria-expanded="false">Histórico</a></li>
	                        	</ul>
	                         </div>
	                         <div id="myTabContent" class="tab-content">
                             	<div role="tabpanel" class="tab-pane fade active in" id="tab_content1">
                                	<div class="col-md-12 col-sm-12 col-xs-12">
                                		<div class="x_panel">
				                        	<div class="x_title">
				                            	<h2>Asignación de Grupos al Monitor</h2>
				                            	<div class="clearfix"></div>
				                       		</div>
				                       		<div class="x_content">
												<table  id="" class="display table table-striped responsive-utilities jambo_table bulk_action">
													<%
														NGGrupo grupo = new NGGrupo();
														ArrayList<Grupo> lista = new ArrayList<Grupo>();
														lista = grupo.cargarGrupoB();
													%>
													<thead>
					                                	<tr class="headings">
					                               			<th class="column-title">Grupo</th>
					                                		<th class="column-title">Cuatrimestre</th>
					                                        <th class="column-title">Carrera</th>
					                                        <th class="column-title">Monitor</th>
					                                        <th class="column-title">Docente</th>
					                                        <th class="column-title">Fecha</th>
					                                        <th class="column-title">Acción</th>
					                               		</tr>
					                            	</thead>
					                            	<tbody>
					                            	<% for(Grupo g:lista){%>
										                <tr class="even pointer">
									                    	<td class=" "><%=g.getGRUP() %></td>
									                   		<td class=""><%=g.getAPER() %></td>
									                    	<td class=" "><%=g.getCARR() %></td>
									                   		<td class=" "><%=g.getMonitor() %></td>
									                   		<td class=" "><%=g.getProfesor() %></td>
									                   		<td class=" "><fmt:formatDate type="date" value="<%=g.getFecha()%>"/></td>
									                    	<td>
								                            	<button type="button" id="modalAsignarGH" title="Modificar registro" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalAsignarGH"
																	onclick="cargarDatosG('<%=g.getIdGrupo()%>','<%=g.getGRUP() %>');">
																	<i class="fa fa-pencil"></i>
																</button>
							                               	</td>
									                    </tr>
									                <%} %>
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
				                            	<h2>Histórico por Monitor</h2>
				                            	<div class="clearfix"></div>
				                        	</div>
				                        	<div class="x_content">
				                        		<table  id="" class="display table table-striped responsive-utilities jambo_table bulk_action">
				                        		<%
				                        			ArrayList<HorarioAula> lh = new ArrayList<HorarioAula>();
				                        			lh = grupo.cargarHorario();
		                        				%>
					                        		<thead>
						                              	<tr class="headings">
							                               	<th class="column-title">Grupo </th>
							                                <th class="column-title">Aula</th>
							                                <th class="column-title">Dia</th>
							                                <th class="column-title">Hora inicio</th>
							                                <th class="column-title">Hora fin</th>
						                                </tr>
					                            	</thead>
					                            	<tbody>
					                            	<%for(HorarioAula ha : lh){ %>
					                            		<tr class="even pointer">
							                            	<td class=" "><%=ha.getGRUP() %></td>
							                            	<td class=" "><%=ha.getCODIAULA() %></td>
							                            	<td class=" "><%=ha.getDia() %></td>
							                            	<td class=" "><%=ha.getHoraInicio() %></td>
							                            	<td class=" "><%=ha.getHoraFin() %></td>
							                        	</tr>
							                        <%} %>
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
				                            	<h2>Informes Semanales</h2>
				                            	<div class="clearfix"></div>
				                        	</div>
				                        
				                        	<%
				                        		NGInforme ngi = new NGInforme();
				                        		ArrayList<Informe> li = new ArrayList<Informe>();
				                        		li = ngi.cargarInformeT();
				                        	%>
				                        	<div class="x_content">
				                        		<table  id="" class="display table table-striped responsive-utilities jambo_table bulk_action">
					                        		<thead>
						                              	<tr class="headings">
							                               	<th class="column-title">Grupo </th>
							                                <th class="column-title">Semana</th>
							                                <th class="column-title">Monitor</th>
							                                <th class="column-title">Fecha</th>
							                                <th class="column-title">Acción</th>
						                                </tr>
					                            	</thead>
					                            	<tbody>
					                            		<tbody>
					                            		<%for(Informe in : li) {%>
					                            		<tr class="even pointer">
							                            	<td class=" "><%=in.getGRUP() %></td>
							                            	<td class=" "><%=in.getSemana() %></td>
							                            	<td class=" "><%=in.getMonitor() %></td>
							                            	<td class=" "><fmt:formatDate type="date" value="<%=in.getFecha() %>"/></td>
							                            	<td>
								                            	<button type="button" id="modalInforme" title="Modificar registro" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalInforme"
																	onclick="cargarDatosI('<%=in.getIdInforme() %>','<%=in.getGRUP()%>', '<%=in.getSemana() %>', '<%=in.getPregunta1() %>','<%=in.getPregunta2()%>','<%=in.getPregunta3()%>','<%=in.getPregunta4()%>','<%=in.getPregunta5()%>','<%=in.getObservacionP()%>','<%=in.getObservacionA()%>');">
																	<i class="fa fa-pencil"></i>
																</button>
							                               	</td>
							                        	</tr>
							                        	<%} %>
								              		</tbody>
					                            	</tbody>
				                        		</table>
				                        	</div>
				                   		</div>
				                 	</div>
				            	</div>
				            	 <div role="tabpanel" class="tab-pane fade" id="tab_content4" aria-labelledby="profile-tab">
		                        	<div class="col-md-12 col-sm-12 col-xs-12">
				                    	<div class="x_panel">
				                    		<div class="x_title">
				                            	<h2>Histórico por Monitor</h2>
				                            	<div class="clearfix"></div>
				                        	</div>
				                        	<div class="x_content">
				                        		<table  id="" class="display table table-striped responsive-utilities jambo_table bulk_action">
					                        		<thead>
						                              	<tr class="headings">
							                               	<th class="column-title">Grupo </th>
							                                <th class="column-title">Semana</th>
							                                <th class="column-title">Monitor</th>
							                                <th class="column-title">Fecha</th>
							                                <th class="column-title">Acción</th>
						                                </tr>
					                            	</thead>
					                            	<tbody>
					                            
					                            		<tr class="even pointer">
							                            	<td class=" "></td>
							                            	<td class=" "></td>
							                            	<td class=" "></td>
							                            	<td class=" "></td>
							                            	<td class=" "></td>
							                        	</tr>
							                        	
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
				
			</div>
			<%
				NGTaller tallerNegocio = new NGTaller();
				ArrayList<Cuatrimestre> listaCuatrimestre = new ArrayList<Cuatrimestre>();
				listaCuatrimestre = tallerNegocio.comboCuatrimestre();
				
				NGFacultad fac = new NGFacultad();
				ArrayList<Facultad> lis = new ArrayList<Facultad>();
				lis = fac.comboFacultad();
				
				NGProfesor profesor = new NGProfesor();
				ArrayList<Profesor> listap = new ArrayList<Profesor>();
				listap = profesor.cargarProfesor();
				
				ArrayList<VwMaestroAulas> la = new ArrayList<VwMaestroAulas>();
				la = grupo.cargarAula();
				
			%>
			<!-- Modal Agregar Grupo - Inscripcion -->
			<div class="modal fade modalAsignarG"  id="modalAsignarG" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">x</span>
							</button>
							<h5 class="modal-title">
								<b>Asignar Grupo al Monitor</b>
							</h5>
						</div>
						<div class="modal-body">
							<form class="form-horizontal form-label-left " name="form" method="post" action="../../SLGrupo?opc=2">
								<div class="item form-group">
									<label >Carné</label>
									<div class="form-group">
										<div class="col-md-6 col-sm-6 col-xs-12">
											<input type="text" id="carneA" name="carneA" required="required" class="form-control">
										</div>
										<button type="button" id="buscarPM" name="buscarPM" class="btn btn-success">Buscar Estudiante</button>
									</div>
									<div id="monitor">
										<div class="col-md-6 col-sm-6 col-xs-12 form-group">
											<input type="text" id="nombreP" name="nombreP" class="form-control" disabled="disabled">
										</div>
										<div class="col-md-6 col-sm-6 col-xs-12 form-group">
											<input type="text" id="nombreS" name="nombreS" class="form-control" disabled="disabled">
										</div>
										<div class="col-md-6 col-sm-6 col-xs-12 form-group">
											<input type="text" id="apellidoP" name="apellidoP" class="form-control" disabled="disabled">
										</div>
										<div class="col-md-6 col-sm-6 col-xs-12 form-group">
											<input type="text" id="apellidoS" name="apellidoS" class="form-control" disabled="disabled">
										</div>
										<div class="col-md-12 col-sm-12 col-xs-12 form-group">
											<label>Asignatura a Monitorear</label>
											<input type="text" id="nombreA" name="nombreA" class="form-control">
										</div>
									</div>
									<div class="col-md-12 col-sm-12 col-xs-12 form-group">
										<label >Facultad</label>
										<select id="facultad" name="facultad" class="form-control ">
											<option>Seleccion una facultad</option>
											<%for(Facultad facu: lis){%>
											<option value="<%=facu.getCOFA()%>"><%=facu.getNOMBRE()%></option>
											<%}%>
										</select><br>
										<label >Carrera</label>
										<select id="carrera" name="carrera" class="form-control"></select> <br>
										<label>Cuatrimestre</label> 
										<select id="idCuatrimestre" class="form-control" name="idCuatrimestre" required="required" tabindex="-1">
											<option value="0">Seleccione un cuatrimestre</option>
											<%for(Cuatrimestre cuatri : listaCuatrimestre){%>
											<option value="<%=cuatri.getNombre() %>"><%=cuatri.getNombre()%></option>
											<%}%>
										</select><br>
										<div class="modal-footer">
											<button type="button" id="buscarG" name="buscarG" class="btn btn-success" disabled="disabled">Buscar Grupos</button>
										</div>
										<table  id="grupo">
					                    </table>
					                    <br><br>
					                    <select id="idProfesor" class="form-control" name="idProfesor" required="required" tabindex="-1">
											<option value="0">Seleccione un profesor</option>
											<%for(Profesor profe : listap){%>
											<option value="<%=profe.getIdProfesorGuia() %>"><%=profe.getNombre()+""+profe.getApellido() %></option>
											<%}%>
										</select><br>
									</div>
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
			
			<!-- Modal Agregar Grupo - Horario -->
			<div class="modal fade modalAsignarGH"  id="modalAsignarGH" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">x</span>
							</button>
							<h5 class="modal-title">
								<b>Asignar Horario al Grupo</b>
							</h5>
						</div>
						<div class="modal-body">
							<form class="form-horizontal form-label-left " name="form" method="post" action="../../SLGrupo?opc=4">
								<div class="item form-group">
									<div class="col-md-12 col-sm-12 col-xs-12 form-group">
										<label>Grupo</label>
										<input type="text" id="grupn" name="grupn" class="form-control" tabindex="-1" disabled="disabled"><br>
										<input type="hidden" id="idgrupo" name="idgrupo" class="form-control" tabindex="-1">
										<label>Aula</label>
					                    <select id="idAula" class="form-control" name="idAula" required="required" tabindex="-1">
											<option value="0">Seleccione un aula</option>
											<%for(VwMaestroAulas a : la){%>
											<option value="<%=a.getCODIAULA() %>"><%=a.getCODIAULA()%></option>
											<%}%>
										</select><br>
										<label>Día</label>
										<select id="dia" class="form-control" name="dia" required="required" tabindex="-1">
											<option value="0">Seleccione un dia</option>
											<option value="Lunes">Lunes</option>
											<option value="Martes">Martes</option>
											<option value="Miércoles">Miércoles</option>
											<option value="Jueves">Jueves</option>
											<option value="Viernes">Viernes</option>
											<option value="Sábado">Sábado</option>
										</select><br>
										<div class="col-md-6 col-sm-6 col-xs-12 form-group">
											<label>Hora inicio</label>
											<input type="time" id="horaInicio" name="horaInicio" class="form-control" required="required" tabindex="-1">
										</div>
										<div class="col-md-6 col-sm-6 col-xs-12 form-group">
											<label>Hora fin</label>
											<input type="time" id="horaFin" name="horaFin" class="form-control" required="required" tabindex="-1">
										</div>
									</div>
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
			
			<!-- Modal Observacion Informe -->
			<div class="modal fade modalInforme"  id="modalInforme" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">x</span>
							</button>
							<h5 class="modal-title">
								<b>Informe Semanal | Obervaciones</b>
							</h5>
						</div>
						<div class="modal-body">
							<form class="form-horizontal form-label-left " name="form" method="post" action="../../SLMonitoreo?opc=2">
								<div class="item form-group">
									<label>Grupo</label>
									<input type="text" id="grupoi" name="grupoi" class="form-control" tabindex="-1" disabled="disabled"><br>
									<input type="hidden" id="idInformei" name="idInformei">
									<label>Semana</label>
									<input type="text" id="semanai" name="semanai" class="form-control" disabled="disabled" tabindex="-1"><br>
									<label>1. Temas Desarrollados</label>
									<div class="form-group has-feedback">
										<textarea id="p1" name="p1" disabled="disabled" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
									</div>
									<label>2. Fortalezas de los muchachos</label>
									<div class="form-group has-feedback">
										<textarea id="p2" name="p2" disabled="disabled" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10"data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
									</div>
									<label>3. Dificultades más notables</label>
									<div class="form-group has-feedback">
										<textarea id="p3" name="p3" disabled="disabled" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
									</div>
									<label>4. Clima general del aula</label>
									<div class="form-group has-feedback">
										<textarea id="p4" name="p4" disabled="disabled" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
									</div>
									<label>5. Observación / Solicitud o sugerencia</label>
									<div class="form-group has-feedback">
										<textarea id="p5" name="p5" disabled="disabled" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
									</div>
									<label>Observación Profesor Guía</label>
									<div class="form-group has-feedback">
										<textarea id="observacionP" name="observacionP" disabled="disabled" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
									</div>
									<label>Observación Área de Asistencia a Pregrado</label>
									<div class="form-group has-feedback">
										<textarea id="observacionA" name="observacionA" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
										<button type="submit" class="btn btn-primary">Enviar</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			

		</div><!-- /main -->
			 
		<div class="clearfix"></div>

		<jsp:include page="../footer.jsp" flush="true" />
		
	</div><!-- /container -->
</body>
<script src="../../js/custom.js"></script>
<script src="../../js/bootstrap.min.js"></script>

<!-- Datatables -->
<script src="../../js/datatables/js/jquery.js"></script>
<script src="../../js/datatables/js/jquery.dataTables.js"></script>
<script src="../../js/datatables/tools/js/dataTables.tableTools.js"></script>
<script src="../../js/datatables/js/jquery.dataTables.columnFilter.js"></script>
<script src="../../js/datatables/DT_bootstrap.js"></script>
<!-- Fin Datatables -->

<script type="text/javascript">
			$(document).ready(function()
			{	
				//cargarNotify();
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
				);
				
				$('#buscarG').click(function(event) {
					$.ajax({		    
				          url:"../../SLGrupo?opc=1",
				          type:"post",
				          datatype:"html",
				          data:{'idCuatrimestre':$('#idCuatrimestre option:selected').html(), 
				        	  	'carrera':$('#carrera option:selected').attr('value'),
				        	  	'idAsignatura':$('#idAsignatura').val()},
				          success:function(data) 
				          {
				        		$('#grupo').html(data); 
				        		$('#grupo').dataTable().fnDestroy();
								$('#grupo').dataTable
								(
										{
											"sPaginationType": "full_numbers",
											"oLanguage": {
												"bDestroy": true,
												"sSearch": "Buscar: ",
												"sEmptyTable": "No hay registros disponibles",
												"sInfo": "Mostrando un total de _TOTAL_ registros (_START_ de _END_)",
												"sInfoEmpty": "No hay registros disponibles",
												"sInfoFiltered": " - filtrando de _MAX_ registros",
												 "sLengthMenu": "Mostrar _MENU_ registros",
												 "sLoadingRecords": "Por favor esperar - cargando...",
												 "sProcessing": "Por favor, espere un momento mientras se procesa su petición",
												 "sZeroRecords": "No se encontró ningún registro",
												 "oPaginate": {
														   "sFirst": "|<",
												           "sLast": ">|",
												           "sPrevious": "<<",
												           "sNext": ">>"
												         }
											}	
										}	
								);
				          }//sucess
				        });
						$('#grupo').addClass("table table-striped responsive-utilities jambo_table bulk_action");
				});
				
				$('#buscarGG').click(function(event) {
					$.ajax({		    
						  url:"../../SLGrupo?opc=3",
				          type:"post",
				          datatype:"html",
				          data:{'CUATRI':$('#CUATRI option:selected').html(), 
				        	  	'CAR':$('#CAR option:selected').attr('value'),
				        	  	'IDP':$('#IDP option:selected').attr('value')},
				        	  	success:function(data) 
						          {
						        		$('#grupop').html(data); 
						        		$('#grupop').dataTable().fnDestroy();
										$('#grupop').dataTable
										(
												{
													"sPaginationType": "full_numbers",
													"oLanguage": {
														"bDestroy": true,
														"sSearch": "Buscar: ",
														"sEmptyTable": "No hay registros disponibles",
														"sInfo": "Mostrando un total de _TOTAL_ registros (_START_ de _END_)",
														"sInfoEmpty": "No hay registros disponibles",
														"sInfoFiltered": " - filtrando de _MAX_ registros",
														 "sLengthMenu": "Mostrar _MENU_ registros",
														 "sLoadingRecords": "Por favor esperar - cargando...",
														 "sProcessing": "Por favor, espere un momento mientras se procesa su petición",
														 "sZeroRecords": "No se encontró ningún registro",
														 "oPaginate": {
																   "sFirst": "|<",
														           "sLast": ">|",
														           "sPrevious": "<<",
														           "sNext": ">>"
														         }
													}	
												}	
										);
						          }//sucess
				        });
						$('#grupop').addClass("table table-striped responsive-utilities jambo_table bulk_action");
				});
			});
	</script>

</html>