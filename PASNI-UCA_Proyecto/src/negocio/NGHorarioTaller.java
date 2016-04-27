package negocio;

import java.util.ArrayList;

import datos.MDFacilitador;
import datos.MDHorarioTaller;
import entidades.Facilitador;
import entidades.HorarioTaller;

public class NGHorarioTaller {
	
	public boolean guardarNGHorarioTaller(HorarioTaller h)
	{
		
		boolean bl = false;
		
		try
		{
			MDHorarioTaller mdr = new MDHorarioTaller();
			bl = mdr.guardarHorarioTaller(h);
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
	public boolean actualizarNGHorarioTaller(HorarioTaller h)
	{
		boolean bl = false;
		
		try
		{
			MDHorarioTaller mdr = new MDHorarioTaller();
			bl = mdr.actualizarHorarioTaller(h);
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
	
	public boolean eliminarNGHorarioTaller(HorarioTaller h){
		
		boolean bl = true;
		try{
			
		MDHorarioTaller datos = new MDHorarioTaller();
		bl = datos.eliminarHorarioTaller(h);
		
		System.out.println("NEGOCIO: dato eliminado con exito!");
		}catch(Exception e)
		{
			
			e.printStackTrace();
			System.out.println("Error al eliminar los datos" + e.getMessage());
		}
		return bl;
				
	}
	
	// M?todo para cargar los datos de un piche en el frm
	public boolean NGexistencia(int IdHorarioTaller)
	{
		boolean existe = false;
		MDHorarioTaller datos = new MDHorarioTaller();
		
		try
		{
			existe = datos.existencia(IdHorarioTaller);
		}
		catch(Exception e)
		{
			System.out.println("NG: el error es: "+e.getMessage());
			e.printStackTrace();
		}
				
		return existe;
	}
	
	public ArrayList<HorarioTaller> cargarHorarioTaller()
	{
		ArrayList < HorarioTaller > array = new ArrayList< HorarioTaller >();
		MDHorarioTaller datos = new MDHorarioTaller();
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
