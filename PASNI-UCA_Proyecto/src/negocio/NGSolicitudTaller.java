package negocio;

import java.util.ArrayList;

import datos.MDHorarioTaller;
import datos.MDSolicitudTaller;
import datos.MDTaller;
import entidades.DetalleSolicitudTaller;
import entidades.HorarioTaller;
import entidades.SolicitudTaller;
import entidades.Taller;
import entidades.VwSolicitudDetalles;

public class NGSolicitudTaller {
	
	/** Métodos de agregar, modificar, eliminar **/
		
	public boolean guardarSolicitudTaller(SolicitudTaller st, DetalleSolicitudTaller dst)
	{
		
		boolean bl = false;
		
		try
		{
			MDSolicitudTaller datos = new MDSolicitudTaller();
			bl = datos.guardarSolicitudTaller(st, dst);
			System.out.println("Negocio: Solicitud aprobada!!!");
		}
				
	
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Negocio: Error al aprobar la solicitud " + e.getMessage());
		}
		
		return bl;
	}
	
	/** FIN **/
	
	
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
	
	public ArrayList<Taller> cargarTalleres()
	{
		ArrayList < Taller > array = new ArrayList<Taller>();
		MDTaller datos = new MDTaller();
		try
		{
			array = datos.cargarDatos();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		
		return array;
	}
	
	public ArrayList<VwSolicitudDetalles> cargarSolicitudesDetalles(int idSolicitud)
	{
		ArrayList < VwSolicitudDetalles > array = new ArrayList<VwSolicitudDetalles>();
		MDSolicitudTaller datos = new MDSolicitudTaller();
		
		try
		{
			array = datos.cargarDetalles(idSolicitud);
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		
		return array;
	}
	
	public ArrayList<HorarioTaller> cargarComboHorarios()
	{
		ArrayList < HorarioTaller > array = new ArrayList<HorarioTaller>();
		MDHorarioTaller datos = new MDHorarioTaller();
		try
		{
			array = datos.comboHorarioTaller();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		
		return array;
	}
	
	

}
