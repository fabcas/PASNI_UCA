package datos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.SolicitudTaller;
import entidades.Taller;

public class MDSolicitudTaller extends Conexion{
	
	
	
	public boolean guardarSolicitudTaller(SolicitudTaller st) throws SQLException
	{
		boolean g = false;
		int y = 0;
		
		
		String sql = "INSERT INTO SolicitudTaller (IdProfesor, IdTaller, Fecha, Estado, HorarioPropuesto) "
				+ "VALUES (?,?,?,0,?);";
		
		Connection cn = getConnection();
		PreparedStatement s = cn.prepareStatement(sql);
		   
		s = cn.prepareCall(sql);			
					
		try {
			
			s.setInt(1, st.getIdProfesor());
			s.setInt(2, st.getIdTaller());
			s.setDate(3, (Date) st.getFechaSolicitud());
			//s.setInt(4, st.getEstado());
			s.setString(4, st.getHorarioPropuesto());
			
			y = s.executeUpdate();
			g = y > 0;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Datos: Error al guardar los datos -> " + e.getMessage());
		}
	
		
		s.close();
		cn.close();
		return g;
	}//guardar
	
	
	
	//M?todo Actualizar
	public boolean actualizarSolicitudTaller(Taller t)
	{
		int x = 0;
		boolean g = false;
				
		try 
		{
		
			Connection cn = getConnection();
			CallableStatement s = null;	
			String sql = "{call dbo.SPActualizarTaller2(?,?,?,?,?,?)}";
			s = cn.prepareCall(sql);
			
						//System.out.println(t.getIdCuatrimestre() + ", " + enti.getNombre() + ", " + enti.getDescripcion() + ", " + enti.getFechaInicio() + ", " + enti.getFechaFinal() + ", " + enti.getIdTaller());
						s.setInt(1, t.getIdCuatrimestre());
						s.setString(2, t.getNombre());
						s.setString(3, t.getDescripcion());
						s.setDate(4, (Date) t.getFechaInicio());
						s.setDate(5, (Date) t.getFechaFinal());
						s.setInt(6, t.getIdTaller());
			
			x = s.executeUpdate();
			g = x > 0;
			
			//Cerramos la conexion
			s.close();
			cn.close();
		} 
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("Datos: Error al actualizar los datos -> "+ e.getMessage());
		}
			
		return g;
	}//actualizar


	
	/** Métodos **/
	
	public boolean aprobarSolicitud(SolicitudTaller st)
	{
		int x = 0;
		boolean el = false;
		
		try{
			String sql = "UPDATE SolicitudTaller SET Estado = ? WHERE IdSolicitudTaller = ?";
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			
			ps.setInt(1, st.getEstado());
			ps.setInt(2, st.getIdSolicitudTaller());
			
			
			x = ps.executeUpdate();
			el = x > 0;
			
			//Cerramos la conexion
			ps.close();
			cn.close();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Error al aprobar la solicitud -> " + e.getMessage());
		}
		return el;
	}
	
	
	//Solicitudes pendientes
	public ArrayList < SolicitudTaller  > cargarSolicitudesPendientes() throws SQLException
	{
		Connection cn = getConnection();
		CallableStatement s = null;	
		ArrayList < SolicitudTaller > lista = new ArrayList < SolicitudTaller>();
		String sql = "{call dbo.SPListaSolicitudesPendientes}";
		s = cn.prepareCall(sql);
		
		try
		{
			ResultSet rs = s.executeQuery();
											
			while(rs.next())		
			{					    					
				SolicitudTaller  st = new SolicitudTaller();
				
				
				st.setIdSolicitudTaller(rs.getInt("IdSolicitudTaller"));
				//enti.setIdCuatrimestre(rs.getInt("idCuatrimestre"));
				st.setNombreProfesor(rs.getString("Profesor"));
				st.setNombreTaller(rs.getString("Taller"));
				st.setFechaSolicitud((Date) rs.getDate("Fecha"));
				st.setCadenaEstado(rs.getString("Estado"));				
					
				lista.add(st);
			}
			
			//Cerramos la conexion
			s.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("DATOS: ERROR AL CONSULTAR LOS DATOS "+e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
	}
	
	//Solicitudes aprobadas
	public ArrayList < SolicitudTaller  > cargarSolicitudesAprobadas() throws SQLException
	{
		Connection cn = getConnection();
		CallableStatement s = null;	
		ArrayList < SolicitudTaller > lista = new ArrayList < SolicitudTaller>();
		String sql = "{call dbo.SPListaSolicitudesAprobadas}";
		s = cn.prepareCall(sql);
		
		try
		{
			ResultSet rs = s.executeQuery();
											
			while(rs.next())		
			{					    					
				SolicitudTaller  st = new SolicitudTaller();
				
				
				st.setIdSolicitudTaller(rs.getInt("IdSolicitudTaller"));
				//enti.setIdCuatrimestre(rs.getInt("idCuatrimestre"));
				st.setNombreProfesor(rs.getString("Profesor"));
				st.setNombreTaller(rs.getString("Taller"));
				st.setFechaSolicitud((Date) rs.getDate("Fecha"));
				st.setCadenaEstado(rs.getString("Estado"));				
					
				lista.add(st);
			}
			
			//Cerramos la conexion
			s.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("DATOS: ERROR AL CONSULTAR LOS DATOS "+e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
	}
	
	//Solicitudes desaprobadas
	public ArrayList < SolicitudTaller  > cargarSolicitudesDesaprobadas() throws SQLException
	{
		Connection cn = getConnection();
		CallableStatement s = null;	
		ArrayList < SolicitudTaller > lista = new ArrayList < SolicitudTaller>();
		String sql = "{call dbo.SPListaSolicitudesDesaprobadas}";
		s = cn.prepareCall(sql);
		
		try
		{
			ResultSet rs = s.executeQuery();
											
			while(rs.next())		
			{					    					
				SolicitudTaller  st = new SolicitudTaller();
				
				
				st.setIdSolicitudTaller(rs.getInt("IdSolicitudTaller"));
				//enti.setIdCuatrimestre(rs.getInt("idCuatrimestre"));
				st.setNombreProfesor(rs.getString("Profesor"));
				st.setNombreTaller(rs.getString("Taller"));
				st.setFechaSolicitud((Date) rs.getDate("Fecha"));
				st.setCadenaEstado(rs.getString("Estado"));				
					
				lista.add(st);
			}
			
			//Cerramos la conexion
			s.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("DATOS: ERROR AL CONSULTAR LOS DATOS "+e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
	}
	
	
	/** Calcula cuántas veces se repite un mismo taller. **/
	public int cantidadSolicitadaDelTaller(SolicitudTaller st) throws SQLException
	{
		int x = 0;
		Connection cn = getConnection();
		CallableStatement s = null;	
		
		String sql = "{call dbo.SPTotalDeSolicitudesDeUnTaller_PorCuatrimestre(?)}";
		s = cn.prepareCall(sql);
		
			
		
		x = s.executeUpdate(sql);
		
		
		
		return x;
		
	}
	
	
	

}
