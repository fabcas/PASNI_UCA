package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NGSolicitudTaller;
import entidades.SolicitudTaller;

/**
 * Servlet implementation class SLSolicitudTaller
 */
@WebServlet("/SLSolicitudTaller")
public class SLSolicitudTaller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLSolicitudTaller() {
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
		
		SolicitudTaller st = new SolicitudTaller();
		NGSolicitudTaller ngs = new NGSolicitudTaller();
		boolean a = false;
		String opc = "";
		String idSolicitud = "";
		String estado = "";
		
		
		try{
			opc = request.getParameter("opc");
			
			if(opc.equals("1"))
			{
				idSolicitud = request.getParameter("idSolicitudTaller");
				st.setIdSolicitudTaller(Integer.parseInt(idSolicitud));
				st.setEstado(1);
				
				a = ngs.aprobarNGSolicitudTaller(st);
				
				if(a == true)
				{
					response.sendRedirect("./modulos/taller/bandejaSolicitudesTaller.jsp?msj=1");
				}
				else
				{
					response.sendRedirect("./modulos/taller/bandejaSolicitudesTaller.jsp");
				}
			}
			
		}
		catch(Exception e)
		{
			 e.printStackTrace();
			 System.out.println("Servlet: Error en el catch al verificar los datos del taller: -> " + e.getMessage());
			 response.sendRedirect("./modulos/taller/bandejaSolicitudesTaller.jsp");
		}

		
	}

}
