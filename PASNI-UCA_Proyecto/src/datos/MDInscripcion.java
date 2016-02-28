package datos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Inscripcion;
import entidades.Monitor;
import entidades.Taller;

public class MDInscripcion extends Conexion{
	
	public boolean ingresarSolicitud(Inscripcion i, Monitor m) throws SQLException 
	{
		boolean g = false;
		int y = 0;
		
		Connection cn = getConnection();
		CallableStatement cstmt = null;	
		String sql = "{call dbo.SPInsertarInscripcion(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
		cstmt = cn.prepareCall(sql);
					
		try {
			/*Monitor*/

			cstmt.setString("primerNombre", m.getPrimerNombre());
			cstmt.setString("segundoNombre", m.getSegundoNombre());
			cstmt.setString("primerApellido", m.getPrimerApellido());
			cstmt.setString("segundoApellido", m.getPrimerApellido());
			cstmt.setString("email", m.getEmail());
			cstmt.setString("telefono", m.getTelefono());
			cstmt.setString("carne", m.getCarne());
			cstmt.setFloat("promedio", m.getPromedio());
			cstmt.setInt("idCarrera", m.getIdCarrera());
			cstmt.setBoolean("estipendio", m.isEstipendio());
			
			/*Inscripcion*/
			
			cstmt.setInt("idAsignatura",i.getIdAsignatura());
			cstmt.setString("motivo", i.getMotivo());
			cstmt.setInt("calificacion", i.getCalificación());
			cstmt.setString("turno", i.getTurno());
			y = cstmt.executeUpdate();
			g = y > 0;
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Datos: Error al enviar la solicitud-> " + e.getMessage());
		}
		cstmt.close();
		cn.close();
		return g;
	}
	
	//Cargar datos
	public ArrayList <Inscripcion> cargarDatosI()
	{
		ArrayList <Inscripcion> array = new ArrayList <Inscripcion>();
		CallableStatement s = null;	
		String sql = ("{call dbo.SPListaInscripcionMonitor}");
		
		try
		{
			Connection cn = getConnection();
			s = cn.prepareCall(sql);
			ResultSet rs = s.executeQuery();
											
			while(rs.next())		
			{					    					
				Inscripcion  i = new Inscripcion();
				
				i.setIdInscripcion(rs.getInt("idInscripcion"));
				i.setIdMonitor(rs.getInt("idMonitor"));
				i.setIdAsignatura(rs.getInt("idAsignatura"));
				i.setFecha(rs.getDate("fecha"));
				i.setMotivo(rs.getString("motivo"));
				i.setCalificación(rs.getInt("calificacion"));
				i.setTurno(rs.getString("turno"));
				i.setEstado(rs.getBoolean("estado"));					
				array.add(i);
			}
			
			//Cerramos la conexion
			s.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("DATOS: ERROR AL CONSULTAR LOS DATOS "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}
	

}
