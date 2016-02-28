package servlets;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NGInscripcion;
import entidades.Inscripcion;
import entidades.Monitor;

/**
 * Servlet implementation class SLInscripcion
 */
@WebServlet("/SLInscripcion")
public class SLInscripcion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLInscripcion() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try{
			
			Inscripcion i = new Inscripcion();
			Monitor m = new Monitor();
			NGInscripcion ni = new NGInscripcion();
			boolean g = false; //Verificar si guardó
			
			String opc ="";
			String idAsignatura ="";
			String idCarrera= "";
			String promedio =""; 
			String estipendio =""; 
			String calificacion ="";
			String turno =""; 
			
			opc = request.getParameter("opc");
			
			if(opc.isEmpty() == true){
				response.sendRedirect("./modulos/monitor/inscripcion.jsp");
			}
			else if(opc.equals("1")){
				
				/*Monitor*/
				
				m.setPrimerNombre(request.getParameter("primerN"));
				m.setSegundoNombre(request.getParameter("segundoN"));
				m.setPrimerApellido(request.getParameter("primerA"));
				m.setSegundoApellido(request.getParameter("segundoA"));
				m.setEmail(request.getParameter("email"));
				m.setTelefono(request.getParameter("telefono"));
				m.setCarne(request.getParameter("carne"));
				promedio = request.getParameter("promedio");
				m.setPromedio(Float.parseFloat(promedio));
				idCarrera = request.getParameter("carrera");
				m.setIdCarrera(Integer.parseInt(idCarrera));
				estipendio = request.getParameter("estipendio");
				if("true".equals(estipendio)){
					m.setEstipendio(Boolean.parseBoolean("true"));
				}else{
					m.setEstipendio(Boolean.parseBoolean("false"));
				}
				
				/*Inscripción*/
				idAsignatura = request.getParameter("asignatura");
				i.setIdAsignatura(Integer.parseInt(idAsignatura));
				i.setMotivo(request.getParameter("motivo"));
				calificacion = request.getParameter("calificacion");
				i.setCalificación(Integer.parseInt(calificacion));
				turno = request.getParameter("turno");
				if("diurno".equals(turno)){
					i.setTurno("diurno");
				}else if("vespertino".equals(turno)){
					i.setTurno("vespertino");
				}else{
					i.setTurno("sabatino");
				}
				
				g = ni.guardarNGTaller(i,m);
				if(g == true){
					response.sendRedirect("./modulos/monitor/inscripcion.jsp?msj=1");
				}
				else{
					response.sendRedirect("./modulos/monitor/inscripcion.jsp");
				}
			}
		}	
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Servlet: Error en el catch al verificar los datos de la inscripción: -> " + e.getMessage());
			response.sendRedirect("./modulos/monitor/inscripcion.jsp");
		}
	}

}
