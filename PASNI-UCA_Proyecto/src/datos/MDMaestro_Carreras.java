package datos;

import java.util.*;
import java.sql.*;

import entidades.VwMaestroCarreras;

public class MDMaestro_Carreras extends Conexion{
	
	
	//Devuelve una lista con los registros de la vista (Maestro de Carreras)
	public ArrayList <VwMaestroCarreras> cargarDatos()
	{
		ArrayList <VwMaestroCarreras> lista = new ArrayList <VwMaestroCarreras>();
		String sql = ("SELECT CARR, Ordinal, COFA, NOMBRE, ABREV, ACTI, Pregrado FROM Vw_maestro_carreras");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				VwMaestroCarreras  carr = new VwMaestroCarreras();
				
				
				carr.setCARR(rs.getString("CARR"));
				carr.setOrdinal(rs.getString("Ordinal"));
				carr.setCOFA(rs.getString("COFA"));
				carr.setNOMBRE(rs.getString("NOMBRE"));
				carr.setABREV(rs.getString("ABREV"));
				carr.setACTI(rs.getString("ACTI"));
				carr.setPregrado(rs.getString("Pregrado"));
					
				lista.add(carr);
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
	}
	

}
