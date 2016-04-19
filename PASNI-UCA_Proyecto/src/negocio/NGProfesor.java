package negocio;

import java.util.ArrayList;

import datos.Conexion;
import datos.MDProfesor;
import entidades.Profesor;

public class NGProfesor extends Conexion{
	
	public ArrayList<Profesor> cargarProfesor()
	{
		ArrayList<Profesor> array = new ArrayList<Profesor>();
		MDProfesor datos = new MDProfesor();
		try
		{
			array = datos.cargarProfesor();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}
	
	public ArrayList<Profesor> buscarMonitorP(String inss)
	{
		ArrayList<Profesor> array = new ArrayList<Profesor>();
		MDProfesor datos = new MDProfesor();
		try
		{
			array = datos.buscarProfesor(inss);
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}

}
