<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>PASNI-UCA</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="fonts/eleganticons/et-icons.css">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="js/ie10-viewport-bug-workaround.js" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/cover.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

<script src="js/ie-emulation-modes-warning.js"></script>
</head>

<body>
	<div class="site-wrapper">
		<nav class="navbar">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<h4 class="white head">PASNI-UCA</h4>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse">
					<ul class="navi navbar-nav navbar-right main-nav">
						<li><a href="http://www.uca.edu.ni/" target="_blank"><img
								class="img-style" src="img/logos/uca.png"></a></li>
						<li><a href="#"><img class="img-style"
								src="img/logos/js.png"></a></li>
						<li><a href="http://www.ausjal.org/" target="_blank"><img
								class="img-style" src="img/logos/asj.png"></a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		<section id="team" class=" blue-bg-service">
			<div class="container">
				<div class="row title text-center">
					<h3 class="margin-top white">Asistencia a Pregrado</h3>
					<h4 class="yellow ">Programas de Acompañamiento y Seguimiento
						a Nuevo Ingreso</h4>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="team text-center">
							<div class="cover"
								style="background: url('img/est.jpg'); background-size: cover;">
								<div class="overlay text-center">
									<a href="modulos/monitor/inscripcion.jsp"
										class="btn btn-white-fill">Sé Monitor</a>
								</div>

							</div>
							<p class="par">Alumnos Monitores</p>
						</div>
					</div>
					<div class="col-md-4">
						<div class="team text-center">
							<div class="cover"
								style="background: url('img/doc.jpg'); background-size: cover;">
								<div class="overlay text-center">
									<a href="#" data-toggle="modal" data-target="#modal1"
										class="btn btn-white-fill">Para Profesores</a>
								</div>
							</div>
							<p class="par">Profesores Guías</p>
						</div>
					</div>
					<div class="col-md-4">
						<div class="team text-center">
							<div class="cover"
								style="background: url('img/tal.jpg'); background-size: cover;">
								<div class="overlay text-center">
									<a href="#" data-toggle="modal" data-target="#modal1"
										class="btn btn-white-fill">Infórmate</a>
								</div>
							</div>
							<p class="par">Talleres de Formación</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<div class="mastfoot">
			<div class="white text-center">
				<p>&copy; Copyright 2016, Todos los Derechos Reservados</p>
				<p>Universidad Centroamericana</p>
			</div>
		</div>

		<div class="modal fade" id="modal1" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content modal-popup">
					<a href="#" class="close-link"><i class="icon_close_alt2"></i></a>
					<h3 class="white">Iniciá Sesión</h3>
					<form action="SLInicioSesion" method="post" name="InicioSesion"
						class="popup-form">
						<input type="text" class="form-control form-white"
							placeholder="Correo o Usuario"> <input type="text"
							class="form-control form-white" placeholder="Contraseña">
						<button type="submit" class="btn btn-submit">Enviar</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/jquery.min.js"><\/script>')</script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>

