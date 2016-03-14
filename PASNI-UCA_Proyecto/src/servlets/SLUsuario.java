package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Usuario;
import negocio.NGUsuario;

/**
 * Servlet implementation class SLUsuario
 */
@WebServlet("/SLUsuario")
public class SLUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLUsuario() {
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
			
			String idRol = "";
			String idUsuario = "";
			String opc = "";
		
			NGUsuario neg = new NGUsuario();
			Usuario u = new Usuario();
			boolean g = false;
			boolean m = false;
			boolean e = false;
			
			opc = request.getParameter("opc");
			
			if(opc.equals("1")){
				
				idRol = request.getParameter("rolUser");
				u.setIdRol(Integer.parseInt(idRol));
				u.setUsuario(request.getParameter("nombreUsuario"));
				u.setPassword(request.getParameter("pass"));
				
				g = neg.guardarNGUsuario(u);
				if(g == true)
				{
					response.sendRedirect("./Seg_CuentasUsuarios.jsp?msj=1");
				}
				else
				{
					response.sendRedirect("./Seg_CuentasUsuarios.jsp");
				}
			}
			
			if(opc.equals("2")){
				
				idUsuario = request.getParameter("IdUsuarioEditar");
				
				if(idUsuario.equals(""))
				{
					idUsuario = "0";
				}
				
				if(neg.NGexistencia((Integer.parseInt(idUsuario))))
				{
					u.setIdUsuario(Integer.parseInt(idUsuario));
					u.setIdRol(Integer.parseInt(request.getParameter("rolUserEditar")));
					u.setUsuario(request.getParameter("nombreUsuarioEditar"));
					u.setPassword(request.getParameter("passEditar"));
					m = neg.actualizarNGUsuario(u);
					
					if(m == true)
					{
						response.sendRedirect("./Seg_CuentasUsuarios.jsp?msj=2");
					}
					else
					{
						response.sendRedirect("./Seg_CuentasUsuarios.jsp");
					}
				}
				else
				{
					response.sendRedirect("./Seg_CuentasUsuarios.jsp?msj=4");
				}
				
			}
			
			if(opc.equals("3"))
			{
				idUsuario = request.getParameter("idUsuarioAdminEliminar");
				if(idUsuario.equals("0"))
				{
					idUsuario = "0";
				}
				else
				{
					if(neg.NGexistencia(Integer.parseInt(idUsuario)))
					{
						u.setIdUsuario((Integer.parseInt(request.getParameter("idUsuarioAdminEliminar"))));
						e = neg.eliminarNGUsuario(u);
						
						if(e == true)
						{
							response.sendRedirect("./Seg_CuentasUsuarios.jsp?msj=3");
						}
						else
						{
							response.sendRedirect("./Seg_CuentasUsuarios.jsp");
						}
					}
					else
					{
						response.sendRedirect("./Seg_CuentasUsuarios.jsp?msj=4");
					}
				}
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Servlet: Error en el catch al verificar los datos del usuario: -> " + e.getMessage());
			response.sendRedirect("./Seg_CuentasUsuarios.jsp");
		}
		
		
		
	}

}
