package negocio;

import java.util.ArrayList;

import datos.MDUsuario;
import entidades.Rol;
import entidades.Usuario;

public class NGUsuario {
	
	public boolean guardarNGUsuario(Usuario u)
	{
		
		boolean bl = false;
		
		try
		{
			MDUsuario mdct = new MDUsuario();
			bl = mdct.guardarUsuario(u);
			System.out.println("NEGOCIO: Datos guardados con exito!!!");
		}
	
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("NEGOCIO: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		}
		
		return bl;
	}
	
	// Método Actualizar
	public boolean actualizarNGUsuario(Usuario u)
	{
		boolean bl = false;
		
		try
		{
			MDUsuario mdct = new MDUsuario();
			bl = mdct.actualizarUsuario(u);
			System.out.println("NEGOCIO: DATOS ACTUALIZADOS CON EXITO!");
		}
	
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("NEGOCIO: ERROR AL ACTUALIZAR LOS DATOS " + e.getMessage());
		}
		
		return bl;
	}
	
	//Método para eliminar
	
	public boolean eliminarNGUsuario(Usuario u){
		
		boolean bl = true;
		try{
			
		MDUsuario datos = new MDUsuario();
		bl = datos.eliminarUsuario(u);
		
		System.out.println("NEGOCIO: DATOS ACTUALIZADOS CON EXITO!");
		}catch(Exception e)
		{
			
			e.printStackTrace();
			System.out.println("Error al eliminar los datos" + e.getMessage());
		}
		return bl;
				
	}
	
	public boolean NGexistencia(int IdUsuario)
	{
		boolean existe = false;
		MDUsuario datos = new MDUsuario();
		try
		{
			existe = datos.existencia(IdUsuario);
		}
		catch(Exception e)
		{
			System.out.println("NG: el error es: "+e.getMessage());
			e.printStackTrace();
		}
				
		return existe;
	}
	
	public ArrayList<Usuario> cargarAdministradores()
	{
		ArrayList < Usuario > array = new ArrayList<Usuario>();
		MDUsuario datos = new MDUsuario();
		try
		{
			array = datos.cargarDatosAdministrador();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		
		return array;
	}
	
	public ArrayList<Usuario> cargarMonitores()
	{
		ArrayList < Usuario > array = new ArrayList<Usuario>();
		MDUsuario datos = new MDUsuario();
		try
		{
			array = datos.cargarDatosMonitor();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		
		return array;
	}
	
	//Combo
	public ArrayList<Rol> cargarRoles()
	{
		ArrayList < Rol > array = new ArrayList<Rol>();
		MDUsuario datos = new MDUsuario();
		
		try
		{
			array = datos.comboRol();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		
		
		return array;
	}
	
	
	/** Inicios de sesión **/
		
	public boolean validarInicioSesionAdministrador(String user, String pass){
		
		boolean valido = false;
		MDUsuario datos = new MDUsuario();
		
		try
		{
			valido = datos.validarInicioSesionAdministrador(user, pass);
		}
		catch(Exception e)
		{
			System.out.println("NG: el error es: "+e.getMessage());
			e.printStackTrace();
		}
				
		return valido;
		
	}
	
	public boolean validarInicioSesionMonitor(String user, String pass){
		
		boolean valido = false;
		MDUsuario datos = new MDUsuario();
		
		try
		{
			valido = datos.validarInicioSesionMonitor(user, pass);
		}
		catch(Exception e)
		{
			System.out.println("NG: el error es: "+e.getMessage());
			e.printStackTrace();
		}
				
		return valido;
		
	}
	
	//
	public boolean validarInicioSesionProfesorGuia(String user, String pass){
		
		boolean valido = false;
		MDUsuario datos = new MDUsuario();
		
		try
		{
			valido = datos.validarInicioSesionProfesorGuia(user, pass);
		}
		catch(Exception e)
		{
			System.out.println("NG: el error es: "+e.getMessage());
			e.printStackTrace();
		}
				
		return valido;
		
	}
	
	//Obtiene el rol de un usuario
	public int verificarRol(String user, String pass){
		
		int rol = 0;
		MDUsuario datos = new MDUsuario();
		
		try
		{
			rol = datos.verificarRol(user, pass);
		}
		catch(Exception e)
		{
			System.out.println("NG: el error es: "+e.getMessage());
			e.printStackTrace();
		}
				
		return rol;
		
	}
	
	//Obtiene el id de un usuario
		public int devolverIdAdministrador(String user, String pass){
			
			int id = 0;
			MDUsuario datos = new MDUsuario();
			
			try
			{
				id = datos.devolverIdAdministrador(user, pass);
			}
			catch(Exception e)
			{
				System.out.println("NG: el error es: "+e.getMessage());
				e.printStackTrace();
			}
					
			return id;
			
		}
		
	public int devolverIdProfesorGuia(String user, String pass){
			
			int id = 0;
			MDUsuario datos = new MDUsuario();
			
			try
			{
				id = datos.devolverIdProfesorGuia(user, pass);
			}
			catch(Exception e)
			{
				System.out.println("NG: el error es: "+e.getMessage());
				e.printStackTrace();
			}
					
			return id;
			
		}
	
	public int devolverIdMonitor(String user, String pass){
		
		int id = 0;
		MDUsuario datos = new MDUsuario();
		
		try
		{
			id = datos.devolverIdMonitor(user, pass);
		}
		catch(Exception e)
		{
			System.out.println("NG: el error es: "+e.getMessage());
			e.printStackTrace();
		}
				
		return id;
		
	}
	
	/** Fin **/

}