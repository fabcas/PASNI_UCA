<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="datos.*, entidades.*,servlets.*,negocio.*, java.util.*,java.text.SimpleDateFormat"
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setDateHeader("Expires", -1);
	
	Date date = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy");
	String anio = format.format(date);
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
       		<form name="form" method="post" action="../../SLCuentaUsuario?opc=1">
            	<h1 class="yellow">Crear cuenta</h1>
            	<div id="monitorC">
            		<h2 class="greenm">¡Bienvenido Estudiante Monitor!</h2> <br>
                    <p class="white">Para poder acceder al sistema PASNI-UCA, deberán crear una cuenta de usuario.<br>
                    Primero verificaremos si sus datos son correctos</p><br>
	            	<input type="text" id="carneA" name="carneA" required="required" class="form-control" placeholder="Ingresá tu carné">
	            	<button type="button" id="buscar" name="buscar" class="btn btn-success">Verificar</button>
	        	</div>
           		<div class="separator white">
               	<div class="clearfix"></div>
                	<h1 class="yellow"><i style="font-size: 26px;"></i> PASNI-UCA</h1>
                    	<p>&copy; Copyright <%=anio%>, Todos los Derechos Reservados</p>
						<p>Universidad Centroamericana</p>
              	</div>
       		</form>
    	</div>
                <!-- content -->
        <div id="custom_notifications" class="custom-notifications dsp_none">
			<ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group"></ul>
			<div class="clearfix"></div>
			<div id="notif-group" class="tabbed_notifications"></div>
		</div>
	</div>
</body>
<script src="../../js/custom.js"></script>
<script src="../../js/bootstrap.min.js"></script>

<!-- icheck -->
	<script src="../../js/icheck.min.js"></script>
	
<!-- Datatables -->
<script src="../../js/datatables/js/jquery.js"></script>
<script src="../../js/datatables/js/jquery.dataTables.js"></script>
<script src="../../js/datatables/tools/js/dataTables.tableTools.js"></script>
<script src="../../js/datatables/js/jquery.dataTables.columnFilter.js"></script>
<!-- Fin Datatables -->

<!-- PNotify -->
<script type="text/javascript" src="../../js/notify/pnotify.core.js"></script>
<script type="text/javascript" src="../../js/notify/pnotify.buttons.js"></script>
<script type="text/javascript" src="../../js/notify/pnotify.nonblock.js"></script>
<!-- Fin PNotify -->

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
    	                text: "¡El registro se ha guardado con éxito!",
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
    		                text: "¡El registro se ha modificado con éxito!",
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
    		                text: "¡El registro se ha eliminado con éxito!",
    		                nonblock: {
                                   nonblock: true,
                                   nonblock_opacity: .9}
    					}); 
    			}
    		}
</script>

</html>