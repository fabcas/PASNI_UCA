<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>PASNI-UCA | Menú</title>

<!-- Bootstrap core CSS

<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../fonts/css/font-awesome.min.css" rel="stylesheet">

<!-- Custom styling plus plugins 
<link href="../css/custom.css" rel="stylesheet">

<script src="../js/jquery.min.js"></script>-->

</head>


<body>
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">

					<div class="navbar nav_title" style="border: 0;">
						<a href="#" class="site_title"> <span>PASNI-UCA</span></a>
					</div>
					<div class="clearfix"></div>

					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">

						<div class="menu_section">
							<ul class="nav side-menu yellow">
								<li><a><i class="fa fa-graduation-cap"></i> Alumno
										Monitor <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
										<li><a href="../monitor/monitor.jsp">Estudiante Monitor</a></li>
										<li><a href="../monitor/perfil-monitor.jsp">Perfil Estudiante Monitor</a></li>
										<li><a href="../monitor/periodo-inscripcion.jsp">Período de Inscripción</a></li>
										<li><a href="../monitor/bandeja-solicitud-monitor.jsp">Bandeja Inscripciones Monitor</a></li>
									</ul></li>
								<li><a><i class="fa fa-edit"></i> Profesor Guía <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
										<li><a href="../profesor/informe-guiatura.jsp">Informes de Guiatura</a></li>
										<li><a href="../profesor/inscripcion-profesor.jsp">Inscripciones de Profesores</a></li>
										<li><a href="../profesor/lista-profesores.jsp">Lista de Profesores</a></li>
									</ul></li>
								<li><a><i class="fa fa-desktop"></i> Taller de Formación <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
										<li><a href="../taller/solicitar-taller.jsp">Solicitar taller</a>
										<li><a href="../taller/bandeja-solicitud-taller.jsp">Bandeja Solicitud Taller</a></li>
										<li><a href="../taller/categoria-taller.jsp">Categoría de taller</a></li>
										<li><a href="../taller/taller.jsp">Talleres de Formación</a></li>
									</ul></li>
								<li><a><i class="fa fa-magic"></i> Administración <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
										<li><a href="../../seg-cuenta-usuario.jsp">Cuentas de usuarios</a></li>
										<li><a href="../../seg-rol.jsp">Roles</a></li>
										<!--<li><a href="index3.html">Dashboard3</a></li>-->
									</ul></li>
							</ul>
						</div>

					</div>
					<!-- /sidebar menu -->

					<!-- /menu footer buttons -->
					<div class="sidebar-footer hidden-small">
						<a data-toggle="tooltip" data-placement="top"> <img
							class="imgsize" src="../../img/logos/uca.png">
						</a> <a data-toggle="tooltip" data-placement="top"> <img
							class="imgsize" src="../../img/logos/js.png">
						</a> <a data-toggle="tooltip" data-placement="top"> <img
							class="imgsize" src="../../img/logos/asj.png">
						</a>
					</div>
					<!-- /menu footer buttons -->
				</div>
			</div>
			<!--/col-md-3 left_col-->

			<div class="top_nav">

				<div class="nav_menu">
					<nav class="" role="navigation">
						<div class="nav toggle">
							<a id="menu_toggle"><i class="fa fa-bars"></i></a>
						</div>

						<ul class="nav navbar-nav navbar-right">
							<li class=""><a href="javascript:;"
								class="user-profile dropdown-toggle" data-toggle="dropdown"
								aria-expanded="true"> <img src="../../img/user.png" alt="">Usuario
									<span class=" fa fa-angle-down"></span>
							</a>
								<ul
									class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
									<li><a href="../../index.jsp"><i
											class="fa fa-sign-out pull-right"></i>Cerrar Sesión</a></li>
								</ul></li>
						</ul>
					</nav>
				</div>

			</div>
			<!-- /top navigation -->

			<!-- /page content -->

		<!-- /main_container -->

	<!-- /container body

	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/custom.js"></script>-->
</body>
</html>
