<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
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
	int idInforme = 0;
	int idMonitor = 0;
	int idGrupo = 0;
	String grupo = "";
	String semana = "";
	int idC = 0;
	String cuatrimestre = "";
	String fecha="";
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PASNI-UCA | Monitoreo</title>
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
						<h3>Monitoreo</h3>
					</div>
				</div>
				
				<div class="col-md-12 col-sm-12 col-xs-12">
                	<div class="x_panel">
                    	<div class="x_title">
                    		<h2>Informes Semanales | Grupos Horarios</h2>
                        	<div class="clearfix"></div>
                        </div>
                    	
                    	 <div class="x_content">
	                    	 <div class="" role="tabpanel" data-example-id="togglable-tabs">
	                         	<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
	                            	<li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Informes Semanales</a></li>
	                            	<li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab"  aria-expanded="false">Grupos / Horarios</a></li>
	                        		<li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab" data-toggle="tab"  aria-expanded="false">Asistencia</a></li>
	                        	</ul>
	                         </div>
	                         <%
	                         	NGInforme ngi = new NGInforme();
	                         	ArrayList<Informe> li = new ArrayList<Informe>();
	                         	li = ngi.cargarInformes(idUsuario);
	                         	
	                         	NGAsignatura ng = new NGAsignatura();
	            				ArrayList<Asignatura> listam = new ArrayList<Asignatura>();
	            				listam = ng.comboAsignatura();

	            				NGTaller tallerNegocio = new NGTaller();
	            				ArrayList<Cuatrimestre> listaCuatrimestre = new ArrayList<Cuatrimestre>();
	            				listaCuatrimestre = tallerNegocio.comboCuatrimestre();		
	            				
	            				NGGrupo g = new NGGrupo();
	            				ArrayList<Grupo> lg = new ArrayList<Grupo>();
	            				lg = g.cargarGrupoU(idUsuario);
	            				
	            				ArrayList<HorarioAula> la = new ArrayList<HorarioAula>();
	            				la = g.cargarHorarioE(idUsuario);
	                         %>
	                         <div id="myTabContent" class="tab-content">
                             	<div role="tabpanel" class="tab-pane fade active in" id="tab_content1">
                                	<div class="col-md-12 col-sm-12 col-xs-12">
                                		<div class="x_panel">
				                        	<div class="x_title">
				                            	<h2>Informes Semanales</h2>
				                            	<div class="clearfix"></div>
				                            	<div class="modal-footer">
				                            		<button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalAgregar">Enviar Informe</button>
				                            	</div>
                    						</div>
				                       		<div class="x_content">
												<table  id="" class="display table table-striped responsive-utilities jambo_table bulk_action">
													<thead>
					                                	<tr class="headings">
					                               			<th class="column-title">Informe</th>
							                                <th class="column-title">Semana</th>
							                                <th class="column-title">Monitor</th>
							                                <th class="column-title">Fecha</th>
							                                <th class="column-title">Acción</th>
					                               		</tr>
					                            	</thead>
					                            	<tbody>
					                            		<%for(Informe i : li){%>
										                <tr class="even pointer">
									                    	<td class=" "><%=i.getIdInforme() %></td>
									                   		<td class=""><%=i.getSemana() %></td>
									                    	<td class=" "><%=i.getMonitor() %></td>
									                   		<td class=" "><fmt:formatDate type="date" value="<%=i.getFecha()%>"/></td>
									                   		<td>
									                   			<button type="button" id="modalInformeV" title="Modificar registro" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalInformeV"
																	onclick="cargarDatosIM('<%=i.getGRUP()%>', '<%=i.getSemana() %>', '<%=i.getPregunta1() %>','<%=i.getPregunta2()%>','<%=i.getPregunta3()%>','<%=i.getPregunta4()%>','<%=i.getPregunta5()%>','<%=i.getObservacionP()%>','<%=i.getObservacionA()%>');">
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
				                            	<h2>Grupos / Horarios</h2>
				                            	<div class="clearfix"></div>
				                        	</div>
				                        	<div class="x_content">
				                        		<table  id="" class="display table table-striped responsive-utilities jambo_table bulk_action">
					                        		<thead>
						                              	<tr class="headings">
							                               	<th class="column-title">Grupo</th>
							                                <th class="column-title">Aula</th>
							                                <th class="column-title">Día</th>
							                                <th class="column-title">Hora inicio</th>
							                                <th class="column-title">Hora fin</th>
						                                </tr>
					                            	</thead>
					                            	<tbody>
					                            	<%for(HorarioAula ha : la){ %>
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
		                        		<form action="../../SLMonitoreo?opc=4">
											<div class="x_panel">
					                    		<div class="x_title">
					                            	<h2>Grupos / Horarios</h2>
					                            	<div class="clearfix"></div>
					                            	<label>Grupo</label>
													<select id="idGrupoAsis" class="form-control" name="idGrupoAsis" required="required" tabindex="-1">
														<option >Seleccione un grupo</option>
														<%for(Grupo gr : lg){ %>
															<option value="<%=gr.getGRUP()%>"><%=gr.getGRUP()%></option>
														<%} %>
													</select><br>
													<div id="idAsis"></div>
													<div class="modal-footer">
														<button type="button" id="cargarAsis" name="cargarAsis" class="btn btn-success" >Listar asistencia</button>
													</div>
					                        	</div>
					                        	<div class="x_content">
					                        		<table  id="asistencia"></table>
					                        	</div>
					                   		</div>
				                   		</form>
				                 	</div>
				            	</div>
                             </div>
                    	 </div>
                    </div>
                </div>
				
			</div>
			<!-- Modal Agregar Inscripcion -->
			<div class="modal fade modalAgregar"  id="modalAgregar" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">x</span>
							</button>
							<h5 class="modal-title">
								<b>Informe Semanal</b>
							</h5>
						</div>
						<div class="modal-body">
							<form class="form-horizontal form-label-left " name="form" method="post" action="../../SLMonitoreo?opc=1">
								<div class="item form-group">
									<label>Grupo</label>
									<select id="idGrupo" class="form-control" name="idGrupo" required="required" tabindex="-1">
										<option >Seleccione un grupo</option>
										<%for(Grupo gr : lg){ %>
											<option value="<%=gr.getIdGrupo()%>"><%=gr.getGRUP()%></option>
										<%} %>
									</select><br>
									<label>Semana</label>
									<select id="semana" class="form-control" name="semana" required="required" tabindex="-1">
										<option value="Semana 1">Semana 1</option>
										<option value="Semana 2">Semana 2</option>
										<option value="Semana 3">Semana 3</option>
										<option value="Semana 4">Semana 4</option>
										<option value="Semana 5">Semana 1</option>
										<option value="Semana 6">Semana 2</option>
										<option value="Semana 7">Semana 3</option>
										<option value="Semana 8">Semana 4</option>
										<option value="Semana 9">Semana 1</option>
										<option value="Semana 10">Semana 2</option>
										<option value="Semana 11">Semana 3</option>
										<option value="Semana 12">Semana 4</option>
									</select><br>
									<label>1. Temas Desarrollados</label>
									<div class="form-group has-feedback">
										<textarea id="p1" name="p1" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
									</div>
									<label>2. Fortalezas de los muchachos</label>
									<div class="form-group has-feedback">
										<textarea id="p2" name="p2" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10"data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
									</div>
									<label>3. Dificultades más notables</label>
									<div class="form-group has-feedback">
										<textarea id="p3" name="p3" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
									</div>
									<label>4. Clima general del aula</label>
									<div class="form-group has-feedback">
										<textarea id="p4" name="p4" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
									</div>
									<label>5. Observación / Solicitud o sugerencia</label>
									<div class="form-group has-feedback">
										<textarea id="p5" name="p5" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
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
			
			<!-- Modal Observacion Informe -->
			<div class="modal fade modalInformeV"  id="modalInformeV" tabindex="-1" role="dialog" aria-hidden="true">
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
							<form class="form-horizontal form-label-left " name="form">
								<div class="item form-group">
									<label>Grupo</label>
									<input type="text" id="grupoM" name="grupoM" class="form-control" tabindex="-1" disabled="disabled"><br>
									<label>Semana</label>
									<input type="text" id="semanaM" name="semanaM" class="form-control" disabled="disabled" tabindex="-1"><br>
									<label>1. Temas Desarrollados</label>
									<div class="form-group has-feedback">
										<textarea id="p1M" name="p1M" disabled="disabled" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
									</div>
									<label>2. Fortalezas de los muchachos</label>
									<div class="form-group has-feedback">
										<textarea id="p2M" name="p2M" disabled="disabled" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10"data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
									</div>
									<label>3. Dificultades más notables</label>
									<div class="form-group has-feedback">
										<textarea id="p3M" name="p3M" disabled="disabled" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
									</div>
									<label>4. Clima general del aula</label>
									<div class="form-group has-feedback">
										<textarea id="p4M" name="p4M" disabled="disabled" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
									</div>
									<label>5. Observación / Solicitud o sugerencia</label>
									<div class="form-group has-feedback">
										<textarea id="p5M" name="p5M" disabled="disabled" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
									</div>
									<label>Observación Profesor Guía</label>
									<div class="form-group has-feedback">
										<textarea id="observacionPM" name="observacionPM" disabled="disabled" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
									</div>
									<label>Observación Área de Asistencia a Pregrado</label>
									<div class="form-group has-feedback">
										<textarea id="observacionAM" name="observacionAM" disabled="disabled" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10"></textarea>
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
<!-- Fin Datatables -->

<script type="text/javascript">
			$(document).ready(function()
			{	//cargarNotify();
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
				
				$('#cargarAsis').click(function(event){
					$.ajax({		    
						  url:"../../SLMonitoreo?opc=3",
				          type:"post",
				          datatype:"html",
				          data:{'aperAsis':$('#aperAsis').val(),
				        	  	'asigAsis':$('#asigAsis').val(),
				        	  	'grupoAsis':$('#grupoAsis').val()},
				        	  	success:function(data) 
						          {
						        		$('#asistencia').html(data); 
						        		$('#asistencia').dataTable().fnDestroy();
										$('#asistencia').dataTable
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
						$('#asistencia').addClass("table table-striped responsive-utilities jambo_table bulk_action");
				});
			});
	</script>

</html>