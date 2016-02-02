package datos;

import java.sql.*;
import java.util.ArrayList;

import entidades.Cuatrimestre;
import entidades.Taller;

public class MDTaller extends Conexion
{
	
	public boolean guardarDt_Taller(Taller t) throws SQLException
	{
		boolean g = false;
		int y = 0;
		
		Connection cn = getConnection();
		CallableStatement cstmt = null;	
		String sql = "{call dbo.SPAgregarTaller(?,?,?,?,?,'true')}";
		cstmt = cn.prepareCall(sql);			
					
		try {
			
			cstmt.setInt(1,t.getIdCuatrimestre());
			cstmt.setString(2,t.getNombre());
			cstmt.setString(3,t.getDescripcion());
			cstmt.setDate(4, (Date) t.getFechaInicio());
			cstmt.setDate(5, (Date) t.getFechaFinal());
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
	public boolean actualizarTaller(Taller t)
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
	public ArrayList < Taller  > cargarDatos()
	{
		ArrayList <Taller> array = new ArrayList <Taller>();
		String sql = ("SELECT t.IdTaller, t.Nombre, t.Descripcion, c.nombre [Cuatrimestre], t.FechaInicio, t.FechaFin"+
						" FROM Taller t, Cuatrimestre c " +
							" WHERE t.idCuatrimestre = c.idCuatrimestre " +
								" AND t.Estado = 'true' ORDER BY t.IdTaller ASC");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				Taller  enti = new Taller();
				
				
				enti.setIdTaller(rs.getInt("IdTaller"));
				//enti.setIdCuatrimestre(rs.getInt("idCuatrimestre"));
				enti.setNombreCuatrimestre(rs.getString("Cuatrimestre"));
				enti.setNombre(rs.getString("Nombre"));
				enti.setDescripcion(rs.getString("Descripcion"));
				enti.setFechaInicio(rs.getDate("FechaInicio"));
				enti.setFechaFinal(rs.getDate("FechaFin"));				
					
				array.add(enti);
			}
			
			//Cerramos la conexion
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("DATOS: ERROR AL CONSULTAR LOS DATOS "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}
	
	//Combo cuatrimestre
		public ArrayList <Cuatrimestre> comboCuatrimestre()
		{
			ArrayList <Cuatrimestre> arrayCuatrimestre = new ArrayList <Cuatrimestre>();
			String sql = ("SELECT idCuatrimestre, nombre FROM Cuatrimestre;");
			
			try
			{
				Connection cn = getConnection();
				PreparedStatement ps = cn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
												
				while(rs.next())		
				{					    					
					Cuatrimestre  enti = new Cuatrimestre();
					
					enti.setIdCuatrimestre(rs.getInt("idCuatrimestre"));
					enti.setNombre(rs.getString("nombre"));
					arrayCuatrimestre.add(enti);
				}
				
				//Cerramos la conexion
				ps.close();
				cn.close();
			}
			catch(Exception e)
			{
				System.out.println("Datos: Error al cargar la lista de cuatrimestre -> "+e.getMessage());
				e.printStackTrace();
			}
			
			return arrayCuatrimestre;
		}//combo cuatrimestre

}
