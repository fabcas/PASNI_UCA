package servlets;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

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

		try{
			
			NGPeriodoInscripcion ngpi = new NGPeriodoInscripcion();
			PeriodoInscripcion pi = new PeriodoInscripcion();
			boolean a = false; //Agregar
			boolean e = false; //Editar
			boolean el = false; //Eliminar
			
			String opc = "";
			String idC = "";
			String idPI = "";
			String fechaI = "";
			String fechaF = "";
			opc = request.getParameter("opc");
			
			if(opc.isEmpty() == true){
				response.sendRedirect("./modulos/monitor/periodo-inscripcion.jsp");
				
			}
			else if(opc.equals("1")){
				
				idC = request.getParameter("idCuatrimestre");
				pi.setIdCuatrimestre(Integer.parseInt(idC));
				
				fechaI = request.getParameter("fechaInicio");
				fechaF = request.getParameter("fechaFin");
				
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date parsed = null;
				parsed = format.parse(fechaI);
				pi.setFechaInicio((new java.sql.Date(parsed.getTime())));
					  
				SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date parsed2 = null;
				parsed2 = format2.parse(fechaF);
				pi.setFechaFin((new java.sql.Date(parsed2.getTime())));
				
				a = ngpi.guardarPI(pi);
				if(a == true)
				{
					response.sendRedirect("./modulos/monitor/periodo-inscripcion.jsp?msj=1");
				}
					
				else
				{
					response.sendRedirect("./modulos/monitor/periodo-inscripcion.jsp");
				}
				
			}else if (opc.equals("2")){
				
				idPI = request.getParameter("IdPIEditar");
				pi.setIdPeriodoInscripcion(Integer.parseInt(idPI));
				
				fechaI = request.getParameter("fechaIEditar");
				
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date parsed = null;
				parsed = format.parse(fechaI);
				pi.setFechaInicio((new java.sql.Date(parsed.getTime())));
				
				fechaF = request.getParameter("fechaFEditar");
				SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date parsed2 = null;
				parsed2 = format2.parse(fechaF);
				pi.setFechaFin((new java.sql.Date(parsed2.getTime())));
				
				e = ngpi.editarPI(pi);
				if(e == true)
				{
					response.sendRedirect("./modulos/monitor/periodo-inscripcion.jsp?msj=2");
				}
					
				else
				{
					response.sendRedirect("./modulos/monitor/periodo-inscripcion.jsp");
				}
			}
			else if(opc.equals("3"))
			{
				idPI = request.getParameter("IdPIEliminar");
				pi.setIdPeriodoInscripcion(Integer.parseInt(idPI));
				
				el = ngpi.eliminarPI(pi);
				if(el == true)
				{
					response.sendRedirect("./modulos/monitor/periodo-inscripcion.jsp?msj=3");
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
