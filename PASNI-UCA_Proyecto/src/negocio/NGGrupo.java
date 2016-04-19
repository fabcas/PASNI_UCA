package negocio;

import java.util.ArrayList;

import datos.MDGrupo;
import entidades.Grupo;

public class NGGrupo {
	
	public ArrayList<Grupo> cargarGrupo(String APER, String CARR){
		
		ArrayList < Grupo > array = new ArrayList<Grupo>();
		MDGrupo datos = new MDGrupo();
		try
		{
			array = datos.cargarGrupo(APER, CARR);
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		return array;
	
	}
	
	public ArrayList<Grupo> cargarGrupoU(int usuario){
			
			ArrayList < Grupo > array = new ArrayList<Grupo>();
			MDGrupo datos = new MDGrupo();
			try
			{
				array = datos.cargarGrupoU(usuario);
			}
			catch(Exception e)
			{
				System.out.println("Negocio, el error es: "+e.getMessage());
				e.printStackTrace();
			}
			return array;
		
	}
}
