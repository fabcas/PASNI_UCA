<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="servlets.*,entidades.*,datos.*, negocio.*, java.util.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PASNI-UCA | Alumnos Monitores</title>
<!-- Bootstrap core CSS -->

<link href="../../css/bootstrap.min.css" rel="stylesheet">

<link href="../../fonts/css/font-awesome.min.css" rel="stylesheet">
<link href="../../css/animate.min.css" rel="stylesheet">

<!-- Custom styling plus plugins -->
<link href="../../css/custom.css" rel="stylesheet">
<link href="../../css/icheck/flat/green.css" rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="../../css/progressbar/bootstrap-progressbar-3.3.0.css">
<script src="../../js/jquery.min.js"></script>
</head>
<body class="nav-md">

	<div class="container body">

		<div class="main_container">

			<jsp:include page="../menu.jsp" flush="true" />
			
			<div class="right_col" role="main">

				<div class="page-title">
						<div class="title_left">
							<h3>Alumnos Monitores</h3>
						</div>
				</div>
				
				<div class="col-md-12 col-sm-12 col-xs-12">
                	<div class="x_panel">
                    	<div class="x_title">
                        	<h2>Inscripciones</h2>
                            	<div class="clearfix"></div>
                        </div>
                        <div class="x_content">
							<div class="" role="tabpanel" data-example-id="togglable-tabs">
                            	<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                 	<li role="presentation" class="active"><a href="#tab_content1" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Todas</a></li>
                                    <li role="presentation" class=""><a href="#tab_content2" role="tab" id="profile-tab" data-toggle="tab"  aria-expanded="false">Pendientes</a></li>
                                    <li role="presentation" class=""><a href="#tab_content3" role="tab" id="profile-tab2" data-toggle="tab" aria-expanded="false">Rechazadas</a></li>
                                </ul>
                            	<div id="myTabContent" class="tab-content">
                                	<div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">
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
				                                                <th>
				                                                    <input type="checkbox" id="check-all" class="flat">
				                                                </th>
				                                                <th class="column-title">IdInscripcion </th>
				                                                <th class="column-title">Nombre</th>
				                                                <th class="column-title">Apellido</th>
				                                                <th class="column-title">Carrera</th>
				                                                <th class="column-title">Asignatura</th>
				                                                <th class="column-title">Motivo</th>
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
							                                    <td class="a-center "><input type="checkbox" class="flat" name="table_records" ></td>
							                                    <td class=" "><%=i.getIdInscripcion()%></td>
							                                   	<td class=" "><%=i.getPrimerNombre()%></td>
							                                    <td class=" "><%=i.getPrimerApellido()%></td>
							                                    <td class=" "><%=i.getNombreC()%></td>
							                                    <td class=" "><%=i.getNombreA()%></td>
							                                    <td class=" "><%=i.getMotivo()%></td>
							                                    <td class=" "><%=i.getFecha()%></td>
							                                    <td>
								                                    <button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalEditar">
								                                    	<i class="fa fa-folder"></i>Ver
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
				                                                <th>
				                                                    <input type="checkbox" id="check-all" class="flat">
				                                                </th>
				                                                <th class="column-title">IdInscripcion </th>
				                                                <th class="column-title">Nombre</th>
				                                                <th class="column-title">Apellido</th>
				                                                <th class="column-title">Carrera</th>
				                                                <th class="column-title">Asignatura</th>
				                                                <th class="column-title">Motivo</th>
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
							                                    <td class="a-center "><input type="checkbox" class="flat" name="table_records" ></td>
							                                    <td class=" "><%=i1.getIdInscripcion()%></td>
							                                   	<td class=" "><%=i1.getPrimerNombre()%></td>
							                                    <td class=" "><%=i1.getPrimerApellido()%></td>
							                                    <td class=" "><%=i1.getNombreC()%></td>
							                                    <td class=" "><%=i1.getNombreA()%></td>
							                                    <td class=" "><%=i1.getMotivo()%></td>
							                                    <td class=" "><%=i1.getFecha()%></td>
							                                    <td>
								                                    <button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalEditar">
								                                    	<i class="fa fa-folder"></i>Ver
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
				                                                <th>
				                                                    <input type="checkbox" id="check-all" class="flat">
				                                                </th>
				                                                <th class="column-title">IdInscripcion </th>
				                                                <th class="column-title">Nombre</th>
				                                                <th class="column-title">Apellido</th>
				                                                <th class="column-title">Carrera</th>
				                                                <th class="column-title">Asignatura</th>
				                                                <th class="column-title">Motivo</th>
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
							                                    <td class="a-center "><input type="checkbox" class="flat" name="table_records" ></td>
							                                    <td class=" "><%=i2.getIdInscripcion()%></td>
							                                   	<td class=" "><%=i2.getPrimerNombre()%></td>
							                                    <td class=" "><%=i2.getPrimerApellido()%></td>
							                                    <td class=" "><%=i2.getNombreC()%></td>
							                                    <td class=" "><%=i2.getNombreA()%></td>
							                                    <td class=" "><%=i2.getMotivo()%></td>
							                                    <td class=" "><%=i2.getFecha()%></td>
							                                    <td>
								                                    <button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalEditar">
								                                    	<i class="fa fa-folder"></i>Ver
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