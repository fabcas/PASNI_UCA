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
                             <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalAgregar">Enviar Informe</button>
                        </div>
                        <div class="x_content">
							<div class="" role="tabpanel" data-example-id="togglable-tabs">
                            	<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                 	<li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Informes Semanales</a></li>
                                    <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab"  aria-expanded="false">Grupos / Horarios</a></li>
                                 </ul>
                            	<div id="myTabContent" class="tab-content">
                                	<div role="tabpanel" class="tab-pane fade active in" id="tab_content1">
                                    	<div class="col-md-12 col-sm-12 col-xs-12">
				                            <div class="x_panel">
				                                <div class="x_title">
				                                    <h2>Informes Semanales</h2>
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
				                                               <th class="column-title"># Informe </th>
				                                               <th class="column-title">Cuatrimestre</th>
				                                                <th class="column-title">Semana</th>
				                                                <th class="column-title">Fecha</th>
				                                           </tr>
				                            			</thead>
				                            			
							                            <tbody>
							                            <%
							                            	for(InscripcionMonitor i : lista)
							                            	{
							                            %>
							                           
							                                <tr class="even pointer">
							                                    <td class=" "><%=i.getCarne()%></td>
							                                    <td class=""><%= i.getNombreC() %></td>
							                                   	<td class=" "><%=i.getPrimerNombre()%></td>
							                                    <td class=" "><fmt:formatDate type="date" value="<%=i.getFecha()%>"/></td>
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
				                                    <h2>Grupos / Horarios</h2>
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
				                                                <th class="column-title">Grupo </th>
				                                                <th class="column-title">Asignatura</th>
				                                                <th class="column-title">Secci�n</th>
				                                                <th class="column-title">D�a</th>
				                                                <th class="column-title">Horas</th>
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
				<%
					NGAsignatura ng = new NGAsignatura();
					ArrayList<Asignatura> listam = new ArrayList<Asignatura>();
					listam = ng.comboAsignatura();

					NGTaller tallerNegocio = new NGTaller();
					ArrayList<Cuatrimestre> listaCuatrimestre = new ArrayList<Cuatrimestre>();
					listaCuatrimestre = tallerNegocio.comboCuatrimestre();
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
									<b>Agregar Inscripci�n de Monitor</b>
								</h5>
							</div>
							<div class="modal-body">
							
								<form class="form-horizontal form-label-left " name="form" method="post" action="../../SLInscripcion?opc=3">
									<div class="item form-group">
										<label>Asignatura</label>
										<select id="asignaturaA" name="asignaturaA" class="form-control">
											<option>Seleccione una asignatura</option>
											<%for( Asignatura asig: listam){%>
												<option value="<%=asig.getIdAsigntatura()%>"><%=asig.getNombre()%></option>
											<%}%>
										</select><br>
										<label>Cuatrimestre</label> 
										<select id="idCuatrimestre" class="form-control" name="idCuatrimestre" required="required" tabindex="-1">
											<option value="0">Seleccione un cuatrimestre</option>
											<%for(Cuatrimestre cuatri : listaCuatrimestre){%>
												<option value="<%=cuatri.getIdCuatrimestre() %>"><%=cuatri.getNombre()%></option>
											<%}%>
										</select><br>
										<label>Semana</label>
										<select id="semana" class="form-control" name="semana" required="required" tabindex="-1">
											<option value="Semana 1">Semana 1</option>
											<option value="Semana 2">Semana 2</option>
											<option value="Semana 3">Semana 3</option>
											<option value="Semana 4">Semana 4</option>
										</select><br>
										<label>1. Temas Desarrollados</label>
										<div class="form-group has-feedback">
											<textarea id="p1" name="p1" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" 
												data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10">
											</textarea>
										</div>
										<label>2. Fortalezas de los muchachos</label>
										<div class="form-group has-feedback">
											<textarea id="p2" name="p2" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" 
												data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10">
											</textarea>
										</div>
										<label>3. Dificultades m�s notables</label>
										<div class="form-group has-feedback">
											<textarea id="p3" name="p3" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" 
												data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10">
											</textarea>
										</div>
										<label>4. Clima general del aula</label>
										<div class="form-group has-feedback">
											<textarea id="p4" name="p4" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" 
												data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10">
											</textarea>
										</div>
										<label>5. Observaci�n / Solicitud o sugerencia</label>
										<div class="form-group has-feedback">
											<textarea id="p5" name="p5" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="10" 
												data-parsley-maxlength="500" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10">
											</textarea>
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

			</div><!-- /main -->
			 
			<div class="clearfix"></div>

			<jsp:include page="../footer.jsp" flush="true" /><!-- /footer content -->

		</div><!-- /page content -->
		
		<div id="custom_notifications" class="custom-notifications dsp_none">
			<ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group"></ul>
			<div class="clearfix"></div>
			<div id="notif-group" class="tabbed_notifications"></div>
		</div>
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

<!-- PNotify -->
<script type="text/javascript" src="../../js/notify/pnotify.core.js"></script>
<script type="text/javascript" src="../../js/notify/pnotify.buttons.js"></script>
<script type="text/javascript" src="../../js/notify/pnotify.nonblock.js"></script>
<!-- Fin PNotify -->

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
    	                text: "�El registro se ha guardado con �xito!",
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
    		                text: "�El registro se ha modificado con �xito!",
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
    		                text: "�El registro se ha eliminado con �xito!",
    		                nonblock: {
                                   nonblock: true,
                                   nonblock_opacity: .9}
    					}); 
    			}
    		}
</script>
		
	<script type="text/javascript">
			$(document).ready(function()
			{	cargarNotify();
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
</html>