package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entidades.Monitor;

public class MDMonitor extends Conexion{

	public ArrayList <Monitor> buscarMonitorC(String carne)
	{
		ArrayList <Monitor> array= new ArrayList <Monitor>();
		String sql = ("select idMonitor, primerNombre, segundoNombre, primerApellido, segundoApellido from Monitor WHERE carne = ?");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, carne);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				Monitor m = new Monitor();
				
				m.setIdMonitor(rs.getInt("idMonitor"));
				m.setPrimerNombre(rs.getString("primerNombre"));
				m.setSegundoNombre(rs.getString("segundoNombre"));
				m.setPrimerApellido(rs.getString("primerApellido"));
				m.setSegundoApellido(rs.getString("segundoApellido"));
				array.add(m);
			}
			
			//Cerramos la conexion
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("Datos: Error al buscar al monitor-> "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}//combo
}
