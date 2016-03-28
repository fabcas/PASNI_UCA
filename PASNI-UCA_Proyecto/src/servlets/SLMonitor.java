package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NGMonitor;
import entidades.Monitor;

/**
 * Servlet implementation class SLMonitor
 */
@WebServlet("/SLMonitor")
public class SLMonitor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLMonitor() {
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
			NGMonitor ngm = new NGMonitor();
			Monitor m = new Monitor();
			boolean a = false; //Agregar
			boolean e = false; //Editar
			boolean el = false; //Eliminar
			
			String opc = "";
			String idM = "";
			String idC = "";
			String promedio = "";
			opc = request.getParameter("opc");
			
			if(opc.isEmpty() == true){
				response.sendRedirect("./modulos/monitor/monitor.jsp");
				
			}
			else if(opc.equals("1")){
				
				m.setCarne(request.getParameter("carneA"));
				m.setPrimerNombre(request.getParameter("nombrePA"));
				m.setSegundoNombre(request.getParameter("nombreSA"));
				m.setPrimerApellido(request.getParameter("apellidoPA"));
				m.setSegundoApellido(request.getParameter("apellidoSA"));
				m.setEmail(request.getParameter("emailA"));
				m.setTelefono(request.getParameter("telefonoA"));
				idC = request.getParameter("carrera");
				m.setIdCarrera(Integer.parseInt(idC));
				promedio = request.getParameter("promedioA");
				m.setPromedio(Float.parseFloat(promedio));
				
				a = ngm.agregarMonitor(m);
				if(a == true)
				{
					response.sendRedirect("./modulos/monitor/monitor.jsp?msj=1");
				}
					
				else
				{
					response.sendRedirect("./modulos/monitor/monitor.jsp");
				}
				
			}else if (opc.equals("2")){
				
				idM = request.getParameter("idMonitorE");
				m.setIdMonitor(Integer.parseInt(idM));
				m.setCarne(request.getParameter("carneE"));
				m.setPrimerNombre(request.getParameter("nombrePE"));
				m.setSegundoNombre(request.getParameter("nombreSE"));
				m.setPrimerApellido(request.getParameter("apellidoEP"));
				m.setSegundoApellido(request.getParameter("apellidoSE"));
				m.setEmail(request.getParameter("emailA"));
				m.setTelefono(request.getParameter("telefonoA"));
				idC = request.getParameter("carrera");
				m.setIdCarrera(Integer.parseInt(idC));
				promedio = request.getParameter("promedioEM");
				m.setPromedio(Float.parseFloat(promedio));
				
				e = ngm.editarMonitor(m);
				if(e == true)
				{
					response.sendRedirect("./modulos/monitor/monitor.jsp?msj=2");
				}
					
				else
				{
					response.sendRedirect("./modulos/monitor/monitor.jsp");
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Servlet: Error en el catch al guardar los datos del estudiante monitor: -> " + e.getMessage());
			response.sendRedirect("./modulos/monitor/monitor.jsp");
		}
	}

}
