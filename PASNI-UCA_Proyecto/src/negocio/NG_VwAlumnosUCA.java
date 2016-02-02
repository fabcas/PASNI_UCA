package negocio;

import java.util.ArrayList;

import datos.MDAlumnos_UCA;
import entidades.VwAlumnosUCA;

public class NG_VwAlumnosUCA {
	
	public ArrayList<VwAlumnosUCA> cargarFacultades()
	{
		ArrayList<VwAlumnosUCA> lista = new ArrayList<VwAlumnosUCA>();
		MDAlumnos_UCA datos = new MDAlumnos_UCA();
		
		try
		{
			lista = datos.cargarDatos();
		}
		catch(Exception e)
		{
			System.out.println("Negocio: el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
	}

}
