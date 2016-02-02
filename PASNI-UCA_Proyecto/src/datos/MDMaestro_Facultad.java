package datos;

import java.sql.*;
import java.util.ArrayList;

import entidades.VwMaestroDeFacultad;

public class MDMaestro_Facultad extends Conexion{
	
	
	//Devuelve una lista con los registros de la vista (Maestro de Facultad)
	public ArrayList < VwMaestroDeFacultad  > cargarDatos()
	{
		ArrayList <VwMaestroDeFacultad> lista = new ArrayList <VwMaestroDeFacultad>();
		String sql = ("SELECT COFA, NOMBRE, ACTI, Pregrado FROM Vw_maestro_facultad");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				VwMaestroDeFacultad  fac = new VwMaestroDeFacultad();
				
				
				fac.setCOFA(rs.getString("COFA"));
				fac.setNOMBRE(rs.getString("NOMBRE"));
				fac.setACTI(rs.getString("ACTI"));
				fac.setPregrado(rs.getString("Pregrado"));
					
				lista.add(fac);
			}
			
			
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("Datos: Error al consultar los datos "+e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
	}//consutar datos
	

}
