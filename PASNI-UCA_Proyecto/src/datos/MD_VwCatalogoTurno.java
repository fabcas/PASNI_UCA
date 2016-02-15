package datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entidades.VwCatalogoTurno;

public class MD_VwCatalogoTurno extends Conexion{

	//Devuelve una lista con los registros de la vista (Maestro de Facultad)
		public ArrayList < VwCatalogoTurno  > cargarDatos()
		{
			ArrayList <VwCatalogoTurno> lista = new ArrayList <VwCatalogoTurno>();
			String sql = ("SELECT CodCurso, Descripcion FROM Vw_catalogo_turno;");
			
			try
			{
				Connection cn = getConnection();
				PreparedStatement ps = cn.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
												
				while(rs.next())		
				{					    					
					VwCatalogoTurno  ct = new VwCatalogoTurno();
					
					
					ct.setCodCurso(rs.getString("CodCurso"));
					ct.setDescripcion(rs.getString("Descripcion"));
						
					lista.add(ct);
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
