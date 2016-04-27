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
import entidades.DetalleSolicitudTaller;
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
		DetalleSolicitudTaller dst = new DetalleSolicitudTaller();
		NGSolicitudTaller ngs = new NGSolicitudTaller();
		boolean a = false;
		String opc = "";
		String idSolicitud = "";
		String estado = "";
		Date fechaActual = new Date();
		String idTaller = "";
		String idTaller1 = "";
		String idTaller2 = "";
		String idProfesor = "";
		String fecha = "";
		String dia = "";
		
		try{
			opc = request.getParameter("opc");
			
			if(opc.equals("1"))
			{
				
				
				/* Talleres */
				idTaller = request.getParameter("taller1");
				dst.setIdTaller1(Integer.parseInt(idTaller));
				
				idTaller1 = request.getParameter("taller2");
				dst.setIdTaller2(Integer.parseInt(idTaller1));
				
				idTaller2 = request.getParameter("taller3");
				dst.setIdTaller3(Integer.parseInt(idTaller2));
				
				/* Fin de Talleres */
				
				//Id del Profesor
				idProfesor = request.getParameter("idUsuario");
				st.setIdProfesor(Integer.parseInt(idProfesor));
				
				//Fecha de la solicitud
				fecha = request.getParameter("fecha");
				
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date parsed = null;
				parsed = format.parse(fecha);
				st.setFechaSolicitud((new java.sql.Date(parsed.getTime())));
				
				//Día propuesto
				dia = request.getParameter("diapropuesto");
				SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date parsed2 = null;
				parsed2 = format2.parse(dia);
				st.setDiaPropuesto((new java.sql.Date(parsed2.getTime())));
				
				//Horario propuesto
				st.setHorarioPropuesto(Integer.parseInt(request.getParameter("horario")));
				
				//Cantidad de estudiantes
				st.setCantidadEstudiantes(Integer.parseInt(request.getParameter("cantidadEstudiantes")));
				//st.setEstado(1);
				
				a = ngs.guardarSolicitudTaller(st, dst);
				
				if(a == true)
				{
					response.sendRedirect("./modulos/taller/solicitar-taller.jsp?msj=1");
				}
				else
				{
					response.sendRedirect("./modulos/taller/solicitar-taller.jsp");
				}
			}
			
			if(opc.equals("2")){
				
			}
			
		}
		catch(Exception e)
		{
			 e.printStackTrace();
			 System.out.println("Servlet: Error en el catch al verificar los datos del taller: -> " + e.getMessage());
			 response.sendRedirect("./modulos/taller/solicitar-taller.jsp");
		}

		
	}

}
