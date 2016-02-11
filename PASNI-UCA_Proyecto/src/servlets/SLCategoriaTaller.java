package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.CategoriaTaller;
import negocio.NGCategoriaTaller;

/**
 * Servlet implementation class SLCategoriaTaller
 */
@WebServlet("/SLCategoriaTaller")
public class SLCategoriaTaller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLCategoriaTaller() {
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
			
			NGCategoriaTaller neg = new NGCategoriaTaller();
			CategoriaTaller ct = new CategoriaTaller();
			String opc = "";
			String IdCategoria = "";
			boolean g = false;
			boolean m = false;
			boolean e = false;
			
			opc = request.getParameter("opc");
			
			if(opc.equals("1"))
			{
				ct.setNombre(request.getParameter("nombre"));
				ct.setDescripcion(request.getParameter("descripcion"));
				ct.setActivo(true);
				
				g = neg.guardarNGCategoriaTaller(ct);
				if(g == true)
				{
					response.sendRedirect("./modulos/taller/categoria-taller.jsp?msj=1");
				}
				else
				{
					response.sendRedirect("./modulos/taller/categoria-taller.jsp");
				}
			}
			
			else if(opc.equals("2"))
			{
				IdCategoria = request.getParameter("IdCategoriaEditar");
				ct.setIdCategoria(Integer.parseInt(IdCategoria));
				ct.setNombre(request.getParameter("nombre_CategoriaEditado"));
				ct.setDescripcion(request.getParameter("descripcion_CategoriaEditado"));
				
				m = neg.actualizarNGCategoriaTaller(ct);
				if(m == true)
				{
					response.sendRedirect("./modulos/taller/categoria-taller.jsp?msj=2");
				}
				else
				{
					response.sendRedirect("./modulos/taller/categoria-taller.jsp");
				}
			}
			
			else if(opc.equals("3"))
			{
				IdCategoria = request.getParameter("IdCategoriaEliminar");
				ct.setIdCategoria(Integer.parseInt(IdCategoria));
				
				e = neg.eliminarNGCategoriaTaller(ct);
				if(e == true)
				{
					response.sendRedirect("./modulos/taller/categoria-taller.jsp?msj=3");
				}
				else
				{
					response.sendRedirect("./modulos/taller/categoria-taller.jsp");
				}
			}
			
		}
		catch(Exception e)
		 {
			 e.printStackTrace();
			 System.out.println("Servlet: Error en el catch al verificar los datos de la categoría: -> " + e.getMessage());
			 response.sendRedirect("./modulos/taller/categoria-taller.jsp");
		 }
		
		
	}

}
