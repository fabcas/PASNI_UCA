package negocio;

import java.util.ArrayList;

import datos.MDFacilitador;
import datos.MDInstanciasUCA;
import entidades.Facilitador;
import entidades.InstanciasUCA;

public class NGInstanciasUCA {
	
	public boolean guardarNGInstancias(InstanciasUCA iu)
	{
		
		boolean bl = false;
		
		try
		{
			MDInstanciasUCA mdr = new MDInstanciasUCA();
			bl = mdr.guardarInstancias(iu);
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
	public boolean actualizarNGInstancias(InstanciasUCA iu)
	{
		boolean bl = false;
		
		try
		{
			MDInstanciasUCA mdr = new MDInstanciasUCA();
			bl = mdr.actualizarInstancias(iu);
			System.out.println("NEGOCIO: Datos actualizados con exito!!!");
		}
	
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("NEGOCIO: ERROR AL ACTUALIZAR LOS DATOS " + e.getMessage());
		}
		
		return bl;
	}
	
	//Método para eliminar
	
	public boolean eliminarNGInstancias(InstanciasUCA iu){
		
		boolean bl = true;
		
		try{
			
			MDInstanciasUCA datos = new MDInstanciasUCA();
			bl = datos.eliminarInstancias(iu);
		
			System.out.println("NEGOCIO: dato eliminado con exito!");
			
		}
			catch(Exception e)
			{
			
				e.printStackTrace();
				System.out.println("Error al eliminar los datos" + e.getMessage());
			}
		return bl;
				
	}
	
	// M?todo para cargar los datos de un piche en el frm
	public boolean NGexistencia(int IdInstancia)
	{
		boolean existe = false;
		MDInstanciasUCA datos = new MDInstanciasUCA();
		
		try
		{
			existe = datos.existencia(IdInstancia);
		}
		catch(Exception e)
		{
			System.out.println("NG: el error es: "+e.getMessage());
			e.printStackTrace();
		}
				
		return existe;
	}
	
	public ArrayList<InstanciasUCA> cargarFacilitador()
	{
		ArrayList < InstanciasUCA > array = new ArrayList< InstanciasUCA >();
		MDInstanciasUCA datos = new MDInstanciasUCA();
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
