package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.crypto.provider.RSACipher;

import negocio.NGInforme;
import entidades.Informe;

/**
 * Servlet implementation class SLInforme
 */
@WebServlet("/SLMonitoreo")
public class SLMonitoreo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLMonitoreo() {
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
			String opc = "";
			String idGrupo = "";
			String idInforme = "";
			boolean a = false; //agregar
			boolean m = false; //modificar
			
			Informe i = new Informe();
			NGInforme inf = new NGInforme();
			
			opc = request.getParameter("opc");
			
			if(opc.isEmpty() == true){
				response.sendRedirect("./modulos/monitor/monitoreo.jsp");
			}
			else if(opc.equals("1")){
				
				idGrupo = request.getParameter("idGrupo");
				i.setIdGrupo(Integer.parseInt(idGrupo));
				i.setSemana(request.getParameter("semana"));
				i.setPregunta1(request.getParameter("p1"));
				i.setPregunta2(request.getParameter("p2"));
				i.setPregunta3(request.getParameter("p3"));
				i.setPregunta4(request.getParameter("p4"));
				i.setPregunta5(request.getParameter("p5"));
				
				a = inf.agregarInforme(i);
				if(a == true){
					response.sendRedirect("./modulos/monitor/monitoreo.jsp?msj=1");}
				else{
					response.sendRedirect("./modulos/monitor/monitoreo.jsp");}
			}
			else if(opc.equals("2")){
				idInforme = request.getParameter("idInformei");
				i.setIdInforme(Integer.parseInt(idInforme));
				i.setObservacionP(request.getParameter("observacionP"));
				i.setObservacionA(request.getParameter("observacionA"));
				
				m = inf.agregarObservacion(i);
				if(m == true){
					response.sendRedirect("./modulos/monitor/planificacion-monitoreo.jsp?msj=2");}
				else{
					response.sendRedirect("./modulos/monitor/planificacion-monitoreo.jsp");}
				
			}
		}catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Servlet: Error en el catch al guardar el informe: -> " + e.getMessage());
			response.sendRedirect("../../index.jsp");
		}
	}

}
