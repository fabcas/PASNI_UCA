package negocio;

import java.util.ArrayList;

import datos.MDInforme;
import entidades.Informe;

public class NGInforme {

	public ArrayList <Informe> cargarInformes(int usuario)
	{
		ArrayList < Informe > array = new ArrayList<Informe>();
		MDInforme datos = new MDInforme();
		try
		{
			array = datos.cargarInforme(usuario);
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		return array;
	}
}
