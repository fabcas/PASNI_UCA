<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="servlets.*,entidades.*,datos.*, negocio.*, java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PASNI-UCA | Talleres de Formación</title>

<!-- Librerías -->

<link href="../../css/bootstrap.min.css" rel="stylesheet">

<link href="../../fonts/css/font-awesome.min.css" rel="stylesheet">
<link href="../../css/animate.min.css" rel="stylesheet">

<!-- Custom styling plus plugins -->
<link href="../../css/custom.css" rel="stylesheet">
<link href="../../css/icheck/flat/green.css" rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="../../css/progressbar/bootstrap-progressbar-3.3.0.css">
<script src="../../js/jquery.min.js"></script>
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
							<h3>Bandeja de Solicitudes</h3>
						</div>

						<div class="title_right">
							<div
								class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Search for..."> <span
										class="input-group-btn">
										<button class="btn btn-default" type="button">Go!</button>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>

					<div class="">

						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>Lista de solicitudes de talleres</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false"><i
												class="fa fa-wrench"></i></a>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Settings 1</a></li>
												<li><a href="#">Settings 2</a></li>
											</ul></li>
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">

									<div class="modal fade" id="modalAprobar" tabindex="-1"
										role="dialog" aria-hidden="true">
										<div class="modal-dialog modal-sm">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">x</span>
													</button>
													<h5 class="modal-title">
														<b>Aprobar Solicitud</b>
													</h5>
												</div>
												<div class="modal-body">

													<form class="form-horizontal form-label-left" name="form"
														method="post" action="../../SLSolicitudTaller?opc=1">
														<div class="item form-group">
															<div class="col-md-12 col-sm-12 col-xs-12">
																<input type="hidden" name="idSolicitudTaller"
																	id="idSolicitudTaller">
																<!-- <input type="text" name="nombre_TallerEliminado" id="nombre_TallerEliminado" disabled="disabled"> -->
																<p>¿Seguro que desea aprobar ésta solicitud?</p>
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default"
																data-dismiss="modal">Cancelar</button>
															<button type="submit" class="btn btn-primary">Aprobar</button>
														</div>
													</form>
												</div>

											</div>
										</div>
									</div>

									<div class="" role="tabpanel" data-example-id="togglable-tabs">
										<ul id="myTab1" class="nav nav-tabs bar_tabs left"
											role="tablist">
											<li role="presentation" class="active"><a
												href="#tab_content11" id="home-tabb" role="tab"
												data-toggle="tab" aria-controls="home" aria-expanded="true">Solicitudes
													pendientes</a></li>
											<li role="presentation" class=""><a
												href="#tab_content22" role="tab" id="profile-tabb"
												data-toggle="tab" aria-controls="profile"
												aria-expanded="false">Solicitudes aprobadas</a></li>
											<li role="presentation" class=""><a
												href="#tab_content33" role="tab" id="profile-tabb3"
												data-toggle="tab" aria-controls="profile"
												aria-expanded="false">Solicitudes desaprobadas</a></li>
										</ul>
										<div id="myTabContent2" class="tab-content">
											<div role="tabpanel" class="tab-pane fade active in"
												id="tab_content11" aria-labelledby="home-tab">

												<%
											
													NGSolicitudTaller neg = new NGSolicitudTaller();
													ArrayList<SolicitudTaller> lista = new ArrayList<SolicitudTaller>(); 
													lista = neg.cargarSolicitudesPendientes();
										
												%>
												<table id="table"
													class="table table-striped responsive-utilities jambo_table">
													<thead>
														<tr class="headings">
															<th><input type="checkbox" class="tableflat">
															</th>
															<th>Id Solicitud</th>
															<th>Profesor Guía</th>
															<th>Taller</th>
															<th>Fecha</th>
															<th>Estado</th>
															<th><span class="nobr">Acción</span></th>
														</tr>
													</thead>

													<tbody>

														<%
																			for(SolicitudTaller st: lista)
																			{
																		%>
														<tr class="even pointer">
															<td class="a-center "><input type="checkbox"
																class="tableflat"></td>
															<td class=""><%=st.getIdSolicitudTaller() %></td>
															<td class=""><%=st.getNombreProfesor() %></td>
															<td class=""><%=st.getNombreTaller() %></td>
															<td class=""><%=st.getFechaSolicitud() %></td>
															<td class=""><%=st.getCadenaEstado() %></td>
															<td>
																<button type="button" id="botonAprobar"
																	title="Aprobar solicitud"
																	class="btn btn-success btn-xs" data-toggle="modal"
																	data-target="#modalAprobar"
																	onclick="cargarDatos('<%= st.getIdSolicitudTaller() %>')">
																	<i class="fa fa-check-square-o"></i>
																</button>
															</td>
														</tr>

														<%
																			} 
																		%>

													</tbody>
												</table>


											</div>

											<div role="tabpanel" class="tab-pane fade" id="tab_content22"
												aria-labelledby="profile-tab">

												<%
											
													NGSolicitudTaller neg2 = new NGSolicitudTaller();
													ArrayList<SolicitudTaller> listaAprobados = new ArrayList<SolicitudTaller>(); 
													listaAprobados = neg2.cargarSolicitudesAprobadas();
										
												%>
												<table id="table"
													class="table table-striped responsive-utilities jambo_table">
													<thead>
														<tr class="headings">
															<th><input type="checkbox" class="tableflat">
															</th>
															<th>Id Solicitud</th>
															<th>Profesor Guía</th>
															<th>Taller</th>
															<th>Fecha</th>
															<th>Estado</th>
															<th><span class="nobr">Acción</span></th>
														</tr>
													</thead>

													<tbody>

														<%
																			for(SolicitudTaller st: listaAprobados)
																			{
																		%>
														<tr class="even pointer">
															<td class="a-center "><input type="checkbox"
																class="tableflat"></td>
															<td class=""><%=st.getIdSolicitudTaller() %></td>
															<td class=""><%=st.getNombreProfesor() %></td>
															<td class=""><%=st.getNombreTaller() %></td>
															<td class=""><%=st.getFechaSolicitud() %></td>
															<td class=""><%=st.getCadenaEstado() %></td>
															<td>
																<!-- <button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalEditar" onclick=""><i class="fa fa-check-square-o"></i></button> -->
															</td>
														</tr>

														<%
																			} 
																		%>

													</tbody>
												</table>

											</div>
											<div role="tabpanel" class="tab-pane fade" id="tab_content33"
												aria-labelledby="profile-tab">

												<%
											
													NGSolicitudTaller neg3 = new NGSolicitudTaller();
													ArrayList<SolicitudTaller> listaDesaprobados = new ArrayList<SolicitudTaller>(); 
													listaDesaprobados = neg3.cargarSolicitudesDesaprobadas();
										
												%>
												<table id="table"
													class="table table-striped responsive-utilities jambo_table">
													<thead>
														<tr class="headings">
															<th><input type="checkbox" class="tableflat">
															</th>
															<th>Id Solicitud</th>
															<th>Profesor Guía</th>
															<th>Taller</th>
															<th>Fecha</th>
															<th>Estado</th>
															<th><span class="nobr">Acción</span></th>
														</tr>
													</thead>

													<tbody>

														<%
																			for(SolicitudTaller st: listaDesaprobados)
																			{
																		%>
														<tr class="even pointer">
															<td class="a-center "><input type="checkbox"
																class="tableflat"></td>
															<td class=""><%=st.getIdSolicitudTaller() %></td>
															<td class=""><%=st.getNombreProfesor() %></td>
															<td class=""><%=st.getNombreTaller() %></td>
															<td class=""><%=st.getFechaSolicitud() %></td>
															<td class=""><%=st.getCadenaEstado() %></td>
															<td>
																<!-- <button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalEditar" onclick=""><i class="fa fa-check-square-o"></i></button> -->
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
			<ul class="list-unstyled notifications clearfix"
				data-tabbed_notifications="notif-group">
			</ul>
			<div class="clearfix"></div>
			<div id="notif-group" class="tabbed_notifications"></div>
		</div>

	</div>

</body>

<script src="../../js/bootstrap.min.js"></script>

<!-- chart js -->
<script src="../../js/chartjs/chart.min.js"></script>
<!-- bootstrap progress js -->
<script src="../../js/progressbar/bootstrap-progressbar.min.js"></script>
<script src="../../js/nicescroll/jquery.nicescroll.min.js"></script>
<!-- icheck -->
<script src="../../js/icheck/icheck.min.js"></script>

<script src="../../js/custom.js"></script>

<!-- Datatables -->
<script src="../../js/datatables/js/jquery.js"></script>
<script src="../../js/datatables/js/jquery.dataTables.js"></script>
<script src="../../js/datatables/tools/js/dataTables.tableTools.js"></script>
<script
	src="../../js/pluging-datatable/jquery.dataTables.columnFilter.js"></script>
<!-- END Datatables -->

<!-- PNotify -->
<script type="text/javascript" src="../../js/notify/pnotify.core.js"></script>
<script type="text/javascript" src="../../js/notify/pnotify.buttons.js"></script>
<script type="text/javascript" src="../../js/notify/pnotify.nonblock.js"></script>
<!-- End PNotify -->

<!-- Capturar los valores de la fila -->

<script type="text/javascript">
		
        	function cargarDatos(id){
				
        		$("#idSolicitudTaller").val(id);
				
			}
        	
        </script>

<!-- Fin de capturar valores de la fila -->

<!-- avisos de CRUD -->
<%
    		String msj ="";
    		msj = request.getParameter("msj");
    	
    	%>

<script type="text/javascript">
    		function cargarNotify()
    		{
    			var mensaje = "<%=msj%>";
    			
    			if(mensaje == "1")
    			{
    				new PNotify({
    	                title: "Registro aprobado",
    	                type: "info",
    	                text: "La solicitud ha sido aprobada exitosamente.",
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
    		                text: "El taller se editó  exitosamente!!!",
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
    		                text: "El taller se elimino exitosamente!!!",
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
				
				$('#table').dataTable(
						{
							// "dom": 'T<"clear">lfrtip',
				            //"tableTools": {
				             //   "sSwfPath": "../../js/datatables/tools/swf/copy_csv_xls_pdf.swf",
				             //   "aButtons": ["pdf", "xls"]
				            //},
							
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

<script>
         $(function() {
            $("#botonAprobar").tooltip();
         });
      </script>
</html>