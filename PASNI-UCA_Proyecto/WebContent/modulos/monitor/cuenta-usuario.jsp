<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="datos.*, entidades.*,servlets.*,negocio.*, java.util.*"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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

    <title>PASNI-UCA | Crear Cuenta</title>

    <!-- Bootstrap core CSS -->

    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <link href="../../fonts/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../css/animate.min.css" rel="stylesheet">

    <!-- Custom styling plus plugins -->
    <link href="../../css/custom.css" rel="stylesheet">
    <link href="../../css/icheck/flat/green.css" rel="stylesheet">

    <script src="../../js/jquery.min.js"></script>
	<script src="../../js/utilidades.js"></script>

</head>

<body style="background-color: rgb(0, 27, 54);">
        <div id="wrapper">
                <div class="login_content">
                    <form name="form" method="post" action="../../SLCuentaUsuario">
                        <h1 class="yellow">Crear cuenta</h1>
                        
                     	<input type="text" id="carneA" name="carneA" required="required" class="form-control" placeholder="Ingresá tu carné">
                     	<button type="button" id="buscar" name="buscar" class="btn btn-success">Verificar</button>
	                	<div id="monitorC">
	                	</div>
                       
                        <div class="separator white">
                            <div class="clearfix"></div>
                            <h1 class="yellow"><i style="font-size: 26px;"></i> PASNI-UCA</h1>
                            <p>&copy; Copyright 2016, Todos los Derechos Reservados</p>
							<p>Universidad Centroamericana</p>
                        </div>
                    </form>
                </div>
                <!-- content -->
            </div>
</body>

</html>