package negocio;

import java.util.ArrayList;

import datos.MDMaestro_Carreras;
import entidades.VwMaestroCarreras;

public class NG_VwCarrera {

	public ArrayList<VwMaestroCarreras> cargarCarreras()
	{
		ArrayList<VwMaestroCarreras> lista = new ArrayList<VwMaestroCarreras>();
		MDMaestro_Carreras datos = new MDMaestro_Carreras();
		
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
