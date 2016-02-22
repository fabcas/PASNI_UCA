package negocio;

import datos.MDAsignatura;
import entidades.Asignatura;

import java.util.*;

public class NGAsignatura {

	public ArrayList<Asignatura> comboAsignatura(){
		
		ArrayList<Asignatura> combo = new ArrayList<Asignatura>();
		MDAsignatura datos = new MDAsignatura(); 
		
		try
		{
			combo = datos.comboAsignatura();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		return combo;
	}
}
