package servlets;

import java.util.ArrayList;
import java.util.List;

import datos.SolicitudModelo;
import entidades.DetalleSolicitud;
import entidades.Error;
import entidades.Monitor;

public class SolicitudControlador {
	
	public SolicitudControlador(){
		
	}
	
	private void RegistrarSolicitud(){
		
		try {
			/*Monitor m = new Monitor();
			SolicitudModelo sm = new SolicitudModelo();
			List<DetalleSolicitud> ds = new ArrayList<DetalleSolicitud>();
			m.setIdUsuario(null);
			m.setPrimerNombre("Meyling");
			m.setEmail("castillo.fabiola7@outlook.com");
			m.setSegundoNombre("Fabiola");
			m.setTelefono("88186287");
			m.setPrimerApellido("Castillo");
			m.setSegundoApellido("");
			m.setCarne("2011930010");
			m.setPromedio(89);
			m.setEstipendio(true);
			m.setIdCarrera(1);

			DetalleSolicitud d1 = new DetalleSolicitud();
			d1.setAsignatura("Taller de redacción");
			d1.setMotivo("Me gusta enseñar");
			d1.setTurno("Matutino");		
			ds.add(d1);

			DetalleSolicitud d2 = new DetalleSolicitud();
			d2.setAsignatura("Algebra");
			d2.setMotivo("Porque quiero billetito");
			d2.setTurno("Nocturno");		
			ds.add(d2);

			DetalleSolicitud d3 = new DetalleSolicitud();
			d3.setAsignatura("Herramientas ofimáticas");
			d3.setMotivo("Porque quiero ser popular");
			d3.setTurno("Sabatino");		
			ds.add(d3);
			
			Error r = sm.RegistrarSolicitud(m, ds);
			System.out.println(r.getCodError() + " -- " + r.getMensajeError());*/
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public static void main(String args[])
    {
		new SolicitudControlador().RegistrarSolicitud();
    }
}
