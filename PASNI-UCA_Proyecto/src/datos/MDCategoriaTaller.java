package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entidades.CategoriaTaller;

public class MDCategoriaTaller extends Conexion{
	
	public boolean guardarCategoria(CategoriaTaller c)
	{
		boolean g = false;
		int y = 0;
		
		try
		{
		
			String SQL= ("INSERT INTO CategoriaTaller (Nombre, Descripcion, Activo) VALUES (?, ? , 1)");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(SQL);
		
			   
				s.setString(1, c.getNombre());
				s.setString(2, c.getDescripcion());
				//s.setBoolean(3, c.isActivo());
				
				
			y = s.executeUpdate();
			g = y >0;
			
			//Cerramos la conexion
			s.close();
			cn.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("DATOS: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		}
		
		
		return g;
	}
	
	public boolean actualizarCategoria(CategoriaTaller c)
	{
		boolean g = false;
		int y = 0;
		
		try
		{
		
			String SQL= ("UPDATE CategoriaTaller SET Nombre=?, Descripcion=? WHERE IdCategoria=?");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(SQL);
		
			   
				s.setString(1, c.getNombre());
				s.setString(2, c.getDescripcion());
				s.setInt(3, c.getIdCategoria());
				
				
			y = s.executeUpdate();
			g = y >0;
			
			//Cerramos la conexion
			s.close();
			cn.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("DATOS: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		}
		
		
		return g;
	}
	
	public boolean eliminarCategoria(CategoriaTaller c)
	{
		boolean g = false;
		int y = 0;
		
		try
		{
		
			String SQL= ("UPDATE CategoriaTaller SET Activo = 0 WHERE IdCategoria=?");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(SQL);
		
				s.setInt(1, c.getIdCategoria());
				
				
			y = s.executeUpdate();
			g = y >0;
			
			//Cerramos la conexion
			s.close();
			cn.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("DATOS: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		}
		
		
		return g;
	}
	
	public ArrayList <CategoriaTaller> cargarDatos()
	{
		ArrayList <CategoriaTaller> array = new ArrayList <CategoriaTaller>();
		String sql = ("SELECT * FROM CategoriaTaller WHERE Activo = 1 ORDER BY Nombre");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				CategoriaTaller  ct = new CategoriaTaller();
				
				
				ct.setIdCategoria(rs.getInt("IdCategoria"));
				ct.setNombre(rs.getString("Nombre"));
				ct.setDescripcion(rs.getString("Descripcion"));
				
				array.add(ct);
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
	}//consutar datos
	
	

}
