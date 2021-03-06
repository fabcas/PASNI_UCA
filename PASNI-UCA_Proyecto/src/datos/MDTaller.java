package datos;

import java.sql.*;
import java.util.ArrayList;

import entidades.CategoriaTaller;
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
		String sql = "{call dbo.SPAgregarTaller(?,?,?,?,?,?,1)}";
		cstmt = cn.prepareCall(sql);			
					
		try {
			
			cstmt.setInt(1,t.getIdCuatrimestre());
			cstmt.setInt(2, t.getIdCategoria());
			cstmt.setString(3,t.getNombre());
			cstmt.setString(4,t.getDescripcion());
			cstmt.setDate(5, (Date) t.getFechaInicio());
			cstmt.setDate(6, (Date) t.getFechaFinal());
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
			String sql = "{call dbo.SPActualizarTaller2(?,?,?,?,?,?,?)}";
			s = cn.prepareCall(sql);
			
						//System.out.println(t.getIdCuatrimestre() + ", " + enti.getNombre() + ", " + enti.getDescripcion() + ", " + enti.getFechaInicio() + ", " + enti.getFechaFinal() + ", " + enti.getIdTaller());
						s.setInt(1, t.getIdCuatrimestre());
						s.setInt(2, t.getIdCategoria());
						s.setString(3, t.getNombre());
						s.setString(4, t.getDescripcion());
						s.setDate(5, (Date) t.getFechaInicio());
						s.setDate(6, (Date) t.getFechaFinal());
						s.setInt(7, t.getIdTaller());
			
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
		CallableStatement s = null;	
		String sql = ("{call dbo.SPListaDeTalleresDeFormacion}");
		
		try
		{
			Connection cn = getConnection();
			s = cn.prepareCall(sql);
			ResultSet rs = s.executeQuery();
											
			while(rs.next())		
			{					    					
				Taller  enti = new Taller();
				
				
				enti.setIdTaller(rs.getInt("IdTaller"));
				//enti.setIdCuatrimestre(rs.getInt("idCuatrimestre"));
				enti.setNombreCuatrimestre(rs.getString("Cuatrimestre"));
				enti.setNombreCategoria(rs.getString("Categoria"));
				enti.setNombre(rs.getString("Nombre"));
				enti.setDescripcion(rs.getString("Descripcion"));
				enti.setFechaInicio(rs.getDate("FechaInicio"));
				enti.setFechaFinal(rs.getDate("FechaFin"));				
					
				array.add(enti);
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
		
		public ArrayList <CategoriaTaller> comboCategoria()
		{
			ArrayList <CategoriaTaller> arrayCategoria = new ArrayList <CategoriaTaller>();
			String sql = ("SELECT IdCategoria, Nombre FROM CategoriaTaller WHERE Activo = 1;");
			
			try
			{
				Connection cn = getConnection();
				PreparedStatement ps = cn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
												
				while(rs.next())		
				{					    					
					CategoriaTaller  enti = new CategoriaTaller();
					
					enti.setIdCategoria(rs.getInt("IdCategoria"));
					enti.setNombre(rs.getString("Nombre"));
					arrayCategoria.add(enti);
				}
				
				//Cerramos la conexion
				ps.close();
				cn.close();
			}
			catch(Exception e)
			{
				System.out.println("Datos: Error al cargar la lista de categor�a -> "+e.getMessage());
				e.printStackTrace();
			}
			
			return arrayCategoria;
		}//combo cuatrimestre
		
		/** Lista de talleres de formaci�n, pero con fecha convertida al formato adecuado. **/
		
		
		//Cargar datos
		public ArrayList < Taller  > cargarDatos2()
		{
			ArrayList <Taller> array = new ArrayList <Taller>();
			CallableStatement s = null;	
			String sql = ("SELECT t.IdTaller, t.Nombre, t.Descripcion, c.nombre [Cuatrimestre], ct.Nombre [Categoria], (Select convert(varchar(10), t.FechaInicio, 103))  AS [FechaInicio], (Select convert (varchar(10), t.FechaFin, 103)) AS [FechaFin] "+
						 " FROM Taller t, Cuatrimestre c, CategoriaTaller ct"+ 
							 " WHERE t.idCuatrimestre = c.idCuatrimestre"+ 
							 " AND ct.IdCategoria = t.IdCategoria "+
								 " AND t.Estado = 'True' ORDER BY t.IdTaller ASC;");
			
			try
			{
				Connection cn = getConnection();
				s = cn.prepareCall(sql);
				ResultSet rs = s.executeQuery();
												
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
				s.close();
				cn.close();
			}
			catch(Exception e)
			{
				System.out.println("DATOS: ERROR AL CONSULTAR LOS DATOS "+e.getMessage());
				e.printStackTrace();
			}
			
			return array;
		}
		

}
