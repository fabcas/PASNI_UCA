package datos;

import java.sql.*;
import java.util.ArrayList;

import entidades.VwAlumnosUCA;

public class MDAlumnos_UCA extends Conexion{
	
	
	//Devuelve una lista con los registros de la vista (VwAlumnosUCA)
	public ArrayList <VwAlumnosUCA> cargarDatos()
	{
		ArrayList < VwAlumnosUCA > lista = new ArrayList <VwAlumnosUCA>();
		String sql = ("SELECT NCAR, S_Primer_nombre, S_Primer_apellido, TELEFRESI, NOMB FROM Vw_alumnos_uca");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				VwAlumnosUCA  alum = new VwAlumnosUCA();				
				
				alum.setNCAR(rs.getString("NCAR"));
				alum.setS_Primer_nombre(rs.getString("S_Primer_nombre"));
				alum.setS_Primer_apellido(rs.getString("S_Primer_apellido"));
				alum.setTELEFRESI(rs.getString("TELEFRESI"));
				alum.setNOMB(rs.getString("NOMB"));
					
				lista.add(alum);
			}
			
			
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("Datos: Error al consultas los datos: "+e.getMessage());
			e.printStackTrace();
		}
		
		return lista;
	}
	
	

}
