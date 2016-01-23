$(document).ready(function(){
	$(".inputTelefono").keypress(function(e){
		var code = e.keyCode;
		if (code >= 48 && code <= 57){
			if ( $(this).val().length > 8)
				return false;
		} 
		else
		{
			return false;
		}
	});
	$(".inputCarne").keypress(function(e){
		var code = e.keyCode;
		if (code >= 48 && code <= 57){
			if ( $(this).val().length > 10)
				return false;
		} 
		else
		{
			return false;
		}
	});
});

function validarCorreo(correo){			
	var r = correo.match(/^[a-zA-Z0-9\._-]+@[a-zA-Z0-9-]{2,}[.][a-zA-Z]{2,4}$/);
	
	if (r) {
		$("#inputCorreo").popover("hide");
	}
	else {
		$("#inputCorreo").val("");
		$("#inputCorreo").popover({
			content: "Correo Incorrecto",
			placement: "right",
			trigger: "manual"
		});
		$("#inputCorreo").popover("show");
	}
}