package negocio;

import java.util.ArrayList;

import modelo.MDTaller;
import datos.Cuatrimestre;
import datos.Taller;

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
		
		public boolean eliminarNGTaller(Taller enti){
			
			boolean bl = true;
			try{
				
			MDTaller datos = new MDTaller();
			bl = datos.eliminarTaller(enti);
			
			System.out.println("NEGOCIO: DATOS ACTUALIZADOS CON EXITO!");
			}catch(Exception e)
			{
				
				e.printStackTrace();
				System.out.println("Error al eliminar los datos" + e.getMessage());
			}
			return bl;
					
		}
		
		public ArrayList<Taller> cargarDPTaller()
		{
			ArrayList< Taller> arrayL = new ArrayList<Taller>();
			MDTaller datos = new MDTaller();
			try
			{
				arrayL = datos.cargarDatos();
			}
			catch(Exception e)
			{
				System.out.println("NG: el error es: "+e.getMessage());
				e.printStackTrace();
			}
			
			
			return arrayL;
		}
		
		public ArrayList<Cuatrimestre> comboCuatrimestre()
		{
			ArrayList<Cuatrimestre> arrayL = new ArrayList<Cuatrimestre>();
			MDTaller datos = new MDTaller();
			try
			{
				arrayL = datos.comboCuatrimestre();
			}
			catch(Exception e)
			{
				System.out.println("NG: el error es: "+e.getMessage());
				e.printStackTrace();
			}
			
			
			return arrayL;
		}
	

}
