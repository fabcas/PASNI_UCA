package negocio;

import java.util.ArrayList;

import datos.MDInscripcion;
import datos.MDTaller;
import entidades.Inscripcion;
import entidades.InscripcionMonitor;
import entidades.Monitor;
import entidades.Taller;

public class NGInscripcion {

	public boolean guardarNGTaller(Inscripcion i, Monitor m)
	{
		
		boolean bl = false;
		
		try
		{
			MDInscripcion s = new MDInscripcion();
			bl = s.ingresarSolicitud(i,m);
			System.out.println("NEGOCIO: Su inscripción se ha enviado con éxito!!!");
		}
	
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("NEGOCIO: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		}
		
		return bl;
	}
	
	public ArrayList<InscripcionMonitor> cargarInscripcionMonitor()
	{
		ArrayList < InscripcionMonitor > array = new ArrayList<InscripcionMonitor>();
		MDInscripcion datos = new MDInscripcion();
		try
		{
			array = datos.cargarDatosI();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		return array;
	}
}
