package negocio;

import java.util.ArrayList;

import datos.MDTaller;
import entidades.Cuatrimestre;
import entidades.Taller;

public class NGTaller {
	
	//Método Guardar
		public boolean guardarNGTaller(Taller taller)
		{
			
			boolean bl = false;
			
			try
			{
				MDTaller dtt = new MDTaller();
				bl = dtt.guardarDt_Taller(taller);
				System.out.println("NEGOCIO: Datos guardados con exito!!!");
			}
		
			catch(Exception e)
			{
				e.printStackTrace();
				System.out.println("NEGOCIO: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
			}
			
			return bl;
		}
		
		// Método Actualizar
		public boolean actualizarNGTaller(Taller taller)
		{
			boolean bl = false;
			
			try
			{
				MDTaller dtt = new MDTaller();
				bl = dtt.actualizarTaller(taller);
				System.out.println("NEGOCIO: DATOS ACTUALIZADOS CON EXITO!");
			}
		
			catch(Exception e)
			{
				e.printStackTrace();
				System.out.println("NEGOCIO: ERROR AL ACTUALIZAR LOS DATOS " + e.getMessage());
			}
			
			return bl;
		}
		
		//Método para eliminar
		
		public boolean eliminarNGTaller(Taller t){
			
			boolean bl = true;
			try{
				
			MDTaller datos = new MDTaller();
			bl = datos.eliminarTaller(t);
			
			System.out.println("NEGOCIO: DATOS ACTUALIZADOS CON EXITO!");
			}catch(Exception e)
			{
				
				e.printStackTrace();
				System.out.println("Error al eliminar los datos" + e.getMessage());
			}
			return bl;
					
		}
		
		public ArrayList<Taller> cargarTalleres()
		{
			ArrayList < Taller > array = new ArrayList<Taller>();
			MDTaller datos = new MDTaller();
			try
			{
				array = datos.cargarDatos();
			}
			catch(Exception e)
			{
				System.out.println("Negocio, el error es: "+e.getMessage());
				e.printStackTrace();
			}
			
			
			return array;
		}
		
		public ArrayList<Cuatrimestre> comboCuatrimestre()
		{
			ArrayList<Cuatrimestre> combo = new ArrayList<Cuatrimestre>();
			MDTaller datos = new MDTaller();
			try
			{
				combo = datos.comboCuatrimestre();
			}
			catch(Exception e)
			{
				System.out.println("Negocio, el error es: "+e.getMessage());
				e.printStackTrace();
			}
			
			
			return combo;
		}
	

}
