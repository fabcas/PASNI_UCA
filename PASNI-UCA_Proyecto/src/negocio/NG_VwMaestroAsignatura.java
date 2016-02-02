package negocio;

import java.util.ArrayList;
import datos.MDMaestro_Asignatura;
import entidades.VwMaestroAsignatura;

public class NG_VwMaestroAsignatura {
	
	public ArrayList<VwMaestroAsignatura> cargarAsignatura()
	{
		ArrayList<VwMaestroAsignatura> lista = new ArrayList<VwMaestroAsignatura>();
		MDMaestro_Asignatura datos = new MDMaestro_Asignatura();
		
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
