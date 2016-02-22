package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entidades.Carrera;


public class MDCarrera extends Conexion{
	
	public ArrayList <Carrera> comboCarrera(int id)
	{
		ArrayList <Carrera> arrayCarrera = new ArrayList <Carrera>();
		String sql = ("SELECT idCarrera, nombre FROM Carrera WHERE idFacultad = ?");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				Carrera enti = new Carrera();
				
				enti.setIdCarrera(rs.getInt("idCarrera"));
				enti.setNombre(rs.getString("nombre"));
				arrayCarrera.add(enti);
			}
			
			//Cerramos la conexion
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("Datos: Error al cargar la lista de carrera -> "+e.getMessage());
			e.printStackTrace();
		}
		
		return arrayCarrera;
	}//combo

}
