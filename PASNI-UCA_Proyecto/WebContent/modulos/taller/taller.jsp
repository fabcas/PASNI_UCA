<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="servlets.*,entidades.*,datos.*, negocio.*, java.util.*"%>

<!DOCTYPE html>
<html lang="en">
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", -1);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>PASNI-UCA | Taller de Formación</title>

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
<!-- select2 -->
<link href="../../css/select/select2.min.css" rel="stylesheet">

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
							<h3>Taller de Formación</h3>
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
										<h5 class="modal-title">
											<b>Agregar Taller de Reforzamiento</b>
										</h5>
									</div>
									<div class="modal-body">
										<h4>
											<b>Complete los campos</b>
										</h4>
										<form class="form-horizontal form-label-left" name="form" method="post" action="../../SLTaller?opc=1">
											<div class="item form-group">
															<%
																	NGTaller tallerNegocio = new NGTaller();
																	ArrayList<Cuatrimestre> listaCuatrimestre = new ArrayList<Cuatrimestre>();
																	listaCuatrimestre = tallerNegocio.comboCuatrimestre();
															%>
												<br>
												<br>
												<label>Cuatrimestre:</label> <select id="cuatri"
													class="select2_single form-control" name="cuatri"
													required="required" tabindex="-1">
													<option value="0">Seleccione..</option>
													<%
																			for(Cuatrimestre cuatri : listaCuatrimestre)
																		  	{ 
																				%>
																				<option value="<%=cuatri.getIdCuatrimestre() %>"><%=cuatri.getNombre()%></option>
													<%	
																			}
																				%>
												</select>
												
												<%
															NGCategoriaTaller negt2 = new NGCategoriaTaller();
															ArrayList<CategoriaTaller> arrayc = new ArrayList<CategoriaTaller>();
															arrayc = negt2.cargarCategorias();
												%>
												<label>Categoría:</label> 
												<select
													class="select2_single form-control"
													id="categoria" name="categoria"
													required="required" tabindex="-1">
													<option>Seleccione...</option>
													<%for(CategoriaTaller negtw : arrayc)
													  { 
													%>
													<option value="<%=negtw.getIdCategoria() %>"><%=negtw.getNombre()%></option>
													<%}%>
												</select>
												<!--<input type="number" id="cuatri" name="cuatri" required="required" class="form-control" placeholder="">-->
												<br>
												<label>Nombre:</label> <input id="nombre" name="nombre"
													required="required" class="form-control" placeholder="">
												<br>
												<label>Descripción:</label>
												<textarea id="descripcion" name="descripcion"
													required="required" class="form-control" placeholder=""></textarea>
												<!-- <input type="text" class="form-control has-feedback-left" id="single_cal4" placeholder="Fecha de inicio" aria-describedby="inputSuccess2Status4"> -->
												<!-- <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span> -->
												<!-- <span id="inputSuccess2Status4" class="sr-only">(success)</span> -->
												<br>
												<label>Fecha inicio:</label> <input type="date"
													id="fechaini" name="fechaini" required="required"
													class="form-control" placeholder=""> <br>
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
										<h5 class="modal-title">
											<b>Editar Taller de Reforzamiento</b>
										</h5>
									</div>
									<div class="modal-body">
										<h4>
											<b>Complete los campos</b>
										</h4>
										<form class="form-horizontal form-label-left" name="form"
											method="post" action="../../SLTaller?opc=2">
											<div class="item form-group">
												<%
															NGTaller negt = new NGTaller();
															ArrayList<Cuatrimestre> arrayt = new ArrayList<Cuatrimestre>();
															arrayt = negt.comboCuatrimestre();
												%>
												<br>
												<br> <label>Código del Taller: </label> <input
													class="form-control" id="IdTaller" name="IdTaller"
													disabled="disabled"> <input class="form-control"
													type="hidden" id="IdTallerEditar" name="IdTallerEditar">
												<label>Cuatrimestre:</label> <select
													class="select2_single form-control"
													id="cuatri_TallerEditado" name="cuatri_TallerEditado"
													required="required" tabindex="-1">
													<option>Seleccione...</option>
													<%for(Cuatrimestre negtw : arrayt)
													  { 
													%>
													<option value="<%=negtw.getIdCuatrimestre() %>"><%=negtw.getNombre()%></option>
													<%}%>
												</select>
												<%
															NGCategoriaTaller neg = new NGCategoriaTaller();
															ArrayList<CategoriaTaller> array = new ArrayList<CategoriaTaller>();
															array = neg.cargarCategorias();
												%>
												<label>Categoría:</label> 
												<select
													class="select2_single form-control"
													id="categoria_Editado" name="categoria_Editado"
													required="required" tabindex="-1">
													<option>Seleccione...</option>
													<%for(CategoriaTaller ct : array)
													  { 
													%>
													<option value="<%=ct.getIdCategoria() %>"><%=ct.getNombre()%></option>
													<%}%>
												</select>
												<!--<input type="number" id="cuatri" name="cuatri" required="required" class="form-control" placeholder="">-->
												<label>Nombre:</label> <input id="nombre_TallerEditado"
													name="nombre_TallerEditado" required="required"
													class="form-control" placeholder=""> <label>Descripción:</label>
												<textarea id="descripcion_TallerEditado"
													name="descripcion_TallerEditado" required="required"
													class="form-control" placeholder=""></textarea>
												<label>Fecha inicio:</label> <input type="date"
													id="fechaini_TallerEditado" name="fechaini_TallerEditado"
													required="required" class="form-control" placeholder="">
												<label>Fecha final:</label> <input type="date"
													id="fechafin_TallerEditado" name="fechafin_TallerEditado"
													required="required" class="form-control" placeholder="">
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Cancelar</button>
												<button type="submit" class="btn btn-primary">Guardar
													cambios</button>
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
											<span aria-hidden="true">x</span>
										</button>
										<h5 class="modal-title">
											<b>Eliminar Taller de Reforzamiento</b>
										</h5>
									</div>
									<div class="modal-body">

										<form class="form-horizontal form-label-left" name="form"
											method="post" action="../../SLTaller?opc=3">
											<div class="item form-group">
												<div class="col-md-12 col-sm-12 col-xs-12">
													<input type="hidden" name="idTallerEliminar"
														id="idTallerEliminar">
													<!-- <input type="text" name="nombre_TallerEliminado" id="nombre_TallerEliminado" disabled="disabled"> -->
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
									<h2>Lista de Taller de Formación</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<button type="button" id="botonNuevo" title="Nuevo registro"
										class="btn btn-primary" data-toggle="modal"
										data-target=".bs-example-modal-lg">Ingresar nuevo
										taller</button><br><br>

									<%
											
											NGTaller negtt = new NGTaller();
											ArrayList<Taller> lista = new ArrayList<Taller>(); 
											lista = negtt.cargarTalleres();
										
							%>
									<table id="table"
										class="table table-striped responsive-utilities jambo_table">
										<thead>
											<tr class="headings">
												<th><input type="checkbox" class="tableflat"></th>
												<th>Id Taller</th>
												<th>Cuatrimestre</th>
												<th>Categoría</th>
												<th>Nombre</th>
												<th>Descripción</th>
												<th>Fecha Inicio</th>
												<th>Fecha Fin</th>
												<th><span class="nobr">Acción</span></th>
											</tr>
										</thead>

										<tbody>

											<%
													for(Taller t: lista)
													{
												%>
											<tr class="even pointer">
												<td class="a-center "><input type="checkbox"
													class="tableflat"></td>
												<td class=""><%=t.getIdTaller() %></td>
												<td class=""><%=t.getNombreCuatrimestre() %></td>
												<td class=""><%=t.getNombreCategoria() %></td>
												<td class=""><%=t.getNombre() %></td>
												<td class=""><%=t.getDescripcion() %></td>
												<td class=""><%=t.getFechaInicio() %></td>
												<td class=""><%=t.getFechaFinal()%></td>
												<td>
													<button type="button" id="botonModificar"
														title="Modificar registro" class="btn btn-success btn-xs"
														data-toggle="modal" data-target=".modalEditar"
														onclick="cargarDatos('<%=t.getIdTaller()%>', '<%=t.getIdCuatrimestre()%>', '<%=t.getIdCategoria() %>', '<%=t.getNombre()%>','<%=t.getDescripcion()%>','<%=t.getFechaInicio()%>','<%=t.getFechaFinal()%>');">
														<i class="fa fa-pencil"></i>
													</button>
													<button type="button" id="botonEliminar"
														title="Eliminar registro" class="btn btn-danger btn-xs"
														data-toggle="modal" data-target="#modalEliminar"
														onclick="cargarDatos('<%=t.getIdTaller()%>', '<%=t.getIdCuatrimestre()%>', '<%=t.getIdCategoria() %>', '<%=t.getNombre()%>','<%=t.getDescripcion()%>','<%=t.getFechaInicio()%>','<%=t.getFechaFinal()%>');">
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

<!-- Datatables -->

<script src="../../js/datatables/js/jquery.js"></script>
<script src="../../js/datatables/js/jquery.dataTables.js"></script>
<script src="../../js/datatables/tools/js/dataTables.tableTools.js"></script>
<script
	src="../../js/pluging-datatable/jquery.dataTables.columnFilter.js"></script>
<!-- Fin Datatables -->

<!-- PNotify -->
<script type="text/javascript" src="../../js/notify/pnotify.core.js"></script>
<script type="text/javascript" src="../../js/notify/pnotify.buttons.js"></script>
<script type="text/javascript" src="../../js/notify/pnotify.nonblock.js"></script>
<!-- Fin PNotify -->

<!-- Datepicker -->
<script type="text/javascript"
	src="../../js/datepicker/daterangepicker.js"></script>

<!-- Select2 -->
<script src="../../js/select/select2.full.js"></script>
<!-- Fin Select2 -->

<!-- Cargar datos -->
<script type="text/javascript">
		
        	function cargarDatos(id, idc, idcat, nombre, descripcion, fechaini, fechafin){
				
        		$("#IdTaller").val(id);
				$("#IdTallerEditar").val(id);
				$("#idTallerEliminar").val(id);
				$("#cuatri_TallerEditado").val(idc);
				$("#categoria_Editado").val(idcat);
				$("#nombre_TallerEditado").val(nombre);
				$("#nombre_TallerEliminado").val(nombre);
				$("#descripcion_TallerEditado").val(descripcion);
				$("#fechaini_TallerEditado").val(fechaini);
				$("#fechafin_TallerEditado").val(fechafin);
				
		}
        	
        	function cargarIdEliminar(id)
        	{
        		$("#IdTaller").val(id);
        		$("#idTallerEliminar").val(id);
        	}
	</script>

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
    	                text: "El taller fue almacenado exitosamente!!!",
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
				cargarNotify();
				$('#table').dataTable(
						{
							// "dom": 'T<"clear">lfrtip',
				            //"tableTools": {
				             //   "sSwfPath": "js/datatables/tools/swf/copy_csv_xls_pdf.swf",
				              //  "aButtons": ["pdf", "xls"]
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
		
        $(document).ready(function () {
        	cargarNotify();
        	cargarNotify();
            $(".select2_single").select2({
                placeholder: "Seleccione un cuatrimestre",
                allowClear: true
            })
        });
        </script>

<script>
         $(function() {
        	$("#botonNuevo").tooltip();
            $("#botonModificar").tooltip();
            $("#botonEliminar").tooltip();
         });
      </script>
</html>