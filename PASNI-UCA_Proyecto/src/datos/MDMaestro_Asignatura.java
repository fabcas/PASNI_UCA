package datos;

import java.util.ArrayList;
import java.sql.*;
import entidades.VwMaestroAsignatura;

public class MDMaestro_Asignatura extends Conexion{
	
	
	//Devuelve una lista con los registros de la vista (Maestro de Asignatura)
	public ArrayList <VwMaestroAsignatura> cargarDatos()
	{
		ArrayList <VwMaestroAsignatura> lista = new ArrayList <VwMaestroAsignatura>();
		String sql = ("SELECT CODASI, NOMBRE, ACTI FROM Vw_maestro_asignaturas");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				VwMaestroAsignatura asig = new VwMaestroAsignatura();
				
				
				asig.setCODIASI(rs.getString("CODIASI"));
				asig.setNOMBRE(rs.getString("NOMBRE"));
				asig.setACTI(rs.getString("ACTI"));
					
				lista.add(asig);
			}
			
			//Cerramos la conexion
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
