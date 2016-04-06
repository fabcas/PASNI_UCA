package negocio;

import java.util.ArrayList;

import datos.MDFacilitador;
import entidades.Facilitador;

public class NGFacilitador {
	
	public boolean guardarNGFacilitador(Facilitador f)
	{
		
		boolean bl = false;
		
		try
		{
			MDFacilitador mdr = new MDFacilitador();
			bl = mdr.guardarFacilitador(f);
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
	public boolean actualizarNGFacilitador(Facilitador r)
	{
		boolean bl = false;
		
		try
		{
			MDFacilitador mdr = new MDFacilitador();
			bl = mdr.actualizarFacilitador(r);
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
	
	public boolean eliminarNGFacilitador(Facilitador f){
		
		boolean bl = true;
		try{
			
		MDFacilitador datos = new MDFacilitador();
		bl = datos.eliminarFacilitador(f);
		
		System.out.println("NEGOCIO: dato eliminado con exito!");
		}catch(Exception e)
		{
			
			e.printStackTrace();
			System.out.println("Error al eliminar los datos" + e.getMessage());
		}
		return bl;
				
	}
	
	// M?todo para cargar los datos de un piche en el frm
	public boolean NGexistencia(int IdFacilitador)
	{
		boolean existe = false;
		MDFacilitador datos = new MDFacilitador();
		
		try
		{
			existe = datos.existencia(IdFacilitador);
		}
		catch(Exception e)
		{
			System.out.println("NG: el error es: "+e.getMessage());
			e.printStackTrace();
		}
				
		return existe;
	}
	
	public ArrayList<Facilitador> cargarFacilitador()
	{
		ArrayList < Facilitador > array = new ArrayList< Facilitador >();
		MDFacilitador datos = new MDFacilitador();
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
