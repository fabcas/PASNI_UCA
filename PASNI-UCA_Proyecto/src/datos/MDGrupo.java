package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entidades.Grupo;

public class MDGrupo extends Conexion{
	
	public ArrayList<Grupo> cargarGrupo(String APER, String CARR){
		
		ArrayList <Grupo> array= new ArrayList <Grupo>();
		String sql = (" SELECT  DISTINCT t.GRUP, a.NOMBRE as nombreA FROM Vw_temporal_notas_semestre t "
				+ "INNER JOIN Vw_maestro_carreras c ON c.CARR = t.CARR "
				+ "INNER JOIN Vw_maestro_asignaturas a ON a.CODIASI = t.CODIASI "
				+ "WHERE APER = ? AND t.CARR = ? ");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, APER);
			ps.setString(2, CARR);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				Grupo g = new Grupo();
				
				g.setGRUP(rs.getString("GRUP"));
				array.add(g);
			}
		
			//Cerramos la conexion
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("Datos: Error al buscar el grupo-> "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	
	}

}
