package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NGFacilitador;
import negocio.NGInstanciasUCA;
import entidades.Facilitador;
import entidades.InstanciasUCA;

/**
 * Servlet implementation class SLInstanciasUCA
 */
@WebServlet("/SLInstanciasUCA")
public class SLInstanciasUCA extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLInstanciasUCA() {
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
			String idInstancia = "";
			InstanciasUCA iu = new InstanciasUCA();
			NGInstanciasUCA ngiu = new NGInstanciasUCA();
			boolean g = false;
			boolean m = false;
			boolean e = false;
			
			opc = request.getParameter("opc");
			
			
			if(opc.equals("1")){
				
				iu.setNombre(request.getParameter("nombre"));
				iu.setDescripcion(request.getParameter("descripcion"));
				
				g = ngiu.guardarNGInstancias(iu);
				if( g == true){
					response.sendRedirect("./modulos/profesor/instancias-uca.jsp?msj=1");
				}
				else{
					response.sendRedirect("./modulos/profesor/instancias-uca.jsp");
				}
				
			}
			
			if(opc.equals("2")){
				
				idInstancia = request.getParameter("IdInstanciaEditar");
				
				if(idInstancia.equals(""))
				{
					idInstancia = "0";
				}
				
				if(ngiu.NGexistencia(Integer.parseInt(idInstancia)))
				{
					iu.setIdInstancia(Integer.parseInt(request.getParameter("IdInstanciaEditar")));
					iu.setNombre(request.getParameter("nombreEditar"));
					iu.setDescripcion(request.getParameter("descripcionEditar"));
					
					m = ngiu.actualizarNGInstancias(iu);
					if(m == true)
					{
						response.sendRedirect("./modulos/profesor/instancias-uca.jsp?msj=2");
					}
					else
					{
						response.sendRedirect("./modulos/profesor/instancias-uca.jsp");
					}
				}
				else
				{
					response.sendRedirect("./modulos/profesor/instancias-uca.jsp?msj=4");
				}
				
			}
			
			if(opc.equals("3")){
				
				idInstancia = request.getParameter("IdInstanciaEliminar");
				if(idInstancia.equals("0"))
				{
					idInstancia = "0";
				}
				else
				{
					if(ngiu.NGexistencia(Integer.parseInt(idInstancia)))
					{
						iu.setIdInstancia(Integer.parseInt(request.getParameter("IdInstanciaEliminar")));
						e = ngiu.eliminarNGInstancias(iu);
						if(e == true)
						{
							response.sendRedirect("./modulos/profesor/instancias-uca.jsp?msj=3");
						}
						else
						{
							response.sendRedirect("./modulos/profesor/instancias-uca.jsp");
						}
					}
					else
					{
						response.sendRedirect("./modulos/profesor/instancias-uca.jsp?msj=4");
					}
			}
			}
		}
		catch(Exception ex){
			
			ex.printStackTrace();
			System.out.println("Servlet: Error en el catch al verificar los datos de la Instancia UCA: -> " + ex.getMessage());
			response.sendRedirect("./modulos/profesor/instancias-uca.jsp");
		}
	}

}
