package datos;

import java.sql.*;
import java.util.ArrayList;

import entidades.*;
import entidades.Error;

public class MDUsuario extends Conexion{
	
	
	public boolean guardarUsuario(Usuario u) throws SQLException
	{
		boolean g = false;
		int y = 0;
		
		try
		{
		
			String SQL= ("INSERT INTO Usuario (idRol, usuario, password, estado) VALUES (?, ? , ?, 1)");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(SQL);
		
			   
				s.setInt(1, u.getIdRol());
				s.setString(2, u.getUsuario());
				s.setString(3, u.getPassword());
				//s.setBoolean(3, r.isActivo());
				//s.setBoolean(3, c.isActivo());
				
				
			y = s.executeUpdate();
			g = y >0;
			
			//Cerramos la conexion
			s.close();
			cn.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("DATOS: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		}
		
		
		return g;
	}//guardar
	
	
	
	
	//Método Actualizar
	public boolean actualizarUsuario(Usuario u)
	{
		boolean g = false;
		int y = 0;
		
		try
		{
		
			String SQL= ("UPDATE Usuario SET IdRol=?, usuario=?, password=? WHERE idUsuario=? AND estado=1");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(SQL);
		
			   
				s.setInt(1, u.getIdRol());
				s.setString(2, u.getUsuario());
				s.setString(3, u.getPassword());
				s.setInt(4, u.getIdUsuario());
				
				//s.setBoolean(3, c.isActivo());
				
				
			y = s.executeUpdate();
			g = y >0;
			
			//Cerramos la conexion
			s.close();
			cn.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("DATOS: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		}
		
		
		return g;
		
	}//actualizar


	//metodo para eliminar logico
	public boolean eliminarUsuario(Usuario u){
		
		boolean el = false;
		int y = 0;
		
		try
		{
		
			String SQL= ("UPDATE Usuario SET estado = 0 WHERE idUsuario=?");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(SQL);
		
				s.setInt(1, u.getIdUsuario());
				
				
			y = s.executeUpdate();
			el = y >0;
			
			//Cerramos la conexion
			s.close();
			cn.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("DATOS: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		}
		
		
		return el;
	}//eliminar
	
	
	public boolean existencia(int IdUsuario)
	{
		boolean existe=false;
		try
		{
			String sql = ("SELECT * FROM Usuario WHERE idUsuario=?");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(sql);
			
			s.setInt(1, IdUsuario);
			
			ResultSet rs = s.executeQuery();
			if(rs.next())
			{
				existe = true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("DATOS: AL PARECER EL DATO, NO EXISTE"+e.getMessage());
		}
		
		return existe;
	}
	
	//Cargar datos administrador
	public ArrayList < Usuario  > cargarDatosAdministrador()
	{
		ArrayList <Usuario> array = new ArrayList <Usuario>();
		CallableStatement s = null;	
		String sql = ("SELECT u.idUsuario, r.nombre [Rol], u.usuario [NombreUsuario], u.password [Clave] "
						+ "FROM Usuario u, Rol r "
							+" WHERE u.IdRol = r.idRol AND u.IdRol = 1 AND u.estado = 1;");
		
		try
		{
			Connection cn = getConnection();
			s = cn.prepareCall(sql);
			ResultSet rs = s.executeQuery();
											
			while(rs.next())		
			{					    					
				Usuario enti = new Usuario();
				
				enti.setIdUsuario(rs.getInt("idUsuario"));
				enti.setNombreRol(rs.getString("Rol"));
				enti.setUsuario(rs.getString("NombreUsuario"));
				enti.setPassword(rs.getString("Clave"));
					
				array.add(enti);
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
	
	//Cargar datos monitor
			public ArrayList < Usuario  > cargarDatosMonitor()
			{
				ArrayList <Usuario> array = new ArrayList <Usuario>();
				CallableStatement s = null;	
				String sql = ("SELECT dbo.Usuario.idUsuario, dbo.Usuario.usuario, dbo.Rol.nombre [Rol], dbo.Usuario.password [Clave],"+ 
						" dbo.Monitor.primerNombre + ' ' + dbo.Monitor.primerApellido + ' ' +dbo.Monitor.segundoApellido [Monitor]"
							+" FROM dbo.Usuario INNER JOIN dbo.Rol ON dbo.Usuario.IdRol = dbo.Rol.idRol INNER JOIN " +
	                         "dbo.Monitor ON dbo.Usuario.idUsuario = dbo.Monitor.idUsuario " + 
	                         "WHERE dbo.Usuario.estado = 1; ");
				
				try
				{
					Connection cn = getConnection();
					s = cn.prepareCall(sql);
					ResultSet rs = s.executeQuery();
													
					while(rs.next())		
					{					    					
						Usuario enti = new Usuario();
						
						enti.setIdUsuario((rs.getInt("idUsuario")));
						enti.setUsuario(rs.getString("usuario"));
						enti.setNombreRol((rs.getString("Rol")));
						enti.setPassword(rs.getString("Clave"));
						enti.setNombreMonitor(rs.getString("Monitor"));
							
						array.add(enti);
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
		
	
	public ArrayList <Rol> comboRol()
	{
		ArrayList <Rol> arrayRoles = new ArrayList <Rol>();
		String sql = ("SELECT idRol, nombre FROM Rol WHERE activo = 1;");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				Rol  enti = new Rol();
				
				enti.setIdRol(rs.getInt("idRol"));
				enti.setNombre(rs.getString("nombre"));
				arrayRoles.add(enti);
			}
			
			//Cerramos la conexion
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("Datos: Error al cargar la lista de categoría -> "+e.getMessage());
			e.printStackTrace();
		}
		
		return arrayRoles;
	}//combo cuatrimestre
	
	
	public boolean validarInicioSesionAdministrador(String user, String pass){
		
		boolean encontrado = false;
		String sql = "SELECT idUsuario "+
					"FROM Usuario" +
						" WHERE usuario = ? AND password = ? AND estado = 1 ";
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			
			ps.setString(1, user);
			ps.setString(2, pass);
			
			ResultSet rs = null;
			rs = ps.executeQuery();
			
			if(rs.next())
			{
				encontrado=true;
			}
				
			ps.close();
			cn.close();
		}
		catch (Exception e)
		{
			System.out.println("Datos: Error al validar el usuario "+ e.getMessage());
			e.printStackTrace();
		}
			
		return encontrado;
		
	}
	
	public int devolverIdAdministrador(String user, String pass){
		
		int id = 0;
		String sql = "SELECT idUsuario FROM Usuario WHERE usuario = ? AND password = ? AND estado = 1;";
	
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			
			ps.setString(1, user);
			ps.setString(2, pass);
			
			ResultSet rs = null;
			rs = ps.executeQuery();
			
			if(rs.next())
			{
				id = rs.getInt("idUsuario");
			}
				
			ps.close();
			cn.close();
		}
		catch (Exception e)
		{
			System.out.println("Datos: Error al validar el usuario "+ e.getMessage());
			e.printStackTrace();
		}
		
		return id;
		
	}
	
	//Devuelve el id del Monitor.
	public boolean validarInicioSesionMonitor(String user, String pass){
		
		boolean encontrado = false;
		String sql = "SELECT m.IdMonitor, m.primerNombre + ' ' + m.primerApellido [Monitor] "+
					"FROM Monitor m, Usuario u" +
						" WHERE u.idUsuario = m.idUsuario " +
						" AND u.usuario = ? AND u.password = ? AND u.estado = 1 ";
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			
			ps.setString(1, user);
			ps.setString(2, pass);
			
			ResultSet rs = null;
			rs = ps.executeQuery();
			
			if(rs.next())
			{
				encontrado=true;
			}
				
			ps.close();
			cn.close();
		}
		catch (Exception e)
		{
			System.out.println("Datos: Error al validar el usuario "+ e.getMessage());
			e.printStackTrace();
		}
			
		return encontrado;
		
	}
	
	public int devolverIdProfesorGuia(String user, String pass){
		
		int id = 0;
		String sql = "SELECT pg.IdProfesor "+
				"FROM ProfesorGuia pg, Usuario u" +
					" WHERE u.idUsuario = pg.idUsuario " +
					" AND u.usuario = ? AND u.password = ? AND u.estado = 1 ";
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			
			ps.setString(1, user);
			ps.setString(2, pass);
			
			ResultSet rs = null;
			rs = ps.executeQuery();
			
			if(rs.next())
			{
				id = rs.getInt("IdProfesor");
			}
				
			ps.close();
			cn.close();
		}
		catch (Exception e)
		{
			System.out.println("Datos: Error al validar el usuario "+ e.getMessage());
			e.printStackTrace();
		}
		
		return id;
		
	}
	
	public int devolverIdUsuarioMonitor(String user, String pass){
		
		int id = 0;
		String sql = "SELECT m.IdUsuario "+
				"FROM Monitor m, Usuario u" +
					" WHERE u.idUsuario = m.idUsuario " +
					" AND u.usuario = ? AND u.password = ? AND u.estado = 1 ";
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			
			ps.setString(1, user);
			ps.setString(2, pass);
			
			ResultSet rs = null;
			rs = ps.executeQuery();
			
			if(rs.next())
			{
				id = rs.getInt("IdUsuario");
			}
				
			ps.close();
			cn.close();
		}
		catch (Exception e)
		{
			System.out.println("Datos: Error al validar el usuario "+ e.getMessage());
			e.printStackTrace();
		}
		
		return id;
		
	}
	
	public int devolverIdMonitor(String user, String pass){
		
		int id = 0;
		String sql = "SELECT m.IdMonitor "+
				"FROM Monitor m, Usuario u" +
					" WHERE u.idUsuario = m.idUsuario " +
					" AND u.usuario = ? AND u.password = ? AND u.estado = 1 ";
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			
			ps.setString(1, user);
			ps.setString(2, pass);
			
			ResultSet rs = null;
			rs = ps.executeQuery();
			
			if(rs.next())
			{
				id = rs.getInt("IdProfesor");
			}
				
			ps.close();
			cn.close();
		}
		catch (Exception e)
		{
			System.out.println("Datos: Error al validar el usuario "+ e.getMessage());
			e.printStackTrace();
		}
		
		return id;
		
	}
	
	//Devuelve el Id del Profesor guia
	public boolean validarInicioSesionProfesorGuia(String user, String pass){
		
		boolean encontrado = false;
		String sql = "SELECT pg.IdProfesor "+
					"FROM ProfesorGuia pg, Usuario u" +
						" WHERE u.idUsuario = pg.idUsuario " +
						" AND u.usuario = ? AND u.password = ? AND u.estado = 1 ";
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			
			ps.setString(1, user);
			ps.setString(2, pass);
			
			ResultSet rs = null;
			rs = ps.executeQuery();
			
			if(rs.next())
			{
				encontrado=true;
			}
				
			ps.close();
			cn.close();
		}
		catch (Exception e)
		{
			System.out.println("Datos: Error al validar el usuario "+ e.getMessage());
			e.printStackTrace();
		}
			
		return encontrado;
		
	} 
	
	public int verificarRol(String user, String pass){
		
		int id = 0;
		String sql = "SELECT u.idRol FROM Usuario u WHERE u.usuario = ? AND u.password = ? AND u.estado = 1;";
	
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			
			ps.setString(1, user);
			ps.setString(2, pass);
			
			ResultSet rs = null;
			rs = ps.executeQuery();
			
			if(rs.next())
			{
				id = rs.getInt("idRol");
			}
				
			ps.close();
			cn.close();
		}
		catch (Exception e)
		{
			System.out.println("Datos: Error al validar el usuario "+ e.getMessage());
			e.printStackTrace();
		}
		
		return id;
		
	}
	
	
	public Usuario InicioSesion(Usuario s){
		
		Error e;
		
		try{
			String codError = "999";
			String mensaje = "";
			Connection cn = getConnection();
			CallableStatement cstmt = null;	
			String sql = "{call dbo.SPSPInicioSesion(?,?,?,?)}";
			
			cstmt = cn.prepareCall(sql);	
			cstmt.setString(1, s.getUsuario());
			cstmt.setString(2,s.getUsuario());
			
			cstmt.registerOutParameter(13, Types.VARCHAR);
			cstmt.registerOutParameter(14, Types.VARCHAR);
			
			boolean rs = cstmt.execute();
			
			if(rs){
				String usuario = cstmt.getString("usuario");
				boolean estado = cstmt.getBoolean("estado");
				s.setUsuario(usuario);
				s.setEstado(estado);
			}else{
				System.out.println("El usuario no existe");
			}
			
			codError = cstmt.getString("codMensaje");
			mensaje = cstmt.getString("Mensaje");
			
			e = new Error(codError, mensaje);
			
		} catch (Exception ex) {
			e = new Error("111", ex.getMessage());
		}
		
		return s;
	}
	
	//Guardar desde Crear cuenta usuario
		public boolean guardarCU(Usuario u, Monitor m) throws SQLException
		{
			boolean g = false;
			int y = 0;
			
			Connection cn = getConnection();
			CallableStatement cstmt = null;	
			String sql = "{call dbo.SPAgregarUsuario(?,?,?,?)}";
			cstmt = cn.prepareCall(sql);			
						
			try {
				cstmt.setInt("idRol", u.getIdRol());
				cstmt.setString("usuario", u.getUsuario());
				cstmt.setString("password", u.getPassword());
				cstmt.setInt("idMonitor", m.getIdMonitor());
				y = cstmt.executeUpdate();
				g = y > 0;
				
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("Datos: Error al guardar los datos -> " + e.getMessage());
			}	
			
			cstmt.close();
			cn.close();
			return g;
		}
		
		public boolean guardarPU(Usuario u, Profesor p) throws SQLException
		{
			boolean g = false;
			int y = 0;
			
			Connection cn = getConnection();
			CallableStatement cstmt = null;	
			String sql = "{call dbo.SPAgregarUsuarioP(?,?,?,?)}";
			cstmt = cn.prepareCall(sql);			
						
			try {
				cstmt.setInt("idRol", u.getIdRol());
				cstmt.setString("usuario", u.getUsuario());
				cstmt.setString("password", u.getPassword());
				cstmt.setInt("IdProfesor", p.getIdProfesorGuia());
				y = cstmt.executeUpdate();
				g = y > 0;
				
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("Datos: Error al guardar los datos -> " + e.getMessage());
			}	
			
			cstmt.close();
			cn.close();
			return g;
		}

}
