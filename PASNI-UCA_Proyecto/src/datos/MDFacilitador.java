package datos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Facilitador;
import entidades.Rol;

public class MDFacilitador extends Conexion{
	
	public boolean guardarFacilitador(Facilitador f) throws SQLException
	{
		boolean g = false;
		int y = 0;
		
		try
		{
		
			String SQL= ("INSERT INTO Facilitador (PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido) VALUES (?, ? , ? , ?)");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(SQL);
		
			   
				s.setString(1, f.getPrimerNombre());
				s.setString(2, f.getSegundoNombre());
				s.setString(3, f.getPrimerApellido());
				s.setString(4, f.getSegundoApellido());
								
				
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
	public boolean actualizarFacilitador(Facilitador f)
	{
		boolean g = false;
		int y = 0;
		
		try
		{
		
			String SQL= ("UPDATE Facilitador SET PrimerNombre=?, SegundoNombre=?, PrimerApellido=?, SegundoApellido=? WHERE IdFacilitador=?");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(SQL);
		
			   
				s.setString(1, f.getPrimerNombre());
				s.setString(2, f.getSegundoNombre());
				s.setString(3, f.getPrimerApellido());
				s.setString(4, f.getSegundoApellido());
				s.setInt(5, f.getIdFacilitador());
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
	public boolean eliminarFacilitador(Facilitador f){
		
		boolean el = false;
		int y = 0;
		
		try
		{
		
			String SQL= ("UPDATE Facilitador SET Estado = 0 WHERE IdFacilitador=?");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(SQL);
		
				s.setInt(1, f.getIdFacilitador());
				
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
	
	
	public boolean existencia(int IdFacilitador)
	{
		boolean existe=false;
		try
		{
			String sql = ("SELECT * FROM Facilitador WHERE IdFacilitador=?");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(sql);
			
			s.setInt(1, IdFacilitador);
			
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
	public ArrayList < Facilitador  > cargarDatos()
	{
		ArrayList <Facilitador> array = new ArrayList <Facilitador>();
		CallableStatement s = null;	
		String sql = ("SELECT IdFacilitador, PrimerNombre, SegundoNombre, PrimerApellido, SegundoApellido FROM Facilitador");
		
		try
		{
			Connection cn = getConnection();
			s = cn.prepareCall(sql);
			ResultSet rs = s.executeQuery();
											
			while(rs.next())		
			{					    					
				Facilitador enti = new Facilitador();
				
				
				enti.setIdFacilitador(rs.getInt("IdFacilitador"));
				enti.setPrimerNombre(rs.getString("PrimerNombre"));
				enti.setSegundoNombre(rs.getString("SegundoNombre"));
				enti.setPrimerApellido(rs.getString("PrimerApellido"));
				enti.setSegundoApellido(rs.getString("SegundoApellido"));
				
					
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
