package negocio;

import java.util.ArrayList;

import datos.MDInforme;
import datos.MDInscripcion;
import entidades.Informe;
import entidades.Inscripcion;
import entidades.Monitor;

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
	
	public boolean agregarInforme(Informe i)
	{
		
		boolean bl = false;
		
		try
		{
			MDInforme inf = new MDInforme();
			bl = inf.agregarInforme(i);
			System.out.println("NEGOCIO: El informe se ha enviado con éxito!!!");
		}
	
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("NEGOCIO: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		}
		
		return bl;
	}
}
