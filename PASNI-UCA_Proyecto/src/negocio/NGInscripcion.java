package negocio;

import java.util.ArrayList;

import datos.MDInscripcion;
import datos.MDPeriodoInscripcion;
import entidades.Inscripcion;
import entidades.InscripcionMonitor;
import entidades.Monitor;
import entidades.PeriodoInscripcion;

public class NGInscripcion {

	public boolean guardarNGInscripcion(Inscripcion i, Monitor m)
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
	
	public boolean agregarInscripcion(Inscripcion i)
	{
		
		boolean bl = false;
		
		try
		{
			MDInscripcion s = new MDInscripcion();
			bl = s.agregarInscripcion(i);
			System.out.println("NEGOCIO: Agregado con éxito!!!");
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
