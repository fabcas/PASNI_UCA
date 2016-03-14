package datos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Rol;
import entidades.Taller;

public class MDRol extends Conexion{
	
	public boolean guardarRol(Rol r) throws SQLException
	{
		boolean g = false;
		int y = 0;
		
		try
		{
		
			String SQL= ("INSERT INTO Rol (nombre, descripcion, activo) VALUES (?, ? , 1)");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(SQL);
		
			   
				s.setString(1, r.getNombre());
				s.setString(2, r.getDescripcion());
				//s.setBoolean(3, r.isActivo());
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
	}//guardar
	
	
	
	//M?todo Actualizar
	public boolean actualizarRol(Rol r)
	{
		boolean g = false;
		int y = 0;
		
		try
		{
		
			String SQL= ("UPDATE Rol SET nombre=?, descripcion=? WHERE idRol=?");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(SQL);
		
			   
				s.setString(1, r.getNombre());
				s.setString(2, r.getDescripcion());
				s.setInt(3, r.getIdRol());
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
		
	}//actualizar


	//metodo para eliminar logico
	public boolean eliminarRol(Rol r){
		
		boolean el = false;
		int y = 0;
		
		try
		{
		
			String SQL= ("UPDATE Rol SET activo = 0 WHERE idRol=?");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(SQL);
		
				s.setInt(1, r.getIdRol());
				
				
			y = s.executeUpdate();
			el = y >0;
			
			//Cerramos la conexion
			s.close();
			cn.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("DATOS: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		}
		
		
		return el;
	}//eliminar
	
	
	public boolean existencia(int IdRol)
	{
		boolean existe=false;
		try
		{
			String sql = ("SELECT * FROM Rol WHERE idRol=?");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(sql);
			
			s.setInt(1, IdRol);
			
			ResultSet rs = s.executeQuery();
			if(rs.next())
			{
				existe = true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("DATOS: AL PARECER EL DATO, NO EXISTE"+e.getMessage());
		}
		
		return existe;
	}
	
	//Cargar datos
	public ArrayList < Rol  > cargarDatos()
	{
		ArrayList <Rol> array = new ArrayList <Rol>();
		CallableStatement s = null;	
		String sql = ("SELECT idRol, nombre, descripcion FROM Rol WHERE activo = 1");
		
		try
		{
			Connection cn = getConnection();
			s = cn.prepareCall(sql);
			ResultSet rs = s.executeQuery();
											
			while(rs.next())		
			{					    					
				Rol enti = new Rol();
				
				
				enti.setIdRol(rs.getInt("idRol"));
				enti.setNombre(rs.getString("nombre"));
				enti.setDescripcion(rs.getString("descripcion"));
					
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
