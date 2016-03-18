<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="servlets.*,entidades.*,datos.*, negocio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PASNI-UCA | Categoría Taller Formación</title>

<!-- Librerías -->

<link href="../../css/bootstrap.min.css" rel="stylesheet">

<link href="../../fonts/css/font-awesome.min.css" rel="stylesheet">
<link href="../../css/animate.min.css" rel="stylesheet">
<script src="../../js/jquery.min.js"></script>

<!-- Custom styling plus plugins -->
<link href="../../css/custom.css" rel="stylesheet">
<link href="../../css/icheck/flat/green.css" rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="../../css/progressbar/bootstrap-progressbar-3.3.0.css">

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
							<h3>Taller de Formación</h3>
						</div>
					</div>
					<div class="clearfix"></div>

					<div class="">



						<!-- Inicio del modal para agregar nuevo registro -->

						<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Nueva categoría</button> -->

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
											<b>Agregar Categoría</b>
										</h5>
									</div>
									<div class="modal-body">
										<h4>
											<b>Complete los campos</b>
										</h4>
										<form class="form-horizontal form-label-left" name="form"
											method="post" action="../../SLCategoriaTaller?opc=1">
											<div class="item form-group">
												<br>
												<label>Nombre:</label> <input id="nombre" name="nombre"
													required="required" class="form-control"
													placeholder="Nombre"> <br>
												<label>Descripción:</label>
												<textarea id="descripcion" rows="5" name="descripcion"
													required="required" class="form-control"
													placeholder="Descripción"></textarea>
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
											<b>Editar Categoría</b>
										</h5>
									</div>
									<div class="modal-body">
										<h4>
											<b>Complete los campos</b>
										</h4>
										<form class="form-horizontal form-label-left" name="form"
											method="post" action="../../SLCategoriaTaller?opc=2">
											<div class="item form-group">
												<br>
												<br> <label>Código de la categoría: </label> <input
													class="form-control" id="IdCategoria" name="IdCategoria"
													disabled="disabled"> <input class="form-control"
													type="hidden" id="IdCategoriaEditar"
													name="IdCategoriaEditar"> <label>Nombre:</label> <input
													id="nombre_CategoriaEditado" name="nombre_CategoriaEditado"
													required="required" class="form-control" placeholder="">
												<label>Descripción:</label>
												<textarea id="descripcion_CategoriaEditado"
													name="descripcion_CategoriaEditado" rows="5"
													required="required" class="form-control" placeholder=""></textarea>
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
											<b>Eliminar Categoría</b>
										</h5>
									</div>
									<div class="modal-body">

										<form class="form-horizontal form-label-left" name="form"
											method="post" action="../../SLCategoriaTaller?opc=3">
											<div class="item form-group">
												<div class="col-md-12 col-sm-12 col-xs-12">
													<input type="hidden" name="IdCategoriaEliminar"
														id="IdCategoriaEliminar">
													<!-- <input type="text" name="nombre_TallerEliminado" id="nombre_TallerEliminado" disabled="disabled"> -->
													<p>¿Seguro que desea eliminar esta categoría?</p>
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
									<h2>Catálogo de Categoría</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<button type="button" id="botonNuevo" title="Nuevo registro"
										class="btn btn-primary" data-toggle="modal"
										data-target=".bs-example-modal-lg">Ingresar nueva
										categoría</button>
										<br><br>
									<%
											
											NGCategoriaTaller neg = new NGCategoriaTaller();
											ArrayList<CategoriaTaller> lista = new ArrayList<CategoriaTaller>(); 
											lista = neg.cargarCategorias();
										
										%>
									<table id="table"
										class="table table-striped responsive-utilities jambo_table">
										<thead>
											<tr class="headings">
												<th><input type="checkbox" class="tableflat"></th>
												<th>Id Categoría</th>
												<th>Nombre</th>
												<th>Descripción</th>
												<th><span class="nobr">Acción</span></th>
											</tr>
										</thead>

										<tbody>

											<%
													for(CategoriaTaller ct: lista)
													{
												%>
											<tr class="even pointer">
												<td class="a-center "><input type="checkbox"
													class="tableflat"></td>
												<td class=""><%=ct.getIdCategoria() %></td>
												<td class=""><%=ct.getNombre() %></td>
												<td class=""><%=ct.getDescripcion() %></td>
												<td>
													<button type="button" id="botonModificar"
														title="Modificar registro" class="btn btn-success btn-xs"
														data-toggle="modal" data-target=".modalEditar"
														onclick="cargarDatos('<%=ct.getIdCategoria() %>', '<%=ct.getNombre() %>', '<%=ct.getDescripcion() %>')">
														<i class="fa fa-pencil"></i>
													</button>
													<button type="button" id="botonEliminar"
														title="Eliminar registro" class="btn btn-danger btn-xs"
														data-toggle="modal" data-target="#modalEliminar"
														onclick="cargarDatos('<%=ct.getIdCategoria() %>', '<%=ct.getNombre() %>', '<%=ct.getDescripcion() %>')">
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
					

				</div>
				<!-- /page content -->
			</div>

			<div class="clearfix"></div>
	
			<jsp:include page="../footer.jsp" flush="true" /><!-- /footer content -->
		
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

<script>
    	
    	function cargarDatos(id, nombre, descripcion)
    	{
    		$("#IdCategoria").val(id);
    		$("#IdCategoriaEditar").val(id);
    		$("#IdCategoriaEliminar").val(id);
    		$("#nombre").val(nombre);
    		$("#nombre_CategoriaEditado").val(nombre);
    		$("#descripcion").val(descripcion);
    		$("#descripcion_CategoriaEditado").val(descripcion);
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
				
				$('#table').dataTable(
						{
							// "dom": 'T<"clear">lfrtip',
				            //"tableTools": {
				            //    "sSwfPath": "../../js/datatables/tools/swf/copy_csv_xls_pdf.swf",
				            //    "aButtons": ["pdf", "xls"]
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
        	$("#botonNuevo").tooltip();
            $("#botonModificar").tooltip();
            $("#botonEliminar").tooltip();
         });
      </script>

</html>