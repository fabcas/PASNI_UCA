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
	int idInforme = 0;
	int idMonitor = 0;
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
			idMonitor = user.getIdMonitor();
		}
		NGInforme informe = new NGInforme();
		ArrayList<Informe> listai = new ArrayList<Informe>();
		listai = informe.cargarInformes(idUsuario);
		
		if(listai != null){
			for(Informe inf : listai){
				idInforme = inf.getIdInforme();
				idC = inf.getIdCuatrimestre();
				cuatrimestre = inf.getCuatrimestre();
			 	semana = inf.getSemana();
			 	fecha = sdf.format(new java.sql.Date(inf.getFecha().getTime()));
			}
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
	                            	<li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Asignar Grupo</a></li>
	                            	<li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab"  aria-expanded="false">Informe Semanal</a></li>
	                        		<li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab" data-toggle="tab"  aria-expanded="false">Histórico</a></li>
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
													<thead>
					                                	<tr class="headings">
					                               			<th class="column-title"># Informe </th>
					                                		<th class="column-title">Cuatrimestre</th>
					                                        <th class="column-title">Semana</th>
					                                        <th class="column-title">Fecha</th>
					                               		</tr>
					                            	</thead>
					                            	<tbody>
					                            	
										                <tr class="even pointer">
									                    	<td class=" "><%=idInforme%></td>
									                   		<td class=""><%=cuatrimestre%></td>
									                    	<td class=" "><%=semana %></td>
									                   		<td class=" "><%=fecha %></td>
									                    </tr>
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
				                            	<h2>Informes Semanales</h2>
				                            	<div class="clearfix"></div>
				                        	</div>
				                        	<div class="x_content">
				                        		<table  id="" class="display table table-striped responsive-utilities jambo_table bulk_action">
					                        		<thead>
						                              	<tr class="headings">
							                               	<th class="column-title">Grupo </th>
							                                <th class="column-title">Asignatura</th>
							                                <th class="column-title">Sección</th>
							                                <th class="column-title">Día</th>
							                                <th class="column-title">Horas</th>
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
				            	 <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
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
							                               	<th class="column-title">Carné </th>
							                                <th class="column-title">Nombre y Apellido</th>
							                                <th class="column-title">Asistió</th>
						                                </tr>
					                            	</thead>
					                            	<tbody>
					                            		<tr class="even pointer">
							                            	<td class=" "></td>
							                            	<td class=" "></td>
							                            	<td class="a-center ">
                                                    			<input type="checkbox" class="tableflat">
                                                			</td>
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
			%>
			<!-- Modal Agregar Inscripcion -->
			<div class="modal fade modalAsignarG"  id="modalAsignarG" tabindex="-1" role="dialog" aria-hidden="true">
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
						<!--  	<form class="form-horizontal form-label-left " name="form" method="post" action="../../SLMonitoreo?opc=1">-->
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
										<input type="hidden" id="idInscripcion" name="idInscripcion" class="form-control">
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
					                    
					                    <select id="idCuatrimestre" class="form-control" name="idCuatrimestre" required="required" tabindex="-1">
										<option value="0">Seleccione un cuatrimestre</option>
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
							<!--  </form>-->
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
					//var carr = $('#carrera option:selected').html();
					//var aperr = $('#idCuatrimestre option:selected').html();
					$.ajax({		    
				          url:"../../SLGrupo",
				          type:"post",
				          datatype:"html",
				          data:{'idCuatrimestre':$('#idCuatrimestre option:selected').html(), 
				        	  	'carrera':$('#carrera option:selected').attr('value')},
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
			});
	</script>

</html>