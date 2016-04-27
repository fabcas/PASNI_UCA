package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import datos.MDPeriodoInscripcion;
import entidades.PeriodoInscripcion;

/**
 * Servlet implementation class SLInicioSesion
 */
@WebServlet("/SLInicioSesion")
public class SLInicioSesion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLInicioSesion() {
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
		try {
				MDPeriodoInscripcion pi = new MDPeriodoInscripcion();
				PeriodoInscripcion PI = new PeriodoInscripcion();
			    String fechaActual;
			    boolean g = false;
				
			    fechaActual = request.getParameter("fecha");
			    
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date parsed;
				parsed = format.parse(fechaActual);
				PI.setFechaActual((new java.util.Date(parsed.getTime())));
				
				g = pi.verificarPeriodo(PI);
				if(g == true){
					response.sendRedirect("modulos/monitor/inscripcion.jsp");
				}else{
					response.sendRedirect("modulos/monitor/inscripcions.jsp");
				}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Servlet: Error en el catch: -> " + e.getMessage());
			response.sendRedirect("modulos/monitor/inscripcions.jsp");
		}
	}

}
