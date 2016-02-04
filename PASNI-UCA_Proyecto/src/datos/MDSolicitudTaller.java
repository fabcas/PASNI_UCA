package datos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
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
		
		Connection cn = getConnection();
		CallableStatement cstmt = null;	
		String sql = "{call dbo.SPAgregarSolicitudTaller(?,'true',?,?)}";
		cstmt = cn.prepareCall(sql);			
					
		try {
			
			cstmt.setDate(1, (Date) st.getFechaSolicitud());
			cstmt.setInt(2, st.getEstado());
			cstmt.setInt(3, st.getIdProfesor());
			cstmt.setInt(4, st.getIdTaller());
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


	//metodo para eliminar logico
	public boolean eliminarTaller(Taller t){
		
		int x = 0;
		boolean el = false;
		
		try{
			Connection cn = getConnection();
			CallableStatement s = null;	
			String sql = "{call dbo.SPEliminarTaller(?)}";
			s = cn.prepareCall(sql);
			
			//s.setBoolean(1, false);
			s.setInt(1, t.getIdTaller());
			 
			x = s.executeUpdate();
			el = x > 0;
			
			//Cerramos la conexion
			s.close();
			cn.close();
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Error al eliminar los datos -> " + e.getMessage());
		}
		
		return el;
	}//eliminar
	
	//Cargar datos
	public ArrayList < SolicitudTaller  > cargarDatos() throws SQLException
	{
		Connection cn = getConnection();
		CallableStatement s = null;	
		ArrayList < SolicitudTaller > lista = new ArrayList < SolicitudTaller>();
		String sql = "{call dbo.SPListaSolicitudesDeTalleres}";
		s = cn.prepareCall(sql);
		
		try
		{
			ResultSet rs = s.executeQuery();
											
			while(rs.next())		
			{					    					
				SolicitudTaller  st = new SolicitudTaller();
				
				
				st.setIdTaller(rs.getInt("IdSolicitudTaller"));
				//enti.setIdCuatrimestre(rs.getInt("idCuatrimestre"));
				st.setNombreProfesor(rs.getString("Profesor Guia"));
				st.setNombreTaller(rs.getString("Taller"));
				st.setEstado(rs.getInt("Estado"));				
					
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
