package datos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.InscripcionMonitor;
import entidades.Monitor;
import entidades.PerfilMonitor;

public class MDMonitor extends Conexion{
	
	//Agregar Monitor
	public boolean agregarMonitor(Monitor m)throws SQLException {
		
		boolean g = false;
		int y = 0;
		
		Connection cn = getConnection();
		CallableStatement cstmt = null;	
		String sql = "{call dbo.SPAgregarMonitor(?,?,?,?,?,?,?,?,?)}";
		cstmt = cn.prepareCall(sql);
		
		try{
			cstmt.setString("primerNombre", m.getPrimerNombre());
			cstmt.setString("segundoNombre", m.getSegundoNombre());
			cstmt.setString("primerApellido", m.getPrimerApellido());
			cstmt.setString("segundoApellido", m.getSegundoApellido());
			cstmt.setString("carne", m.getCarne());
			cstmt.setString("telefono", m.getTelefono());
			cstmt.setString("email", m.getEmail());
			cstmt.setInt("idCarrera", m.getIdCarrera());
			cstmt.setFloat("promedio", m.getPromedio());
			y = cstmt.executeUpdate();
			g = y > 0;
			
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("Datos: Error al enviar la solicitud-> " + e.getMessage());
		}
		cstmt.close();
		cn.close();
		return g;
	}
	
	//Editar Monitor
		public boolean editarMonitor(Monitor m)throws SQLException {
			
			boolean g = false;
			int y = 0;
			
			Connection cn = getConnection();
			CallableStatement cstmt = null;	
			String sql = "{call dbo.SPEditarMonitor(?,?,?,?,?,?,?,?,?)}";
			cstmt = cn.prepareCall(sql);
			
			try{
				cstmt.setInt("idMonitor", m.getIdMonitor());
				cstmt.setString("primerNombre", m.getPrimerNombre());
				cstmt.setString("segundoNombre", m.getSegundoNombre());
				cstmt.setString("primerApellido", m.getPrimerApellido());
				cstmt.setString("segundoApellido", m.getSegundoApellido());
				cstmt.setString("carne", m.getCarne());
				cstmt.setString("telefono", m.getTelefono());
				cstmt.setString("email", m.getEmail());
				cstmt.setFloat("promedio", m.getPromedio());
				
				y = cstmt.executeUpdate();
				g = y > 0;
				
				cstmt.close();
				cn.close();
				
			}catch(SQLException e){
				e.printStackTrace();
				System.out.println("Datos: Error al enviar la solicitud-> " + e.getMessage());
			}
			cstmt.close();
			cn.close();
			return g;
		}
	
	public ArrayList<Monitor> cargarMonitor(){
		
		ArrayList <Monitor> array = new ArrayList <Monitor>();
		CallableStatement s = null;	
		String sql = ("{call dbo.SPListaMonitor}");
		
		try
		{
			Connection cn = getConnection();
			s = cn.prepareCall(sql);
			ResultSet rs = s.executeQuery();
											
			while(rs.next())		
			{					    					
				Monitor  i = new Monitor();
				
				i.setIdMonitor(rs.getInt("idMonitor"));
				i.setCarrera(rs.getString("nombre"));
				i.setPrimerNombre(rs.getString("primerNombre"));
				i.setSegundoNombre(rs.getString("segundoNombre"));
				i.setPrimerApellido(rs.getString("primerApellido"));
				i.setSegundoApellido(rs.getString("segundoNombre"));
				i.setCarne(rs.getString("carne"));
				i.setTelefono(rs.getString("telefono"));
				i.setEmail(rs.getString("email"));
				i.setPromedio(rs.getFloat("promedio"));	
				i.setFecha(rs.getDate("fecha"));
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

	public ArrayList <Monitor> cargarMonitorU(int usuario)
	{
		ArrayList <Monitor> array= new ArrayList <Monitor>();
		String sql = ("select dbo.Monitor.idMonitor,  dbo.Monitor.carne,  dbo.Monitor.primerNombre,  dbo.Monitor.SegundoNombre,  dbo.Monitor.primerApellido,  dbo.Monitor.SegundoApellido,  dbo.Monitor.telefono,  dbo.Monitor.email, dbo.Monitor.idCarrera, dbo.Carrera.nombre AS [carrera]," +
		"dbo.Monitor.promedio from  Usuario INNER JOIN Monitor ON dbo.Usuario.idUsuario = dbo.Monitor.idUsuario, Carrera where dbo.Carrera.idCarrera = dbo.Monitor.idCarrera and dbo.Usuario.idUsuario = ?");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setInt(1, usuario);
			System.out.println("Usuario asignado: " + usuario);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				Monitor m = new Monitor();
				
				m.setIdMonitor(rs.getInt("idMonitor"));
				m.setCarne(rs.getString("carne"));
				m.setPrimerNombre(rs.getString("primerNombre"));
				m.setSegundoNombre(rs.getString("segundoNombre"));
				m.setPrimerApellido(rs.getString("primerApellido"));
				m.setSegundoApellido(rs.getString("segundoApellido"));
				m.setTelefono(rs.getString("telefono"));
				m.setEmail(rs.getString("email"));
				m.setIdCarrera(rs.getInt("idCarrera"));
				m.setCarrera(rs.getString("carrera"));
				m.setPromedio(rs.getFloat("promedio"));
				array.add(m);
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

	public ArrayList <Monitor> buscarMonitorC(String carne)
	{
		ArrayList <Monitor> array= new ArrayList <Monitor>();
		String sql = ("select idMonitor, primerNombre, segundoNombre, primerApellido, segundoApellido, email from Monitor WHERE carne = ?");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, carne);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				Monitor m = new Monitor();
				
				m.setIdMonitor(rs.getInt("idMonitor"));
				m.setPrimerNombre(rs.getString("primerNombre"));
				m.setSegundoNombre(rs.getString("segundoNombre"));
				m.setPrimerApellido(rs.getString("primerApellido"));
				m.setSegundoApellido(rs.getString("segundoApellido"));
				m.setEmail(rs.getString("email"));
				array.add(m);
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
	
	public boolean subirArchivo(PerfilMonitor pm) throws SQLException{
		
		boolean g = false;
		int y = 0;
		
		Connection cn = getConnection();
		CallableStatement cstmt = null;	
		String sql = "{call dbo.SPSubirArchivo(?,?,?)}";
		cstmt = cn.prepareCall(sql);
		
		try{
			cstmt.setString("nombre", pm.getNombre());
			cstmt.setInt("idMonitor", pm.getIdMonitor());
			cstmt.setBlob("documento", pm.getImagen());
			
			y = cstmt.executeUpdate();
			g = y > 0;
			
		}catch(Exception e ){
			System.out.println("Datos: Error al subir el archivo-> "+e.getMessage());
			e.printStackTrace();
		}
		cstmt.close();
		cn.close();
		return g;
	}
}
