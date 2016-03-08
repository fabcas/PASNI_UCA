package negocio;

import java.util.ArrayList;

import datos.MDInscripcion;
import entidades.Inscripcion;
import entidades.InscripcionMonitor;
import entidades.Monitor;

public class NGInscripcion {

	public boolean guardarNGTaller(Inscripcion i, Monitor m)
	{
		
		boolean bl = false;
		
		try
		{
			MDInscripcion s = new MDInscripcion();
			bl = s.ingresarSolicitud(i,m);
			System.out.println("NEGOCIO: Su inscripci�n se ha enviado con �xito!!!");
		}
	
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("NEGOCIO: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		}
		
		return bl;
	}
	
	public boolean modificarInscripcion(Inscripcion i){
		
		boolean bl = false;
		try{
			
			MDInscripcion MDi = new MDInscripcion();
			bl = MDi.modificarInscripcion(i);
			
		}catch(Exception e){
			
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
	
	public ArrayList <InscripcionMonitor> cargarDatosIaprobados()
	{
		ArrayList < InscripcionMonitor > array = new ArrayList<InscripcionMonitor>();
		MDInscripcion datos = new MDInscripcion();
		try
		{
			array = datos.cargarDatosIaprobados();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		return array;
	}
	
	public ArrayList <InscripcionMonitor> cargarDatosIReprobados()
	{
		ArrayList < InscripcionMonitor > array = new ArrayList<InscripcionMonitor>();
		MDInscripcion datos = new MDInscripcion();
		try
		{
			array = datos.cargarDatosIReprobados();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		return array;
	}
}
