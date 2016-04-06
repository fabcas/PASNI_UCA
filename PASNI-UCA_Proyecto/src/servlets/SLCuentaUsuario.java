package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NGUsuario;
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
			String opc ="";
			NGUsuario usuario = new NGUsuario();
			Usuario us = new Usuario();
			
				us.setIdRol(2);
				us.setUsuario(request.getParameter("usuario"));
				us.setPassword(request.getParameter("pass"));
				g = usuario.guardarNGUsuario(us);
				
				if(g == true){
					response.sendRedirect("./modulos/monitor/cuenta-usuario.jsp?msj=1");
				}else{
					response.sendRedirect("./modulos/monitor/cuenta-usuario.jsp");
				}
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.err.println("SL: EL ERROR ES: "+e.getMessage());
		}
	}

}
