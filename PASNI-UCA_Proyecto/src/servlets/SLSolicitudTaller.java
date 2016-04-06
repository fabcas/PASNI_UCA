package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
		Date fechaActual = new Date();
		String idTaller = "";
		String idProfesor = "";
		String fecha = "";
		
		try{
			opc = request.getParameter("opc");
			
			if(opc.equals("1"))
			{
				
				idTaller = request.getParameter("taller");
				st.setIdTaller(Integer.parseInt(idTaller));
				idProfesor = request.getParameter("idUsuario");
				st.setIdProfesor(Integer.parseInt(idProfesor));
				fecha = request.getParameter("fecha");
				
				
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date parsed = null;
				parsed = format.parse(fecha);
				st.setFechaSolicitud((new java.sql.Date(parsed.getTime())));
				
				st.setHorarioPropuesto(request.getParameter("horario"));
				st.setCantidadEstudiantes(Integer.parseInt(request.getParameter("cantidadEstudiantes")));
				//st.setEstado(1);
				
				a = ngs.guardarSolicitudTaller(st);
				
				if(a == true)
				{
					response.sendRedirect("./modulos/taller/solicitarTaller.jsp?msj=1");
				}
				else
				{
					response.sendRedirect("./modulos/taller/solicitarTaller.jsp");
				}
			}
			
		}
		catch(Exception e)
		{
			 e.printStackTrace();
			 System.out.println("Servlet: Error en el catch al verificar los datos del taller: -> " + e.getMessage());
			 response.sendRedirect("./modulos/taller/solicitarTaller.jsp");
		}

		
	}

}
