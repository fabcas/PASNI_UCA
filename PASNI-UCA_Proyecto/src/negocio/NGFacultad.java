package negocio;

import java.util.ArrayList;

import datos.MDFacultad;
import entidades.Facultad;

public class NGFacultad {

	public ArrayList<Facultad> comboFacultad()
	{
		ArrayList<Facultad> combo = new ArrayList<Facultad>();
		MDFacultad datos = new MDFacultad();
		try
		{
			combo = datos.comboFacultad();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		return combo;
	}
}
