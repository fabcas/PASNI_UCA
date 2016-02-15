package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entidades.VwCatalogoTurno;
import entidades.VwMaestroDias;

public class MD_VwMaestroDias extends Conexion{
	
	//Devuelve una lista con los registros de la vista (Maestro de Facultad)
			public ArrayList < VwMaestroDias  > cargarDatos()
			{
				ArrayList <VwMaestroDias> lista = new ArrayList <VwMaestroDias>();
				String sql = ("SELECT CODIA, NOMBRE FROM Vw_maestro_dias;");
				
				try
				{
					Connection cn = getConnection();
					PreparedStatement ps = cn.prepareStatement(sql);
					ResultSet rs = ps.executeQuery();
													
					while(rs.next())		
					{					    					
						VwMaestroDias  d = new VwMaestroDias();
						
						
						d.setCODIA(rs.getInt("CodCurso"));
						d.setNOMBRE(rs.getString("Descripcion"));
							
						lista.add(d);
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
