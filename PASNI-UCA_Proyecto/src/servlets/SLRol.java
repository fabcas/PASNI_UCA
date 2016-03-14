package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NGCategoriaTaller;
import negocio.NGRol;
import entidades.CategoriaTaller;
import entidades.Rol;

/**
 * Servlet implementation class SLRol
 */
@WebServlet("/SLRol")
public class SLRol extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLRol() {
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
		// TODO Auto-generated method stub
		
		
		try{
			
			String idRol = "";
			String opc = "";
		
			NGRol neg = new NGRol();
			Rol r = new Rol();
			boolean g = false;
			boolean m = false;
			boolean e = false;
			
			opc = request.getParameter("opc");
			
			if(opc.equals("1"))
			{
				r.setNombre(request.getParameter("nombre"));
				r.setDescripcion(request.getParameter("descripcion"));
				
				g = neg.guardarNGRol(r);
				if(g == true)
				{
					response.sendRedirect("./Seg_Rol.jsp?msj=1");
				}
				else
				{
					response.sendRedirect("./Seg_Rol.jsp");
				}
			}
			if(opc.equals("2"))
			{
				idRol = request.getParameter("IdRolEditar");
				
				if(idRol.equals(""))
				{
					idRol = "0";
				}
				
				if(neg.NGexistencia(Integer.parseInt(idRol)))
				{
					r.setIdRol(Integer.parseInt(request.getParameter("IdRolEditar")));
					r.setNombre(request.getParameter("nombre_RolEditado"));
					r.setDescripcion(request.getParameter("descripcion_RolEditado"));
					m = neg.actualizarNGRol(r);
					if(m == true)
					{
						response.sendRedirect("./Seg_Rol.jsp?msj=2");
					}
					else
					{
						response.sendRedirect("./Seg_Rol.jsp");
					}
				}
				else
				{
					response.sendRedirect("./Seg_Rol.jsp?msj=4");
				}
				
			}
			if(opc.equals("3"))
			{
				idRol = request.getParameter("IdRolEliminar");
				if(idRol.equals("0"))
				{
					idRol = "0";
				}
				else
				{
					if(neg.NGexistencia(Integer.parseInt(idRol)))
					{
						r.setIdRol(Integer.parseInt(request.getParameter("IdRolEliminar")));
						e = neg.eliminarNGRol(r);
						if(e == true)
						{
							response.sendRedirect("./Seg_Rol.jsp?msj=3");
						}
						else
						{
							response.sendRedirect("./Seg_Rol.jsp");
						}
					}
					else
					{
						response.sendRedirect("./Seg_Rol.jsp?msj=4");
					}
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Servlet: Error en el catch al verificar los datos de la categoría: -> " + e.getMessage());
			response.sendRedirect("./Seg_Rol.jsp");
		}

}
}
