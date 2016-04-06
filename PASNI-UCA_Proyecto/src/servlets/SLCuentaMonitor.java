package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NGMonitor;
import entidades.Monitor;

/**
 * Servlet implementation class SLCuentaMonitor
 */
@WebServlet("/SLCuentaMonitor")
public class SLCuentaMonitor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLCuentaMonitor() {
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
		try
		{
			String out = "";
			String carne= request.getParameter("carne");
			NGMonitor ngm = new NGMonitor();
			ArrayList<Monitor> list = new ArrayList<Monitor>();
			list = ngm.buscarMonitorC(carne);
			
			for(Monitor m : list){
				out +="<div>";
					out +="<input type='text' id='nombreS' name='nombreS' required='required' class='form-control' disabled='disabled' value=\""+m.getPrimerNombre()+ m.getPrimerApellido()+"\">";
				out +="</div>";
				out +="<div>";
					out +="<input type='email' class='form-control' placeholder='Correo'  value=\""+m.getEmail()+"\">";
				out +="</div>";
				out +="<div>";
					out +="<input type='text' id='usuario' name='usuario' class='form-control' placeholder='Usuario'>";
				out +="</div>";
				out +="<div>";
					out +="<input type='password' id='pass' name='pass' class='form-control' placeholder='Contraseña'>";
				out +="</div>";
				out +="<input type='hidden' id='idMonitor' name='idMonitor' value=\""+m.getIdMonitor()+"\">";
			}
			
			PrintWriter pw = response.getWriter();
			pw.write(out);
			pw.flush();
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.err.println("SL: EL ERROR ES: "+e.getMessage());
		}
	}

}
