package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Facilitador;
import negocio.NGFacilitador;

/**
 * Servlet implementation class SLFacilitador
 */
@WebServlet("/SLFacilitador")
public class SLFacilitador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLFacilitador() {
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
			String opc = "";
			String idFacilitador = "";
			Facilitador f = new Facilitador();
			NGFacilitador fac = new NGFacilitador();
			boolean g = false;
			boolean m = false;
			boolean e = false;
			
			opc = request.getParameter("opc");
			
			
			if(opc.equals("1")){
				
				f.setPrimerNombre(request.getParameter("primernombre"));
				f.setSegundoNombre(request.getParameter("segundonombre"));
				f.setPrimerApellido(request.getParameter("primerapellido"));
				f.setSegundoApellido(request.getParameter("segundoapellido"));
				
				g = fac.guardarNGFacilitador(f);
				if( g == true){
					response.sendRedirect("./modulos/taller/facilitador.jsp?msj=1");
				}
				else{
					response.sendRedirect("./modulos/taller/facilitador.jsp");
				}
				
			}
			
			if(opc.equals("2")){
				
				idFacilitador = request.getParameter("IdFacilitadorEditar");
				
				if(idFacilitador.equals(""))
				{
					idFacilitador = "0";
				}
				
				if(fac.NGexistencia(Integer.parseInt(idFacilitador)))
				{
					f.setIdFacilitador(Integer.parseInt(request.getParameter("IdFacilitadorEditar")));
					f.setPrimerNombre(request.getParameter("primernombreEditar"));
					f.setSegundoNombre(request.getParameter("segundonombreEditar"));
					f.setPrimerApellido(request.getParameter("primerapellidoEditar"));
					f.setSegundoApellido(request.getParameter("segundoapellidoEditar"));
				
					m = fac.actualizarNGFacilitador(f);
					if(m == true)
					{
						response.sendRedirect("./modulos/taller/facilitador.jsp?msj=2");
					}
					else
					{
						response.sendRedirect("./modulos/taller/faciilitador.jsp");
					}
				}
				else
				{
					response.sendRedirect("./modulos/taller/facilitador.jsp?msj=4");
				}
				
			}
			
			if(opc.equals("3")){
				
				idFacilitador = request.getParameter("IdFacilitadorEliminar");
				if(idFacilitador.equals("0"))
				{
					idFacilitador = "0";
				}
				else
				{
					if(fac.NGexistencia(Integer.parseInt(idFacilitador)))
					{
						f.setIdFacilitador(Integer.parseInt(request.getParameter("IdFacilitadorEliminar")));
						e = fac.eliminarNGFacilitador(f);
						if(e == true)
						{
							response.sendRedirect("./modulos/taller/facilitador.jsp?msj=3");
						}
						else
						{
							response.sendRedirect("./modulos/taller/facilitador.jsp");
						}
					}
					else
					{
						response.sendRedirect("./modulos/taller/facilitador.jsp?msj=4");
					}
			}
			}
		}
		catch(Exception ex){
			
			ex.printStackTrace();
			System.out.println("Servlet: Error en el catch al verificar los datos del facilitador: -> " + ex.getMessage());
			response.sendRedirect("./modulos/taller/facilitador.jsp");
		}
		
	}

}
