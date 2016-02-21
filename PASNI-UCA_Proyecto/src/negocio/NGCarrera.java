package negocio;

import java.util.ArrayList;

import datos.MDCarrera;
import datos.MDFacultad;
import entidades.Carrera;
import entidades.Facultad;

public class NGCarrera {

	public ArrayList<Carrera> comboCarrera(int id)
	{
		ArrayList<Carrera> combo = new ArrayList<Carrera>();
		MDCarrera datos = new MDCarrera();
		try
		{
			combo = datos.comboCarrera(id);
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		return combo;
	}
}
