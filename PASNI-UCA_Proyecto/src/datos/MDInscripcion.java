package datos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import entidades.Inscripcion;
import entidades.InscripcionMonitor;
import entidades.Monitor;
import entidades.PerfilMonitor;

public class MDInscripcion extends Conexion{
	
	//Agregar SPInsertarInscripcionM
	public boolean ingresarSolicitud(Inscripcion i, Monitor m) throws SQLException 
	{
		boolean g = false;
		int y = 0;
		
		Connection cn = getConnection();
		CallableStatement cstmt = null;	
		String sql = "{call dbo.SPInsertarInscripcion(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
		cstmt = cn.prepareCall(sql);
					
		try {
			/*Monitor*/

			cstmt.setString("primerNombre", m.getPrimerNombre());
			cstmt.setString("segundoNombre", m.getSegundoNombre());
			cstmt.setString("primerApellido", m.getPrimerApellido());
			cstmt.setString("segundoApellido", m.getSegundoApellido());
			cstmt.setString("email", m.getEmail());
			cstmt.setString("telefono", m.getTelefono());
			cstmt.setString("carne", m.getCarne());
			cstmt.setFloat("promedio", m.getPromedio());
			cstmt.setString("CARR", m.getCARR());
			
			/*Inscripcion*/
			
			cstmt.setString("idAsignatura",i.getIdAsignatura());
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
	
	public boolean agregarInscripcion(Inscripcion i) throws SQLException 
	{
		boolean g = false;
		int y = 0;
		
		Connection cn = getConnection();
		CallableStatement cstmt = null;	
		String sql = "{call dbo.SPAgregarInscripcion(?,?,?,?,?,?)}";
		cstmt = cn.prepareCall(sql);
					
		try {			
			cstmt.setInt("idMonitor",i.getIdMonitor());
			cstmt.setString("idAsignatura",i.getIdAsignatura());
			cstmt.setInt("calificacion", i.getCalificación());
			cstmt.setString("motivo", i.getMotivo());
			cstmt.setInt("estado", i.getEstado());
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
	
	//Editar
	public boolean modificarInscripcion(Inscripcion i){
			
			int x = 0;
			boolean g = false;
					
			try{
				Connection cn = getConnection();
				CallableStatement s = null;	
				String sql = "{call dbo.SPModificarInscripcionMonitor(?,?,?,?,?,?)}";
				s = cn.prepareCall(sql);
				
				s.setString("idAsignatura", i.getIdAsignatura());
				s.setInt("idInscripcion", i.getIdInscripcion());
				s.setInt("calificacion", i.getCalificación());
				s.setString("motivo", i.getMotivo());
				s.setString("turno", i.getTurno());
				s.setInt("estado", i.getEstado());
				
				x = s.executeUpdate();
				g = x > 0;
				
				s.close();
				cn.close();
			} 
			catch (Exception e){
				System.out.println("Datos: Error al actualizar los datos -> "+ e.getMessage());
			}
			
			return g;
		}
	
	//Cargar Todas las Inscripciones
	public ArrayList <InscripcionMonitor> cargarDatosI()
	{
		ArrayList <InscripcionMonitor> array = new ArrayList <InscripcionMonitor>();
		CallableStatement s = null;	
		String sql = ("SELECT * FROM Vw_inscripcion_monitor");
		
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
				i.setSegundoApellido(rs.getString("segundoApellido"));
				i.setCarne(rs.getString("carne"));
				i.setTelefono(rs.getString("telefono"));
				i.setEmail(rs.getString("email"));
				i.setNombreC(rs.getString("nombre"));
				i.setPromedio(rs.getFloat("promedio"));
				i.setNombreA(rs.getString("nombreA"));
				i.setCalificacion(rs.getInt("calificacion"));
				i.setMotivo(rs.getString("motivo"));
				i.setTurno(rs.getString("turno"));
				i.setFecha(rs.getDate("fecha"));
				i.setEstado(rs.getInt("estado"));					
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
	
	//Cargar Inscripciones Aprobadas
	public ArrayList <InscripcionMonitor> cargarDatosIaprobados()
	{
		ArrayList <InscripcionMonitor> array = new ArrayList <InscripcionMonitor>();
		CallableStatement s = null;	
		String sql = ("SELECT * FROM Vw_inscripcion_monitor_a");
		
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
				i.setSegundoApellido(rs.getString("segundoApellido"));
				i.setCarne(rs.getString("carne"));
				i.setTelefono(rs.getString("telefono"));
				i.setEmail(rs.getString("email"));
				i.setNombreC(rs.getString("nombre"));
				i.setPromedio(rs.getFloat("promedio"));
				i.setNombreA(rs.getString("nombreA"));
				i.setCalificacion(rs.getInt("calificacion"));
				i.setMotivo(rs.getString("motivo"));
				i.setTurno(rs.getString("turno"));
				i.setFecha(rs.getDate("fecha"));
				i.setEstado(rs.getInt("estado"));				
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
	
	//Cargar Inscripciones Desaprobadas
	public ArrayList <InscripcionMonitor> cargarDatosIReprobados()
	{
		ArrayList <InscripcionMonitor> array = new ArrayList <InscripcionMonitor>();
		CallableStatement s = null;	
		String sql = ("SELECT * FROM Vw_inscripcion_monitor_d");
		
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
				i.setSegundoApellido(rs.getString("segundoApellido"));
				i.setCarne(rs.getString("carne"));
				i.setTelefono(rs.getString("telefono"));
				i.setEmail(rs.getString("email"));
				i.setNombreC(rs.getString("nombre"));
				i.setPromedio(rs.getFloat("promedio"));
				i.setNombreA(rs.getString("nombreA"));
				i.setCalificacion(rs.getInt("calificacion"));
				i.setMotivo(rs.getString("motivo"));
				i.setTurno(rs.getString("turno"));
				i.setFecha(rs.getDate("fecha"));
				i.setEstado(rs.getInt("estado"));				
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
	
	public ArrayList <InscripcionMonitor> monitorPlanificacion(String carne)
	{
		ArrayList <InscripcionMonitor> array= new ArrayList <InscripcionMonitor>();
		String sql = ("SELECT i.idInscripcion, i.idMonitor, m.primerNombre, m.segundoNombre, m.primerApellido, m.segundoApellido, a.nombreA as nombreA FROM Inscripcion i INNER JOIN Monitor m ON i.idMonitor = m.idMonitor INNER JOIN Asignatura a ON i.idAsignatura = a.idAsignatura WHERE  i.estado = 1 AND m.carne = ?");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, carne);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				InscripcionMonitor im = new InscripcionMonitor();
				im.setIdInscripcion(rs.getInt("idInscripcion"));
				im.setPrimerNombre(rs.getString("primerNombre"));
				im.setSegundoNombre(rs.getString("segundoNombre"));
				im.setPrimerApellido(rs.getString("primerApellido"));
				im.setSegundoApellido(rs.getString("segundoApellido"));
				im.setNombreA(rs.getString("nombreA"));
				array.add(im);
			}
		
			//Cerramos la conexion
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("Datos: Error al buscar al monitor-> "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}
	
}
