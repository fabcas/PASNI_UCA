<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "servlets.*,entidades.*,datos.*, negocio.*, java.util.*"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", -1);
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PASNI-UCA | Roles</title>

<!-- Librerías -->

<link href="css/bootstrap.min.css" rel="stylesheet">

<link href="fonts/css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">

<!-- Custom styling plus plugins -->
<link href="css/custom.css" rel="stylesheet">
<link href="css/icheck/flat/green.css" rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="css/progressbar/bootstrap-progressbar-3.3.0.css">
<script src="js/jquery.min.js"></script>
<!-- Fin de las librerías -->

</head>
<body class="nav-md">

    <div class="container body">
    
        <div class="main_container">
        
        <jsp:include page="menu.jsp" flush="true" />

            <!-- page content -->
            <div class="right_col" role="main">

                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3>Administración</h3>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="">
                       <!-- Inicio del modal para agregar nuevo registro -->
											
									<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Nueva categoría</button> --> 
		
		                                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
		                                    <div class="modal-dialog">
		                                        <div class="modal-content">
		
		                                            <div class="modal-header">
		                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span>
		                                                </button>
		                                                <h5 class="modal-title"><b>Agregar Rol</b></h5>
		                                            </div>
		                                            <div class="modal-body">
		                                                <h4><b>Complete los campos</b></h4>
		                                                <form class="form-horizontal form-label-left" name="form" method="post" action="./SLRol?opc=1">
		                                                	<div class="item form-group">
																<br><label>Nombre:</label> 
																<input id="nombre" name="nombre" required="required" class="form-control" placeholder="Nombre">
																<br><label>Descripción:</label> 
																<textarea id="descripcion" rows="3" name="descripcion" required="required" class="form-control" placeholder="Descripción"></textarea>
															</div>
															<div class="m-footer">
			                                                	<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
			                                                	<button type="submit" class="btn btn-primary">Guardar</button>
		                                           			</div>
		                                                </form>
		                                            </div>
		                                            
		                                        </div>
		                                    </div>
		                                </div>
										
										<!-- Final del modal para guardar nuevo registro -->
										
										
											<!-- Inicio del modal para editar registro -->
										
		                                <div class="modal fade modalEditar" tabindex="-1" role="dialog" aria-hidden="true">
		                                    <div class="modal-dialog ">
		                                        <div class="modal-content">
		                                            <div class="modal-header">
		                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span>
		                                                </button>
		                                                <h5 class="modal-title"><b>Editar Rol</b></h5>
		                                            </div>
		                                            <div class="modal-body">
		                                                <h4><b>Complete los campos</b></h4>
		                                                <form class="form-horizontal form-label-left" name="form" method="post" action="./SLRol?opc=2">
		                                                	<div class="item form-group">
		                                                		<br><br>
																<label>Id del Rol: </label>
																<input class="form-control" id="IdRol" name="IdRol" disabled="disabled">
																<input class="form-control" type="hidden" id="IdRolEditar" name="IdRolEditar">
																<label>Nombre:</label> 
																<input id="nombre_RolEditado" name="nombre_RolEditado" required="required" class="form-control" placeholder="">
																<label>Descripción:</label> 
																<textarea id="descripcion_RolEditado" name="descripcion_RolEditado" rows="4" required="required" class="form-control" placeholder=""></textarea>
															</div>
															<div class="m-footer">
			                                                	<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
			                                                	<button type="submit" class="btn btn-primary">Guardar cambios</button>
		                                           			 </div>
		                                                </form>
		                                            </div>
		                                            
		                                        </div>
		                                    </div>
		                                </div>
		                                
		                                <!-- Fin del modal de editar  -->
		                                
		                                
		                                <!-- Inicio del modal para eliminar registro -->
											
		
		                                <div class="modal fade" id="modalEliminar" tabindex="-1" role="dialog" aria-hidden="true">
		                                    <div class="modal-dialog modal-sm">
		                                        <div class="modal-content">
		                                            <div class="modal-header">
		                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span>
		                                                </button>
		                                                <h5 class="modal-title"><b>Eliminar Rol</b></h5>
		                                            </div>
		                                            <div class="modal-body">
		                                               
		                                                <form class="form-horizontal form-label-left" name="form" method="post" action="./SLRol?opc=3">
		                                                	<div class="item form-group">
		                                                		<div class="col-md-12 col-sm-12 col-xs-12">
																	<input type="hidden" name="IdRolEliminar" id="IdRolEliminar">
																	<!-- <input type="text" name="nombre_TallerEliminado" id="nombre_TallerEliminado" disabled="disabled"> -->
																	<p>¿Seguro que desea eliminar este rol?</p>
																</div>
															</div>
															<div class="m-footer">
			                                                	<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
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
                                <h2>Catálogo de Roles</h2>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
								<button type="button" id="botonNuevo" title="Nuevo registro" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Ingresar nuevo rol</button>
								<br>		
										<%
											
											NGRol neg = new NGRol();
											ArrayList<Rol> lista = new ArrayList<Rol>(); 
											lista = neg.cargarRoles();
										
										%>
							<br>
							<table id="" class="display table table-striped responsive-utilities jambo_table">
                                        <thead>
                                            <tr class="headings">
                                                <th>
                                                    <input type="checkbox" class="tableflat">
                                                </th>
                                                <th>Id Rol </th>
                                                <th>Nombre </th>
                                                <th>Descripción </th>
                                                <th><span class="nobr">Acción</span></th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                        
                                        <%
													for(Rol r: lista)
													{
												%>
                                            		<tr class="even pointer">
                                                		<td class="a-center ">
                                                    		<input type="checkbox" class="tableflat">
                                                		</td>
			                                                <td class=""><%=r.getIdRol() %></td>
			                                                <td class=""><%=r.getNombre() %></td>
			                                                <td class=""><%=r.getDescripcion() %>
		                                                </td>
		                                                <td> 
		                                                    <button type="button" id="botonModificar" title="Modificar registro" class="btn btn-success btn-xs" data-toggle="modal" data-target=".modalEditar" onclick="cargarDatos('<%=r.getIdRol() %>', '<%=r.getNombre() %>', '<%=r.getDescripcion() %>')"><i class="fa fa-pencil"></i></button>
		                                                    <button type="button" id="botonEliminar" title="Eliminar registro" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#modalEliminar" onclick="cargarDatos('<%=r.getIdRol() %>', '<%=r.getNombre() %>', '<%=r.getDescripcion() %>')"><i class="fa fa-trash-o"></i></button>
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
               
            </div><!-- /page content -->
        </div>
        
		 <div class="clearfix"></div>
		 
		 <jsp:include page="footer.jsp" flush="true" /><!-- /footer content -->
		 
    </div>

    <div id="custom_notifications" class="custom-notifications dsp_none">
        <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
        </ul>
        <div class="clearfix"></div>
        <div id="notif-group" class="tabbed_notifications"></div>
    </div>

    </div>
</body>

		<script src="js/bootstrap.min.js"></script>
	
	    <script src="js/nicescroll/jquery.nicescroll.min.js"></script>
	    <!-- icheck -->
	    <script src="js/icheck/icheck.min.js"></script>
	
	    <script src="js/custom.js"></script>
	
     	<!-- Datatables -->
     
        <script src="js/datatables/js/jquery.js"></script>
    	<script src="js/datatables/js/jquery.dataTables.js"></script>
		<script src="js/datatables/tools/js/dataTables.tableTools.js"></script>
    	<script src="js/pluging-datatable/jquery.dataTables.columnFilter.js"></script>
        <!-- Fin Datatables -->
        
        <!-- PNotify -->
	    <script type="text/javascript" src="js/notify/pnotify.core.js"></script>
	    <script type="text/javascript" src="js/notify/pnotify.buttons.js"></script>
	    <script type="text/javascript" src="js/notify/pnotify.nonblock.js"></script>
	    <!-- Fin PNotify -->
	    
	    <!-- Datepicker -->
	    <script type="text/javascript" src="js/datepicker/daterangepicker.js"></script>
        
        <!-- Select2 -->
        	<script src="js/select/select2.full.js"></script>
        <!-- Fin Select2 -->
   <script type="text/javascript" >
   
    	function cargarDatos(id, nombre, descripcion)
    	{
    		$("#IdRol").val(id);
    		$("#IdRolEditar").val(id);
    		$("#IdRolEliminar").val(id);
    		$("#nombre").val(nombre);
    		$("#nombre_RolEditado").val(nombre);
    		$("#descripcion").val(descripcion);
    		$("#descripcion_RolEditado").val(descripcion);
    	}
    
    </script>
    
       <!-- avisos de CRUD -->
    	<%
    		String msj = "";
    		msj = request.getParameter("msj");
    		System.out.println(msj);
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
    	                text: "El rol fue almacenado exitosamente!!!",
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
    		                text: "El rol se editó  exitosamente!!!",
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
    		                text: "El rol se elimino exitosamente!!!",
    		                nonblock: {
                                   nonblock: true,
                                   nonblock_opacity: .9}
    					}); 
    			}
    			 if(mensaje=="4")
     			{
     				 new PNotify({
     		                title: "Registro no encontrado",
     		                type: "error",
     		                text: "El rol no fue encontrado!!!",
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
				
				$('table.display').dataTable(
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