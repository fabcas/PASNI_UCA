package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entidades.VwCatalogoTurno;
import entidades.VwMaestroAulas;

public class MD_VwMaestroAulas extends Conexion {
	
	//Devuelve una lista con los registros de la vista (Maestro de Facultad)
			public ArrayList < VwMaestroAulas  > cargarDatos()
			{
				ArrayList <VwMaestroAulas> lista = new ArrayList <VwMaestroAulas>();
				String sql = ("SELECT CODIAULA, CAPA, AP FROM Vw_maestro_aulas;");
				
				try
				{
					Connection cn = getConnection();
					PreparedStatement ps = cn.prepareStatement(sql);
					ResultSet rs = ps.executeQuery();
													
					while(rs.next())		
					{					    					
						VwMaestroAulas a = new VwMaestroAulas();
						
						
						a.setCODIAULA(rs.getString("CODIAULA"));
						a.setCAPA(rs.getInt("CAPA"));
						a.setAP(rs.getString("AP"));	
						lista.add(a);
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
