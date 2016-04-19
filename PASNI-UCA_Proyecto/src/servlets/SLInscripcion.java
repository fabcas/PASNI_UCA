package servlets;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NGInscripcion;
import negocio.NGPeriodoInscripcion;
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
	
		NGPeriodoInscripcion pi = new NGPeriodoInscripcion();
		
		
		try{
			
			Inscripcion i = new Inscripcion();
			Monitor m = new Monitor();
			NGInscripcion ni = new NGInscripcion();
			boolean a = false; //agregar
			boolean e = false; //editar
			boolean ai = false; //agregar inscripcion
			
			String opc ="";
			//String idAsignatura ="";
			String promedio =""; 
			String calificacion ="";
			String turno =""; 
			String estado= "";
			String idInscripcion = "";
			String idMonitor = "";
			
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
				m.setCARR(request.getParameter("carrera"));
				
				/*Inscripción*/
				i.setIdAsignatura(request.getParameter("asignatura"));
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
				
				a = ni.guardarNGInscripcion(i, m);
				if(a == true){
					response.sendRedirect("./modulos/monitor/inscripcion.jsp?msj=1");}
				else{
					response.sendRedirect("./modulos/monitor/inscripcion.jsp");}
			}
			else if(opc.equals("2")){
				
				/*Inscripción*/
				idInscripcion = request.getParameter("idInscripcionE");
				i.setIdInscripcion(Integer.parseInt(idInscripcion));
				i.setIdAsignatura(request.getParameter("asignatura"));
				calificacion = request.getParameter("calificacionE");
				i.setCalificación(Integer.parseInt(calificacion));
				i.setMotivo(request.getParameter("motivoE"));
				turno = request.getParameter("turnoE");
				if("diurno".equals(turno)){
					i.setTurno("diurno");
				}else if("vespertino".equals(turno)){
					i.setTurno("vespertino");
				}else if("sabatino".equals(turno)){
					i.setTurno("sabatino");
				}
				estado = request.getParameter("estadoE");
				if("1".equals(estado)){
					i.setEstado(1);
				}else if("2".equals(estado)){
					i.setEstado(2);
				}
				e = ni.modificarInscripcion(i);
				if(e == true){
					response.sendRedirect("./modulos/monitor/bandeja-solicitud-monitor.jsp?msj=2");}
				else{
					response.sendRedirect("./modulos/monitor/bandeja-solicitud-monitor.jsp");}
			}
			else if(opc.equals("3")){
				
				idMonitor = request.getParameter("idMonitor");
				i.setIdMonitor(Integer.parseInt(idMonitor));
				i.setIdAsignatura(request.getParameter("asignatura"));
				calificacion = request.getParameter("calificacionA");
				i.setCalificación(Integer.parseInt(calificacion));
				i.setMotivo(request.getParameter("motivoA"));
				turno = request.getParameter("turnoA");
				if("diurno".equals(turno)){
					i.setTurno("diurno");
				}else if("vespertino".equals(turno)){
					i.setTurno("vespertino");
				}else{
					i.setTurno("sabatino");
				}
				estado = request.getParameter("estadoA");
				if("1".equals(estado)){
					i.setEstado(1);
				}else if("2".equals(estado)){
					i.setEstado(2);
				}
				
				ai = ni.agregarInscripcion(i);
				if(ai == true){
					response.sendRedirect("./modulos/monitor/bandeja-solicitud-monitor.jsp?msj=3");}
				else{
					response.sendRedirect("./modulos/monitor/bandeja-solicitud-monitor.jsp");}
			}
		}	
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Servlet: Error en el catch al verificar los datos de la inscripción: -> " + e.getMessage());
			response.sendRedirect("../../index.jsp");
		}
	}

}
