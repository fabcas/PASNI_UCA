package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entidades.Profesor;

public class MDProfesor extends Conexion{
	
	public ArrayList<Profesor> buscarProfesor(String inss)
	{
		ArrayList <Profesor> array= new ArrayList <Profesor>();
		String sql = ("select IdProfesor, Nombre, Apellido,Email from ProfesorGuia WHERE Inss = ?");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, inss);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				Profesor pg = new Profesor();
				
				pg.setIdProfesorGuia(rs.getInt("IdProfesor"));
				pg.setNombre(rs.getString("Nombre"));
				pg.setApellido(rs.getString("Apellido"));
				pg.setEmail(rs.getString("Email"));
				array.add(pg);
			}
		
			//Cerramos la conexion
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("Datos: Error al buscar los datos-> "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}

}
