<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="servlets.*,entidades.*,datos.*, negocio.*, java.util.*,
	java.util.Date,java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%
	//String email = "";
	int rol = 0;
	int idUsuario = 0;
	
	ArrayList <UsuarioGenerico> listadmin = new ArrayList <UsuarioGenerico>();
	listadmin = (ArrayList <UsuarioGenerico>) session.getAttribute("login");
	
	if(listadmin != null)
    {
		for (UsuarioGenerico user: listadmin)
		{
			//email = vsadmin.getCorreo();
			rol = user.getIdRol();
			idUsuario = user.getIdUsuario();
		}
		System.out.println("Rol en solicitar taller: " + rol + ", idUsuario: "+ idUsuario);
    }
	else
	{
 		response.sendRedirect("index.jsp");
 		return;
		
	}
	
	/*ArrayList <V_SS_Seg_RolOpciones> lvsro = new  ArrayList <V_SS_Seg_RolOpciones>();
	DT_SS_Rol_Opciones_Seguridad dsros = new DT_SS_Rol_Opciones_Seguridad();
	
	lvsro = dsros.rolOpciones(rol);
	HttpSession hts2 = request.getSession(true);
	hts2.setAttribute("listOpciones", lvsro);*/
	
%>

<%
	Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	String f_actual = format.format(date);
%>


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
							<h3>Solicitar Taller de Formación</h3><br>
						</div>
					</div>
					<div class="clearfix"></div>

					<div class="">

						<!-- Inicio del modal para agregar nuevo registro -->

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
									<h2>Solicitar taller de formación</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<br />
                                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" method="post" action="../../SLSolicitudTaller?opc=1">
										<%
											NGSolicitudTaller st = new NGSolicitudTaller();
											ArrayList<Taller> lista = new ArrayList<Taller>();
											lista = st.cargarTalleres();
										%>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Taller de formación: <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select id="taller" class="select2_single form-control col-md-7 col-xs-12 has-feedback-left" name="taller" required="required"  tabindex="-1">
													<option value="0">Seleccione..</option>
														<%
															for(Taller t : lista)
														  	{ 
														%>
													<option value="<%=t.getIdTaller() %>" ><%=t.getNombre()%></option>
														<%	
															}
														%>	
												</select>
												<span class="fa fa-list-ul form-control-feedback left" aria-hidden="true"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Horario propuesto <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <textarea id="horario" name="horario" rows="3" required="required" class="form-control col-md-7 col-xs-12"></textarea>
                                                <input type="hidden" id="idUsuario" name="idUsuario" value="<%=idUsuario%>">
                                                <input type="hidden" id="fecha" name="fecha" value="<%=f_actual%>">
                                                <!-- <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>-->
                                            </div>
                                        </div>
                                       
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <button type="submit" class="btn btn-primary">Cancelar</button>
                                                <button type="submit" class="btn btn-success">Enviar solicitud</button>
                                            </div>
                                        </div>

                                    </form>

								</div>
							</div>
						</div>


					</div>
					<div class="clearfix"></div>

				</div>
				<!-- /page content -->
			</div>
			<!-- footer content -->
				<jsp:include page="../footer.jsp" flush="true" />
			<!-- /footer content -->
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
<script src="../../js/custom.js"></script>

<!-- chart js -->
<script src="../../js/chartjs/chart.min.js"></script>
<!-- bootstrap progress js -->
<script src="../../js/progressbar/bootstrap-progressbar.min.js"></script>
<script src="../../js/nicescroll/jquery.nicescroll.min.js"></script>
<!-- icheck -->
<script src="../../js/icheck/icheck.min.js"></script>

<!-- PNotify -->
<script type="text/javascript" src="../../js/notify/pnotify.core.js"></script>
<script type="text/javascript" src="../../js/notify/pnotify.buttons.js"></script>
<script type="text/javascript" src="../../js/notify/pnotify.nonblock.js"></script>

<!-- Datatables -->

<script src="../../js/datatables/js/jquery.dataTables.js"></script>
<!-- <script src="../../js/datatables/js/jquery.js"></script> -->
<script src="../../js/datatables/src/DataTables.js"></script>
<script src="../../js/datatables/tools/js/dataTables.tableTools.js"></script>


<!-- avisos de CRUD -->
    	<%
    		String msj ="";
    		msj = request.getParameter("msj");
    		System.out.println(msj);
    	%>
        
        <script type="text/javascript">
    		function cargarNotify()
    		{
    			var mensaje = "<%=msj%>";
    			
    			if(mensaje=="1")
    			{
    				new PNotify({
    	                title: "Registro Guardado",
    	                type: "info",
    	                text: "El usuario fue almacenado exitosamente!!!",
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
    		                text: "El usuario se editó  exitosamente!!!",
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
    		                text: "El usuario se eliminó exitosamente!!!",
    		                nonblock: {
                                   nonblock: true,
                                   nonblock_opacity: .9}
    					}); 
    			}
    			 
    			 if(mensaje=="4")
     			{
     				 new PNotify({
     		                title: "Registro no Encontrado",
     		                type: "error",
     		                text: "Hubo un problema!!",
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
				$('table.display').dataTable(
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