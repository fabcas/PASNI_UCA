package negocio;

import java.util.ArrayList;

import datos.MDInscripcion;
import datos.MDPeriodoInscripcion;
import datos.MDTaller;
import entidades.InscripcionMonitor;
import entidades.PeriodoInscripcion;
import entidades.Taller;

public class NGPeriodoInscripcion {
	
	public boolean guardarPI(PeriodoInscripcion pi){
		
		boolean bl = false;
		 
		 try{
			 MDPeriodoInscripcion NGpi = new MDPeriodoInscripcion();
			 bl = NGpi.guardarPI(pi);
			 System.out.println("NEGOCIO: El periodo se ha agregado con éxito!!! ");
		 }catch(Exception e){
			 
			 e.printStackTrace();
			 System.out.println("NEGOCIO: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		 }
		 return bl;
	}
	
	public ArrayList<PeriodoInscripcion> cargarPI()
	{
		ArrayList < PeriodoInscripcion > array = new ArrayList<PeriodoInscripcion>();
		MDPeriodoInscripcion datos = new MDPeriodoInscripcion();
		try
		{
			array = datos.cargarDatosPI();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		return array;
	}
	
	public ArrayList<PeriodoInscripcion> cargarPIF()
	{
		ArrayList < PeriodoInscripcion > array = new ArrayList<PeriodoInscripcion>();
		MDPeriodoInscripcion datos = new MDPeriodoInscripcion();
		try
		{
			array = datos.cargarDatosPIF();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		return array;
	}
	
	public boolean editarPI(PeriodoInscripcion pi){
		boolean bl = false;
		
		try{
			MDPeriodoInscripcion mdpi = new MDPeriodoInscripcion();
			bl = mdpi.editarPI(pi);
			System.out.println("NEGOCIO: El periodo se ha editado con éxito!!! ");
			
		}catch(Exception e){
			 
			 e.printStackTrace();
			 System.out.println("NEGOCIO: ERROR AL EDITAR LOS DATOS " + e.getMessage());
		 }
		 return bl;
	}
	
	public boolean eliminarPI(PeriodoInscripcion pi){
		
		boolean bl = true;
		try{
			
		MDPeriodoInscripcion mdpi = new MDPeriodoInscripcion(); 
		bl = mdpi.eliminarPeriodo(pi);
		
		System.out.println("NEGOCIO: DATOS ACTUALIZADOS CON EXITO!");
		}catch(Exception e)
		{
			
			e.printStackTrace();
			System.out.println("Error al eliminar los datos" + e.getMessage());
		}
		return bl;
				
	}

}
