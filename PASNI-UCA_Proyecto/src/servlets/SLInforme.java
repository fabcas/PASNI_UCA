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
@WebServlet("/SLInforme")
public class SLInforme extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLInforme() {
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

		Informe i = new Informe();
		NGInforme inf = new NGInforme();
		
		String opc = "";
		String idMonitor = "";
		String idCuatrimestre = "";
		boolean a = false; //agregar
		
		opc = request.getParameter("opc");
		
		if(opc.isEmpty() == true){
			response.sendRedirect("./modulos/monitor/monitoreo.jsp");
		}
		else if(opc.equals("1")){
			
			idMonitor = request.getParameter("");
			i.setIdMonitor(Integer.parseInt(idMonitor));
			
			a = inf.agregarInforme(i);
			if(a == true){
				response.sendRedirect("./modulos/monitor/monitoreo.jsp?msj=1");}
			else{
				response.sendRedirect("./modulos/monitor/inscripcion.jsp");}
		}
	}

}
