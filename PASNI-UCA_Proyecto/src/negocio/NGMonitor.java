package negocio;

import java.util.ArrayList;

import datos.MDInscripcion;
import datos.MDMonitor;
import entidades.Monitor;
import entidades.PerfilMonitor;

public class NGMonitor {

	public boolean agregarMonitor(Monitor m){
		boolean bl = false;
		
		try
		{
			MDMonitor s = new MDMonitor();
			bl = s.agregarMonitor(m);
			System.out.println("NEGOCIO: Monitor agregado con éxito!!!");
		}
	
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("NEGOCIO: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		}
		
		return bl;
	}
	
	public boolean editarMonitor(Monitor m){
		
		boolean bl = false;
		
		try
		{
			MDMonitor s = new MDMonitor();
			bl = s.editarMonitor(m);
			System.out.println("NEGOCIO: Monitor editado con éxito!!!");
		}
	
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("NEGOCIO: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		}
		
		return bl;
	}
	
	public ArrayList<Monitor> buscarMonitorC(String carne)
	{
		ArrayList<Monitor> array = new ArrayList<Monitor>();
		MDMonitor datos = new MDMonitor();
		try
		{
			array = datos.buscarMonitorC(carne);
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}
	
	public ArrayList<Monitor> cargarMonitor(){
		
		ArrayList<Monitor> array = new ArrayList<Monitor>();
		MDMonitor datos = new MDMonitor();
		try
		{
			array = datos.cargarMonitor();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}
	
	public ArrayList<Monitor> cargarMonitorU(int usuario){
		
		ArrayList<Monitor> array = new ArrayList<Monitor>();
		MDMonitor datos = new MDMonitor();
		try
		{
			array = datos.cargarMonitorU(usuario);
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}
	
	public boolean subirArchivo(PerfilMonitor pm){
		
		boolean bl = false;
		
		try
		{
			MDMonitor s = new MDMonitor();
			bl = s.subirArchivo(pm);
			System.out.println("NEGOCIO: Informe enviado con éxito!!!");
		}
	
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("NEGOCIO: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		}
		
		return bl;
	}
	
	public ArrayList<PerfilMonitor> cargarArchivo(int usuario){
			
			ArrayList<PerfilMonitor> array = new ArrayList<PerfilMonitor>();
			MDMonitor datos = new MDMonitor();
			try
			{
				array = datos.cargarArchivo(usuario);
			}
			catch(Exception e)
			{
				System.out.println("Negocio, el error es: "+e.getMessage());
				e.printStackTrace();
			}
			
			return array;
	}
	
}
