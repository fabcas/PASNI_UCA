package negocio;

import java.util.ArrayList;

import datos.MDSolicitudTaller;
import datos.MDTaller;
import entidades.SolicitudTaller;
import entidades.Taller;

public class NGSolicitudTaller {
	
	/** Métodos de aprobación, desaprobación **/
	
			public boolean aprobarNGSolicitudTaller(SolicitudTaller st)
			{
				
				boolean bl = false;
				
				try
				{
					MDSolicitudTaller datos = new MDSolicitudTaller();
					bl = datos.aprobarSolicitud(st);
					System.out.println("Negocio: Solicitud aprobada!!!");
				}
						
			
				catch(Exception e)
				{
					e.printStackTrace();
					System.out.println("Negocio: Error al aprobar la solicitud " + e.getMessage());
				}
				
				return bl;
			}
	
	/** Métodos de carga de registros. **/
	public ArrayList<SolicitudTaller> cargarSolicitudesPendientes()
	{
		ArrayList < SolicitudTaller > array = new ArrayList<SolicitudTaller>();
		MDSolicitudTaller datos = new MDSolicitudTaller();
		try
		{
			array = datos.cargarSolicitudesPendientes();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		
		return array;
	}
	
	public ArrayList<SolicitudTaller> cargarSolicitudesAprobadas()
	{
		ArrayList < SolicitudTaller > array = new ArrayList<SolicitudTaller>();
		MDSolicitudTaller datos = new MDSolicitudTaller();
		try
		{
			array = datos.cargarSolicitudesAprobadas();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		
		return array;
	}
	
	public ArrayList<SolicitudTaller> cargarSolicitudesDesaprobadas()
	{
		ArrayList < SolicitudTaller > array = new ArrayList<SolicitudTaller>();
		MDSolicitudTaller datos = new MDSolicitudTaller();
		try
		{
			array = datos.cargarSolicitudesDesaprobadas();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		
		return array;
	}
	
	

}
