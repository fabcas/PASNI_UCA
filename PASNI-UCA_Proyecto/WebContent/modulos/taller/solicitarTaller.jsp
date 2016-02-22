<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="servlets.*,entidades.*,datos.*, negocio.*, java.util.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>PASNI-UCA | Talleres de Formación</title>

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
<link href="../../css/select/select2.min.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../../js/folder/table.js"></script>
<!--[if lt IE 9]>
        <script src="../assets/js/ie8-responsive-file-warning.js"></script>
        <![endif]-->

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

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
							<h3>Solicitar Taller de Formación</h3>
						</div>

						<div class="title_right">
							<div
								class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Buscar..."> <span
										class="input-group-btn">
										<button class="btn btn-default" type="button">ir!</button>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>

					<div class="">

						<!-- Inicio del modal para agregar nuevo registro -->

						<!-- button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Guardar</button> -->

						<div class="modal fade bs-example-modal-lg" tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">

									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">x</span>
										</button>
										<h5 class="modal-title">Agregar Taller de Reforzamiento</h5>
									</div>
									<div class="modal-body">
										<h4>Complete los campos</h4>
										<form class="form-horizontal form-label-left" name="form"
											method="post" action="../../SLTaller?opc=1">
											<div class="item form-group">
												<%
																	NGTaller negC1 = new NGTaller();
																	ArrayList<Cuatrimestre> arrayLC1 = new ArrayList<Cuatrimestre>();
																	arrayLC1 = negC1.comboCuatrimestre();
															%>
												<br>
												<label>Cuatrimestre:</label> <select id="cuatri"
													name="cuatri" required="required"
													class="select2_single form-control">
													<option>Seleccione...</option>
													<%for(Cuatrimestre entiC1 : arrayLC1)
																		  { 
																		%>
													<option value="<%=entiC1.getIdCuatrimestre() %>"><%=entiC1.getNombre()%></option>
													<%}%>
												</select>
												<!--<input type="number" id="cuatri" name="cuatri" required="required" class="form-control" placeholder="">-->
												<label>Nombre:</label> <input id="nombre" name="nombre"
													required="required" class="form-control" placeholder="">
												<label>Descripción:</label>
												<textarea id="descripcion" name="descripcion"
													required="required" class="form-control" placeholder=""></textarea>
												<label>Fecha inicio:</label> <input type="date"
													id="fechaini" name="fechaini" required="required"
													class="form-control" placeholder=""> <label>Fecha
													final:</label> <input type="date" id="fechafin" name="fechafin"
													required="required" class="form-control" placeholder="">
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Cancelar</button>
												<button type="submit" class="btn btn-primary">Guardar</button>
											</div>
										</form>
									</div>

								</div>
							</div>
						</div>

						<!-- Final del modal para guardar nuevo registro -->


						<!-- Final del modal para guardar nuevo registro -->

						<!-- Inicio del modal para editar registro -->



						<div class="modal fade modalEditar" tabindex="-1" role="dialog"
							aria-hidden="true">
							<div class="modal-dialog ">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">x</span>
										</button>
										<h5 class="modal-title">Editar Taller de Reforzamiento</h5>
									</div>
									<div class="modal-body">
										<h4>Complete los campos</h4>
										<form class="form-horizontal form-label-left" name="form"
											method="post" action="../../SLTaller?opc=2">
											<div class="item form-group">
												<%
																	NGTaller negt = new NGTaller();
																	ArrayList<Cuatrimestre> arrayt = new ArrayList<Cuatrimestre>();
																	arrayt = negt.comboCuatrimestre();
																%>
												<label>Cuatrimestre:</label> <select id="cuatri"
													name="cuatri" required="required" class="form-control">
													<option>Seleccione...</option>
													<%for(Cuatrimestre negtw : arrayt)
																		  { 
																		%>
													<option value="<%=negtw.getIdCuatrimestre() %>"><%=negtw.getNombre()%></option>
													<%}%>
												</select>
												<!--<input type="number" id="cuatri" name="cuatri" required="required" class="form-control" placeholder="">-->
												<label>Nombre:</label> <input id="nombre" name="nombre"
													required="required" class="form-control" placeholder="">
												<label>Descripción:</label> <input id="descripcion"
													name="descripcion" required="required" class="form-control"
													placeholder=""> <label>Fecha inicio:</label> <input
													type="date" id="fechaini" name="fechaini"
													required="required" class="form-control" placeholder="">
												<label>Fecha final:</label> <input type="date" id="fechafin"
													name="fechafin" required="required" class="form-control"
													placeholder="">
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Cancelar</button>
												<button type="submit" class="btn btn-primary">Guardar</button>
											</div>
										</form>
									</div>

								</div>
							</div>
						</div>

						<!-- Fin del modal de editar  -->


						<!-- Inicio del modal para eliminar registro -->


						<div class="modal fade" id="modalEliminar" tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-sm">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">x—</span>
										</button>
										<h5 class="modal-title">Eliminar Taller de Reforzamiento</h5>
									</div>
									<div class="modal-body">

										<form class="form-horizontal form-label-left" name="form"
											method="post" action="../../SLTaller?opc=3">
											<div class="item form-group">
												<div class="col-md-12 col-sm-12 col-xs-12">
													<input type="hidden" name="idTallerEliminar"
														id="idTallerEliminar">
													<p>¿Seguro que desea eliminar este taller?</p>
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

						<!-- Fin del modal de eliminar  -->

						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>Catálogo de Taller</h2>
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
									<button type="button" class="btn btn-primary"
										data-toggle="modal" data-target=".bs-example-modal-lg">Nueva
										solicitud</button><br><br>
									<%
											
											NGTaller neg = new NGTaller();
											ArrayList<Taller> arrayL = new ArrayList<Taller>(); 
											arrayL = neg.cargarTalleres();
										
							%>
									<table id="table"
										class="table table-striped responsive-utilities jambo_table display">
										<thead>
											<tr class="headings">
												<th><input type="checkbox" class="tableflat"></th>
												<th>Id Taller</th>
												<th>Cuatrimestre</th>
												<th>Nombre</th>
												<th>Descripción</th>
												<th>Fecha Inicio</th>
												<th>Fecha Fin</th>
												<th><span class="nobr">Acción</span></th>
											</tr>
										</thead>

										<tbody>

											<%
													for(Taller enti: arrayL)
													{
												%>
											<tr class="even pointer">
												<td class="a-center "><input type="checkbox"
													class="tableflat"></td>
												<td class=""><%=enti.getIdTaller() %></td>
												<td class=""><%=enti.getNombreCuatrimestre() %></td>
												<td class=""><%=enti.getNombre() %></td>
												<td class=""><%=enti.getDescripcion() %></td>
												<td class=""><%=enti.getFechaInicio() %></td>
												<td class=""><%=enti.getFechaFinal()%></td>
												<td>
													<button type="button" class="btn btn-success btn-xs"
														data-toggle="modal" data-target=".modalEditar">
														<i class="fa fa-pencil"></i>
													</button>
													<button type="button" class="btn btn-danger btn-xs"
														data-toggle="modal" data-target="#modalEliminar">
														<i class="fa fa-trash-o"></i>
													</button>
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

<!-- PNotify -->
<script type="text/javascript" src="../../js/notify/pnotify.core.js"></script>
<script type="text/javascript" src="../../js/notify/pnotify.buttons.js"></script>
<script type="text/javascript" src="../../js/notify/pnotify.nonblock.js"></script>

<!-- Datatables -->

<script src="../../js/datatables/js/jquery.dataTables.js"></script>
<!-- <script src="../../js/datatables/js/jquery.js"></script> -->
<script src="../../js/datatables/src/DataTables.js"></script>
<script src="../../js/datatables/tools/js/dataTables.tableTools.js"></script>

<script type="text/javascript">

			$(document).ready(function()
			{
				cargarNotify();
				$('#table').dataTable(
						{
							// "dom": 'T<"clear">lfrtip',
				           // "tableTools": {
				            //    "sSwfPath": "js/datatables/tools/swf/copy_csv_xls_pdf.swf",
				             //   "aButtons": ["pdf", "xls"]
				            //}
							
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


<script src="../../js/select/select2.full.js"></script>
<script>
        	
        $(document).ready(function () {
            cargarNotify();
                $(".select2_single").select2({
                    placeholder: "Seleccione un cuatrimestre",
                    allowClear: true,
                    language: "es"
                });
        });
        
        </script>

</html>