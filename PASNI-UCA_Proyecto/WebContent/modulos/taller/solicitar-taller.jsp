<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="servlets.*,entidades.*,datos.*, negocio.*, java.util.*,
	java.util.Date,java.text.SimpleDateFormat"

%>

<!DOCTYPE html>
<html lang="en">

<%

	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", -1);

%>

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
 		response.sendRedirect("../../index.jsp");
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
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Taller de formación #1: <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select id="taller1" class="form-control col-md-7 col-xs-12 has-feedback-left" name="taller1" required="required"  tabindex="-1">
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
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Taller de formación #2: <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select id="taller2" class="form-control col-md-7 col-xs-12 has-feedback-left" name="taller2" required="required"  tabindex="-1">
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
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Taller de formación #3: <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select id="taller3" class="form-control col-md-7 col-xs-12 has-feedback-left" name="taller3" required="required"  tabindex="-1">
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
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Día propuesto: <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="date" id="diapropuesto" name="diapropuesto" class="form-control">
												<!-- <span class="fa fa-list-ul form-control-feedback left" aria-hidden="true"></span> -->
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">Horario propuesto <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                            <%
												NGSolicitudTaller st2 = new NGSolicitudTaller();
												ArrayList<HorarioTaller> lista2 = new ArrayList<HorarioTaller>();
												lista2 = st2.cargarComboHorarios();
											%>
                                                <select id="horario" name="horario" class="form-control col-md-7 col-xs-12 has-feedback-left">
													<option value="0">Seleccione..</option>
														<%
															for(HorarioTaller ht : lista2)
														  	{ 
														%>
													<option value="<%=ht.getIdHorarioTaller() %>" ><%=ht.getHoraInicioFin()%></option>
														<%	
															}
														%>	
                                                </select>
                                                <span class="fa fa-list-ul form-control-feedback left" aria-hidden="true"></span>
                                                <input type="hidden" id="idUsuario" name="idUsuario" value="<%=idUsuario%>">
                                                <input type="hidden" id="fecha" name="fecha" value="<%=f_actual%>">
                                                <!-- <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>-->
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
	                                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">Cantidad de estudiantes <span class="required">*</span></label>
	                                        	<div class="col-md-6 col-sm-6 col-xs-12">        
	                                                <input class="form-control" type="text" id="cantidadEstudiantes" name="cantidadEstudiantes">
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
							 "dom": 'T<"clear">lfrtip',
				            "tableTools": {
				                "sSwfPath": "../../js/datatables/tools/swf/copy_csv_xls_pdf.swf",
				                "aButtons": ["pdf", "xls"]
				        },
							
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