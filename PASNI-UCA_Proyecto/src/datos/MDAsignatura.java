package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entidades.Asignatura;

public class MDAsignatura extends Conexion{
	
	public ArrayList <Asignatura> comboAsignatura()
	{
		ArrayList <Asignatura> arrayAsignatura = new ArrayList <Asignatura>();
		String sql = ("SELECT idAsignatura, nombreA FROM Asignatura");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				Asignatura enti = new Asignatura();
				
				enti.setIdAsigntatura(rs.getInt("idAsignatura"));
				enti.setNombre(rs.getString("nombreA"));
				arrayAsignatura.add(enti);
			}
			
			//Cerramos la conexion
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("Datos: Error al cargar la lista de Asignatura -> "+e.getMessage());
			e.printStackTrace();
		}
		
		return arrayAsignatura;
	}//combo

}
