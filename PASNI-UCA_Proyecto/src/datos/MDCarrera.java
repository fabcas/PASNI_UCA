package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entidades.Carrera;


public class MDCarrera extends Conexion{
	
	public ArrayList <Carrera> comboCarrera(String COFA)
	{
		ArrayList <Carrera> arrayCarrera = new ArrayList <Carrera>();
		String sql = ("select * from Vw_maestro_carreras where COFA = ?");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, COFA);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				Carrera enti = new Carrera();
				
				enti.setCARR(rs.getString("CARR"));
				enti.setNOMBRE(rs.getString("NOMBRE"));
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
