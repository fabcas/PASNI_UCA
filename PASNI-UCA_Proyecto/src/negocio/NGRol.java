package negocio;

import java.util.ArrayList;
import datos.MDCategoriaTaller;
import datos.MDRol;
import entidades.Rol;

public class NGRol {
	
	public boolean guardarNGRol(Rol r)
	{
		
		boolean bl = false;
		
		try
		{
			MDRol mdr = new MDRol();
			bl = mdr.guardarRol(r);
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
	public boolean actualizarNGRol(Rol r)
	{
		boolean bl = false;
		
		try
		{
			MDRol mdr = new MDRol();
			bl = mdr.actualizarRol(r);
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
	
	public boolean eliminarNGRol(Rol r){
		
		boolean bl = true;
		try{
			
		MDRol datos = new MDRol();
		bl = datos.eliminarRol(r);
		
		System.out.println("NEGOCIO: dato eliminado con exito!");
		}catch(Exception e)
		{
			
			e.printStackTrace();
			System.out.println("Error al eliminar los datos" + e.getMessage());
		}
		return bl;
				
	}
	
	// M?todo para cargar los datos de un piche en el frm
	public boolean NGexistencia(int IdRol)
	{
		boolean existe = false;
		MDRol datos = new MDRol();
		try
		{
			existe = datos.existencia(IdRol);
		}
		catch(Exception e)
		{
			System.out.println("NG: el error es: "+e.getMessage());
			e.printStackTrace();
		}
				
		return existe;
	}
	
	public ArrayList<Rol> cargarRoles()
	{
		ArrayList < Rol > array = new ArrayList< Rol >();
		MDRol datos = new MDRol();
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
