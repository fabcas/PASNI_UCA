package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NGProfesor;
import negocio.NGUsuario;
import entidades.Monitor;
import entidades.Profesor;
import entidades.Usuario;

/**
 * Servlet implementation class SLCuentaMonitor
 */
@WebServlet("/SLCuentaUsuario")
public class SLCuentaUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLCuentaUsuario() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			boolean g = false;
			boolean gp = false;
			String opc ="";
			String idMonitor = "";
			String idProfesor = "";
			String idRol = "";
			NGUsuario usuario = new NGUsuario();
			Usuario us = new Usuario();
			Monitor m = new Monitor();
			Profesor p = new Profesor();
			opc = request.getParameter("opc");
			
			if(opc.equals("1")){
				
				us.setIdRol(2);
				us.setUsuario(request.getParameter("usuario"));
				us.setPassword(request.getParameter("pass"));
				idMonitor = request.getParameter("idMonitor");
				m.setIdMonitor(Integer.parseInt(idMonitor));
				g = usuario.guardarCU(us, m);
				
				if(g == true){
					response.sendRedirect("./modulos/monitor/cuenta-usuario.jsp?msj=1");
				}else{
					response.sendRedirect("./modulos/monitor/cuenta-usuario.jsp");
				}	
			}else if(opc.equals("2")){
				
				us.setUsuario(request.getParameter("usuario"));
				us.setPassword(request.getParameter("pass"));
				idProfesor = request.getParameter("idProfesor");
				p.setIdProfesorGuia(Integer.parseInt(idProfesor));
				idRol = request.getParameter("rol");
				if(idRol.equals("3")){
					us.setIdRol(3);
				}else if(idRol.equals("4")){
					us.setIdRol(4);
				}else if(idRol.equals("5")){
					us.setIdRol(5);
				}
				gp = usuario.guardarPU(us, p);
				
				if(gp == true){
					response.sendRedirect("./modulos/profesor/cuenta-usuario.jsp?msj=1");
				}else{
					response.sendRedirect("./modulos/profesor/cuenta-usuario.jsp");
				}
			}
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.err.println("SL: EL ERROR ES: "+e.getMessage());
		}
	}

}
