<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
   <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>PASNI-UCA</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="fonts/fonts/eleganticons/et-icons.css">

    <!-- Custom styles for this template -->
    <link href="css/cover.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="masthead ">
            <div class="inner">
              <h3 class="masthead-brand">PASNI-UCA</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li><a href="#"><img class="img-style" src="img/logos/lg_uca.png"></a></li>
                  <li><a href="#"><img class="img-style" src="img/logos/lg_ausjal.png"></a></li>
                  <li><a href="#"><img class="img-style" src="img/logos/lg_js.png"></a></li>
                  <li><a href="#"><img class="img-style s5" src="img/logos/55.png"></a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="row ">
            <div class="col-md-12 text-center white headf">
              <h3> Coordinación de Asistencia a Pregrado</h3>
              <h4>Programas de Acompañamiento y Seguimiento a Primer Ingreso</h4>
            </div>
          </div>

          <div class="inner cover">
            <div class="row intro-tables">
              <div class="col-md-4">
                  <div class="box-main text-center">
                    <h4 class="white">Docentes Guías</h4>
                    <h4 class="white regular light">Aqui va algo</h4>
                    <a href="#" data-toggle="modal" data-target="#modal1" class="btn btn-white-fill">Inicia Sesión</a>
                  </div>
             </div>
              <div class="col-md-4">
                  <div class="box-main text-center">
                    <h4 class="white">Alumnos Monitores</h4>
                    <h4 class="white regular light">Aqui va algo</h4>
                      <a href="#" data-toggle="modal" data-target="#modal1" class="btn btn-white-fill">Aplica</a>
                  </div>
             </div>
              <div class="col-md-4">
                  <div class="box-main text-center">
                    <h4 class="white">Talleres de Formación</h4>
                    <h4 class="white regular light">Aqui va algo</h4>
                  <a href="#" data-toggle="modal" data-target="#modal1" class="btn btn-white-fill">Consulta</a>
                  </div>
              </div>
            </div>
          </div>
          
         <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content modal-popup">
						<button type="button" class="close-link" data-dismiss="modal"><i class="icon_close_alt2"></i></button>
						<h3 class="white">Iniciar Sesión</h3>
						<form action="./SLInicioSesion?opc=" class="popup-form" name="InicioSesion" method="post">
							<input id="nombreUsuario" type="text" class="form-control form-white" placeholder="Usuario" name="usuario">
							<input id="pass" type="password" class="form-control form-white"  placeholder="Contraseña" name="password">
							<button type="submit" class="btn btn-submit">Iniciar</button>
						</form>
					</div>
				</div>
		  </div>

          <div class="mastfoot">
            <div class="inner text-center">
              <p>&copy; Copyright 2015, Todos los Derechos Reservados</p>
              <p>Universidad Centroamericana</p>
            </div>
          </div>

        </div>

      </div>

    </div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
  
  <%
		String msj ="";
		msj = request.getParameter("msj");
	
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
	                text: "El pais fue almacenado exitosamente!!!",
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
		                text: "El pais se edito  exitosamente!!!",
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
		                text: "El pais se elimino exitosamente!!!",
		                nonblock: {
                               nonblock: true,
                               nonblock_opacity: .9}
					}); 
			}
		}
	</script>
  
</html> 

