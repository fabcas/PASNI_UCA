package negocio;

import java.util.ArrayList;

import datos.MDMaestro_Facultad;
import entidades.VwMaestroDeFacultad;

public class NG_VwMaestroDeFacultad {
	
	public ArrayList<VwMaestroDeFacultad> cargarFacultades()
	{
		ArrayList<VwMaestroDeFacultad> lista = new ArrayList<VwMaestroDeFacultad>();
		MDMaestro_Facultad datos = new MDMaestro_Facultad();
		
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
