package datos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.DetalleSolicitudTaller;
import entidades.SolicitudTaller;
import entidades.Taller;
import entidades.VwSolicitudDetalles;

public class MDSolicitudTaller extends Conexion{
	
	
	
	public boolean guardarSolicitudTaller(SolicitudTaller st, DetalleSolicitudTaller dst) throws SQLException
	{
		boolean g = false;
		int y = 0;
		
		Connection cn = getConnection();
		CallableStatement cstmt = null;	
		String sql = "{call dbo.SPAgregarSolicitudTaller_DetalleSolicitud(?, ?, ?, ?, ?, 0, ?, ?, ?)}";
		cstmt = cn.prepareCall(sql);			
					
		try {
			
			cstmt.setInt(1,st.getIdProfesor());
			cstmt.setInt(2, st.getHorarioPropuesto());
			cstmt.setDate(3, (Date)st.getFechaSolicitud());
			cstmt.setInt(4,st.getCantidadEstudiantes());
			cstmt.setDate(5, (Date) st.getDiaPropuesto());
			cstmt.setInt(6, dst.getIdTaller1());
			cstmt.setInt(7, dst.getIdTaller2());
			cstmt.setInt(8, dst.getIdTaller3());
			y = cstmt.executeUpdate();
			g = y > 0;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Datos: Error al guardar los datos -> " + e.getMessage());
		}
	
		
		cstmt.close();
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
	
	public ArrayList<VwSolicitudDetalles> cargarDetalles(int idSolicitud){
		
		ArrayList<VwSolicitudDetalles> lista = new ArrayList<VwSolicitudDetalles>();
		String SQL = ("SELECT * FROM VwSolicitudesDetalles WHERE IdSolicitudTaller=?");

		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(SQL);
			ps.setInt(1, idSolicitud);
			ResultSet rs = null;
			rs = ps.executeQuery();

			while (rs.next()) 
			{
				VwSolicitudDetalles vsd = new VwSolicitudDetalles();
				
				vsd.setIdDetalleSolicitudTaller(rs.getInt("IdDetalleSolicitudTaller"));
				vsd.setIdSolicitudTaller(rs.getInt("IdSolicitudTaller"));
				vsd.setNombreTaller(rs.getString("Taller"));
				
				lista.add(vsd);
			}
			ps.close();
			cn.close();
		}
		catch (Exception e)
		{
			System.out.println("Datos, Solicitud Taller, el error es: " + e.getMessage());
			e.printStackTrace();
		}

		return lista;

		
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
				st.setHorario(rs.getString("Horario"));
				st.setFechaSolicitud(rs.getDate("Fecha"));
				st.setDiaPropuesto(rs.getDate("DiaPropuesto"));
				//st.setHorarioPropuesto(rs.getString("Horario"));
				st.setCantidadEstudiantes(rs.getInt("NumeroParticipantes"));
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
				st.setHorario(rs.getString("Horario"));
				st.setFechaSolicitud(rs.getDate("Fecha"));
				st.setDiaPropuesto(rs.getDate("DiaPropuesto"));
				//st.setHorarioPropuesto(rs.getString("Horario"));
				st.setCantidadEstudiantes(rs.getInt("NumeroParticipantes"));
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
				st.setHorario(rs.getString("Horario"));
				st.setFechaSolicitud(rs.getDate("Fecha"));
				st.setDiaPropuesto(rs.getDate("DiaPropuesto"));
				//st.setHorarioPropuesto(rs.getString("Horario"));
				st.setCantidadEstudiantes(rs.getInt("NumeroParticipantes"));
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
	
	public ArrayList < SolicitudTaller  > cargarSolicitudesConDetalles() throws SQLException
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
				st.setHorario(rs.getString("Horario"));
				st.setFechaSolicitud(rs.getDate("Fecha"));
				st.setDiaPropuesto(rs.getDate("DiaPropuesto"));
				//st.setHorarioPropuesto(rs.getString("Horario"));
				st.setCantidadEstudiantes(rs.getInt("NumeroParticipantes"));
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
	
	
	
}
