package modelo;

import java.sql.*;
import java.util.ArrayList;
import datos.Taller;

public class MDTaller extends Conexion
{
	
	public boolean guardarDt_Taller(Taller enti) throws SQLException
	{
		boolean g = false;
		int y = 0;
		
		Connection cn = getConnection();
		CallableStatement cstmt = null;	
		String sql = "{call dbo.SPAgregarTaller(?,?,?,?,?,'true')}";
		cstmt = cn.prepareCall(sql);			
					
		try {
			
			cstmt.setInt(1,enti.getIdCuatrimestre());
			cstmt.setString(2,enti.getNombre());
			cstmt.setString(3,enti.getDescripcion());
			cstmt.setDate(4, (Date) enti.getFechaInicio());
			cstmt.setDate(5, (Date) enti.getFechaFinal());
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
	public boolean actualizarTaller(Taller enti)
	{
		int x = 0;
		boolean g = false;
				
		try 
		{
		
			Connection cn = getConnection();
			CallableStatement s = null;	
			String sql = "{call dbo.SPActualizarTaller(?,?,?,?,?,?)}";
			s = cn.prepareCall(sql);
			
						System.out.println(enti.getIdCuatrimestre() + ", " + enti.getNombre() + ", " + enti.getDescripcion() + ", " + enti.getFechaInicio() + ", " + enti.getFechaFinal() + ", " + enti.getIdTaller());
						s.setInt(1, enti.getIdCuatrimestre());
						s.setString(2, enti.getNombre());
						s.setString(3, enti.getDescripcion());
						s.setDate(4, (Date) enti.getFechaInicio());
						s.setDate(5, (Date) enti.getFechaFinal());
						s.setInt(6, enti.getIdTaller());
			
			x = s.executeUpdate();
			g = x > 0;
			
			//Cerramos la conexion
			s.close();
			cn.close();
		} 
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("DATOS: ERROR AL ACTUALIZAR LOS DATOS -> "+ e.getMessage());
		}
			
		return g;
	}//actualizar


	//metodo para eliminar logico
	public boolean eliminarTaller(Taller enti ){
		int x = 0;
		boolean el = false;
		
		try{
			Connection cn = getConnection();
			CallableStatement s = null;	
			String sql = "{call dbo.SPEliminarTaller(?)}";
			s = cn.prepareCall(sql);
			
			//s.setBoolean(1, false);
			s.setInt(1, enti.getIdTaller());
			 
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
		ArrayList <Taller> arrayL = new ArrayList <Taller>();
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
					
				arrayL.add(enti);
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
		
		return arrayL;
	}
	
	//Combo cuatrimestre
		/*public ArrayList <Ubic_Pais> ComboPais()
		{
			ArrayList <Ubic_Pais> arrayL = new ArrayList <Ubic_Pais>();
			String sql = ("Select * from Ubic_Pais where Activo= 'true'");
			
			try
			{
				Connection cn = getConnection();
				PreparedStatement ps = cn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
												
				while(rs.next())		
				{					    					
					Ubic_Pais  enti = new Ubic_Pais();
					
					enti.setId_Pais(rs.getInt("Id_Pais"));
					enti.setNombre_Pais(rs.getString("Nombre_Pais"));
					enti.setActivo(rs.getBoolean("Activo"));
					
					arrayL.add(enti);
				}
				
				//Cerramos la conexion
				ps.close();
				cn.close();
			}
			catch(Exception e)
			{
				System.out.println("DATOS: ERROR AL CARGAR COMBO PAIS "+e.getMessage());
				e.printStackTrace();
			}
			
			return arrayL;
		}//combo cuatrimestre
*/
}
