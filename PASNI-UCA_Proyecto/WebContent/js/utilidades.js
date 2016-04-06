	//Limpiar campos bandejaSolicitudesMonitor.jsp
	function limpiar(){
		$("#idInscripcionE").html('');
		$("#carneE").html('');
		$("#nombreE").html('');
		$("#apellidoE").html('');
		$("#calificacionE").html('');
		$("#motivoE").html('');
		$("#promedioE").html('');
		$("#turnoEV").prop('checked',false);
		$("#turnoED").prop('checked',false);
		$("#turnoES").prop('checked',false);
		$("#carneA").html('');
		$("#nombreP").html('');
		$("#nombreS").html('');
		$("#apellidoP").html('');
		$("#apellidoS").html('');
		$("#calificacionA").html('');
		$("#motivoA").html('');
		$("#promedioA").html('');
		$("#turnoA").prop('checked',false);
		$("#idMonitorE").html('');
		$("#nombrePE").html('');
		$("#nombreSE").html('');
		$("#apellidoEP").html('');
		$("#apellidoSE").html('');
		$("#emailE").html('');
		$("#telefonoE").html('');
		$("#carreraE").html('');
		$("#promedioEM").html('');
	};
	
	//Buscar Monitor por Carne, bandejaSolicitudesMonitor.jsp
	$(document).ready(function()
		{	$('#buscarC').click(function(event) {
				var carneA = $('#carneA').val();
				$.ajax({		    
			          url:"../../SLBuscarMonitorCarne?opc=1",
			          type:"post",
			          datatype:"html",
			          data:{'carneA':carneA},
			          success:function(data) 
			          {
			        		$('#monitor').html(data);  
			          }
			        });
			});
		
			$('#buscar').click(function(event) {
				var carne = $('#carneA').val();
				$.ajax({		    
			          url:"../../SLBuscarMonitorCarne?opc=2",
			          type:"post",
			          datatype:"html",
			          data:{'carneA':carne},
			          success:function(data) 
			          {
			        		$('#monitorC').html(data);  
			          }
			        });
			});
		
		$("#facultad").change(function()
				{
					var facultad=$("#facultad").val();
					console.log(facultad);
					if (facultad=="0")
					{
						$("#carrera").val("0");
						$("#carrera").prop('disabled',true);
					}
					else 
					{
						$("#carrera").prop('disabled',false);
						$.ajax({		    
					          url:"../../SLComboCarreras",
					          type:"post",
					          datatype:"html",
					          data:{'idFacultad':facultad},
					          success:function(data) 
					          {
					        		$('#carrera').html(data);  
					          }
					        });
					};			
				});
		});
	
	//Cargar datos en un modal bandejaSolicitudesMonitor.jsp
	function cargarDatos(IdInscripcionE, carneE, nombreE, apellidoE, asignaturaE,motivoE,calificacionE,promedioE,turnoE){
		limpiar();
		$("#idInscripcionE").val(IdInscripcionE);
		$("#carneE").val(carneE);
		$("#nombreE").val(nombreE);
		$("#apellidoE").val(apellidoE);
		$("#motivoE").val(motivoE);
		$('#asignaturaEO').html('');
		$('#asignaturaEO').append('<option>'+asignaturaE+'</option>');
		$("#calificacionE").val(calificacionE);
		$("#promedioE").val(promedioE);
		if(turnoE == "vespertino"){
			$('#turnoEV').prop('checked',true);
		}else if(turnoE == "diurno"){
			limpiar();
			$('#turnoED').prop('checked',true);
		}else if(turnoE == "sabatino"){
			limpiar();
			$('#turnoES').prop('checked',true);
		}
	};
	
	//Cargar datos en un modal monitor.jsp
	function cargarDatosM(idMonitor, carneM, nombrePM, nombreSM, apellidoPM, apellidoSM, correoM, telefonoM, carreraM, promedioM){
		limpiar();
		$("#idMonitorE").val(idMonitor);
		$("#carneE").val(carneM);
		$("#nombrePE").val(nombrePM);
		$("#nombreSE").val(nombreSM);
		$("#apellidoEP").val(apellidoPM);
		$("#apellidoSE").val(apellidoSM);
		$("#emailE").val(correoM);
		$("#telefonoE").val(telefonoM);
		$("#carreraE").val(carreraM);
		$("#promedioEM").val(promedioM);
	};