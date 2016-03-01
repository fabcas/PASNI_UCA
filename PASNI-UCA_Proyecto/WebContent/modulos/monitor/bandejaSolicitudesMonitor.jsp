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

						<div class="title_right">
							<div
								class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Buscar..."> <span
										class="input-group-btn">
										<button class="btn btn-default" type="button">Ir!</button>
									</span>
								</div>
							</div>
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
				                                    <table class="table table-striped responsive-utilities jambo_table bulk_action">
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
				                                                <th class="column-title">Estado</th>
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
							                                    <td class=" "><%=i.isEstado()%></td>
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
                                        <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip</p>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="tab_content3" aria-labelledby="profile-tab">
                                        <p>xxFood truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk </p>
                                    </div>
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
</html>