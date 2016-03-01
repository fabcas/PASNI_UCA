package datos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Inscripcion;
import entidades.InscripcionMonitor;
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
	public ArrayList <InscripcionMonitor> cargarDatosI()
	{
		ArrayList <InscripcionMonitor> array = new ArrayList <InscripcionMonitor>();
		CallableStatement s = null;	
		String sql = ("{call dbo.SPListaSolicitudMonitor}");
		
		try
		{
			Connection cn = getConnection();
			s = cn.prepareCall(sql);
			ResultSet rs = s.executeQuery();
											
			while(rs.next())		
			{					    					
				InscripcionMonitor  i = new InscripcionMonitor();
				
				i.setIdInscripcion(rs.getInt("idInscripcion"));
				i.setIdMonitor(rs.getInt("idMonitor"));
				i.setPrimerNombre(rs.getString("primerNombre"));
				i.setSegundoNombre(rs.getString("segundoNombre"));
				i.setPrimerApellido(rs.getString("primerApellido"));
				i.setSegundoApellido(rs.getString("segundoNombre"));
				i.setCarne(rs.getString("carne"));
				i.setTelefono(rs.getString("telefono"));
				i.setEmail(rs.getString("email"));
				i.setNombreC(rs.getString("nombre"));
				i.setPromedio(rs.getFloat("promedio"));
				i.setEstipendio(rs.getBoolean("estipendio"));
				i.setNombreA(rs.getString("nombre"));
				i.setCalificacion(rs.getInt("calificacion"));
				i.setMotivo(rs.getString("motivo"));
				i.setTurno(rs.getString("turno"));
				i.setFecha(rs.getDate("fecha"));
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
