package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import negocio.NGMonitor;
import negocio.NGUsuario;
import datos.MDMonitor;
import entidades.Monitor;
import entidades.PerfilMonitor;
import entidades.Usuario;
import entidades.UsuarioGenerico;

/**
 * Servlet implementation class SLIngresarSistema
 */
@WebServlet("/SLIngresarSistema")
public class SLIngresarSistema extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLIngresarSistema() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			
			NGUsuario ng = new NGUsuario();
			Usuario u = new Usuario();
			ArrayList <Usuario> array = new ArrayList<Usuario>();
			boolean autenticado = false;
			
			String user = "";
			String pass = "";
			int rol = 0;
			int idUsuario = 0;
			
			user = request.getParameter("user");
			pass = request.getParameter("pass");
			
			//autenticado = ng.validarInicioSesion(user, pass);
			rol = ng.verificarRol(user, pass);
			
			switch(rol){
				
				case 1:
				{
					
					autenticado = ng.validarInicioSesionAdministrador(user, pass);
					idUsuario = ng.devolverIdAdministrador(user, pass);
					ArrayList<UsuarioGenerico> listaAdmin = new ArrayList<UsuarioGenerico>();
					UsuarioGenerico admin = new UsuarioGenerico();
					admin.setIdUsuario(idUsuario);
					admin.setIdRol(rol);
					listaAdmin.add(admin);
					
					if(autenticado == true){
						
						HttpSession hts = request.getSession(true);
						hts.setAttribute("login", listaAdmin);
						response.sendRedirect("menu-principal.jsp");
					}
					else{
						//Agregar notify
						response.sendRedirect("index.jsp");
					}
				}	
					break;
					
				case 2:
				{
					//Monitor
					int idMonitor = 0;
					autenticado = ng.validarInicioSesionMonitor(user, pass);
					idUsuario = ng.devolverIdUsuarioMonitor(user, pass);
					//ArrayList<UsuarioGenerico> listaMonitor = new ArrayList<UsuarioGenerico>();
					ArrayList<Monitor> monitor = new ArrayList<Monitor>();
					ArrayList<PerfilMonitor> perfil = new ArrayList<PerfilMonitor>();
					
					NGMonitor ngmon = new NGMonitor();
					
					/*
					 * UsuarioGenerico m = new UsuarioGenerico();
						Monitor moni = new Monitor();
						m.setIdUsuario(idUsuario);
						m.setIdRol(rol);
						listaMonitor.add(m);
					*/
					
					monitor = ngmon.cargarMonitorU(idUsuario); 
					perfil = ngmon.cargarArchivo(idUsuario);
					if(autenticado == true){
						
						HttpSession hts = request.getSession(true);
						hts.setAttribute("login", monitor);
						hts.setAttribute("loginp", perfil);
						response.sendRedirect("modulos/monitor/perfil-monitor.jsp");
						
					}
					else{
						response.sendRedirect("index.jsp");
					}
				}
					break;
					
				case 3:
				{
					//Profesor
				}
					break;
					
				case 4:
				{
					//Profesor guía
					autenticado = ng.validarInicioSesionProfesorGuia(user, pass);
					idUsuario = ng.devolverIdProfesorGuia(user, pass);
					ArrayList<UsuarioGenerico> listaAdmin = new ArrayList<UsuarioGenerico>();
					UsuarioGenerico pg = new UsuarioGenerico();
					pg.setIdUsuario(idUsuario);
					pg.setIdRol(rol);
					listaAdmin.add(pg);
					
					if(autenticado == true){
						
						HttpSession hts = request.getSession(true);
						hts.setAttribute("login", listaAdmin);
						response.sendRedirect("menu-principal.jsp");
					}
					else{
						//Agregar notify
						response.sendRedirect("index.jsp");
					}
					
				}
					break;
					
				case 5:
				{
					
				}
					break;
					
				default:
					break;
			
			
			}
			
		}
		catch(Exception ex){
			
			
			
		}
		
		
	}

}
