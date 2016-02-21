package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entidades.Facultad;

public class MDFacultad extends Conexion{

	public ArrayList <Facultad> comboFacultad()
	{
		ArrayList <Facultad> arrayFacultad = new ArrayList <Facultad>();
		String sql = ("SELECT idFacultad,nombre FROM Facultad");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				Facultad  enti = new Facultad();
				enti.setIdFacultad(rs.getInt("idFacultad"));
				enti.setNombre(rs.getString("nombre"));
				arrayFacultad.add(enti);
				
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
		
		return arrayFacultad;
	}//combo
}
