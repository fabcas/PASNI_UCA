package datos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Facilitador;
import entidades.InstanciasUCA;

public class MDInstanciasUCA extends Conexion{
	
	
	
	public boolean guardarInstancias(InstanciasUCA iu) throws SQLException
	{
		boolean g = false;
		int y = 0;
		
		try
		{
		
			String SQL= ("INSERT INTO InstanciasUCA (Nombre, Descripcion, Estado) VALUES (?, ? , 1)");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(SQL);
		
			   
				s.setString(1, iu.getNombre());
				s.setString(2, iu.getDescripcion());
				
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
	public boolean actualizarInstancias(InstanciasUCA iu)
	{
		boolean g = false;
		int y = 0;
		
		try
		{
		
			String SQL= ("UPDATE InstanciasUCA SET Nombre=?, Descripcion=? WHERE IdInstancia=?");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(SQL);
		
			   
				s.setString(1, iu.getNombre());
				s.setString(2, iu.getDescripcion());
				s.setInt(3, iu.getIdInstancia());
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
			System.out.println("DATOS: ERROR AL MODIFICAR LOS DATOS " + e.getMessage());
		}
		
		
		return g;
		
	}//actualizar


	//metodo para eliminar logico
	public boolean eliminarInstancias(InstanciasUCA iu){
		
		boolean el = false;
		int y = 0;
		
		try
		{
		
			String SQL= ("UPDATE InstanciasUCA SET Estado = 0 WHERE IdInstancia=?");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(SQL);
		
				s.setInt(1, iu.getIdInstancia());
				
			y = s.executeUpdate();
			el = y >0;
			
			//Cerramos la conexion
			s.close();
			cn.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("DATOS: ERROR AL ELIMINAR LOS DATOS " + e.getMessage());
		}
		
		
		return el;
	}//eliminar
	
	
	public boolean existencia(int IdInstancia)
	{
		boolean existe=false;
		try
		{
			String sql = ("SELECT * FROM InstanciasUCA WHERE IdInstancia=?");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(sql);
			
			s.setInt(1, IdInstancia);
			
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
	public ArrayList < InstanciasUCA  > cargarDatos()
	{
		ArrayList <InstanciasUCA> array = new ArrayList <InstanciasUCA>();
		CallableStatement s = null;	
		String sql = ("SELECT IdInstancia, Nombre, Descripcion FROM InstanciasUCA WHERE Estado = 1;");
		
		try
		{
			Connection cn = getConnection();
			s = cn.prepareCall(sql);
			ResultSet rs = s.executeQuery();
											
			while(rs.next())		
			{					    					
				InstanciasUCA enti = new InstanciasUCA();
				
				
				enti.setIdInstancia(rs.getInt("IdInstancia"));
				enti.setNombre(rs.getString("Nombre"));
				enti.setDescripcion(rs.getString("Descripcion"));
							
					
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
