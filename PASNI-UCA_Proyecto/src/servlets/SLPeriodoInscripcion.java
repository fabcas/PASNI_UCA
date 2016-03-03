package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.PeriodoInscripcion;
import negocio.NGPeriodoInscripcion;

/**
 * Servlet implementation class SLPeriodoInscripcion
 */
@WebServlet("/SLPeriodoInscripcion")
public class SLPeriodoInscripcion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLPeriodoInscripcion() {
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

		NGPeriodoInscripcion ngpi = new NGPeriodoInscripcion();
		PeriodoInscripcion pi = new PeriodoInscripcion();
		boolean g = false; //Verificar si guardó
		
		String opc = "";
		String idIP = "";
		String idC = "";
		String fechaI = "";
		String fechaF = "";
		opc = request.getParameter("opc");
		
		try{
		
			opc = request.getParameter("opc");
			
			if(opc.isEmpty() == true){
				response.sendRedirect("./modulos/monitor/periodo-inscripcion.jsp");
			}
			else if(opc.equals("1")){
				
				idIP = request.getParameter("idPeriodoInscripcion");
				pi.setIdPeriodoInscripcion(Integer.parseInt(idIP));
				idC = request.getParameter("idCuatrimestre");
				pi.setIdCuatrimestre(Integer.parseInt(idC));
				
				fechaI = request.getParameter("fechaInicio");
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date parsed = null;
				parsed = format.parse(fechaI);
				pi.setFechaInicio((new java.sql.Date(parsed.getTime())));
				
				fechaF = request.getParameter("fechaFin");

				SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date parsed1 = null;
				parsed1 = format1.parse(fechaF);
				pi.setFechaInicio((new java.sql.Date(parsed1.getTime())));
				g = ngpi.guardarPI(pi);
				if(g == true)
				{
					response.sendRedirect("./modulos/monitor/periodo-inscripcion.jsp?msj=1");
				}
					
				else
				{
					response.sendRedirect("./modulos/monitor/periodo-inscripcion.jsp");
				}
				
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Servlet: Error en el catch al guardar los datos del periodo: -> " + e.getMessage());
			response.sendRedirect("./modulos/monitor/periodo-inscripcion.jsp");
		}
			
	}

}
