package negocio;

import java.util.ArrayList;
import datos.MDCategoriaTaller;
import entidades.CategoriaTaller;

public class NGCategoriaTaller {
	
	public boolean guardarNGCategoriaTaller(CategoriaTaller ct)
	{
		
		boolean bl = false;
		
		try
		{
			MDCategoriaTaller mdct = new MDCategoriaTaller();
			bl = mdct.guardarCategoria(ct);
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
	public boolean actualizarNGCategoriaTaller(CategoriaTaller ct)
	{
		boolean bl = false;
		
		try
		{
			MDCategoriaTaller mdct = new MDCategoriaTaller();
			bl = mdct.actualizarCategoria(ct);
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
	
	public boolean eliminarNGCategoriaTaller(CategoriaTaller ct){
		
		boolean bl = true;
		try{
			
		MDCategoriaTaller datos = new MDCategoriaTaller();
		bl = datos.eliminarCategoria(ct);
		
		System.out.println("NEGOCIO: DATOS ACTUALIZADOS CON EXITO!");
		}catch(Exception e)
		{
			
			e.printStackTrace();
			System.out.println("Error al eliminar los datos" + e.getMessage());
		}
		return bl;
				
	}
	
	public ArrayList<CategoriaTaller> cargarCategorias()
	{
		ArrayList < CategoriaTaller > array = new ArrayList<CategoriaTaller>();
		MDCategoriaTaller datos = new MDCategoriaTaller();
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
	
}
