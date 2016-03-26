package negocio;

import java.util.ArrayList;

import datos.MDMonitor;
import entidades.Monitor;

public class NGMonitor {

	public ArrayList<Monitor> buscarMonitorC(String carne)
	{
		ArrayList<Monitor> array = new ArrayList<Monitor>();
		MDMonitor datos = new MDMonitor();
		try
		{
			array = datos.buscarMonitorC(carne);
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}
}
