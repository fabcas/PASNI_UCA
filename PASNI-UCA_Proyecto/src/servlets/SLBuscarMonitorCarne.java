package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NGCarrera;
import negocio.NGMonitor;

import org.apache.commons.lang3.StringEscapeUtils;

import entidades.Carrera;
import entidades.Monitor;

/**
 * Servlet implementation class SLBuscarMonitorCarne
 */
@WebServlet("/SLBuscarMonitorCarne")
public class SLBuscarMonitorCarne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLBuscarMonitorCarne() {
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
		try
		{
			String out = "";
			String carne= request.getParameter("carneA");
			NGMonitor ngm = new NGMonitor();
			ArrayList<Monitor> list = new ArrayList<Monitor>();
			list = ngm.buscarMonitorC(carne);
			
			for(Monitor m : list){
				out +="<div class='col-md-6 col-sm-6 col-xs-12 form-group'>";
					out +="<input type='text' id='nombreP' name='nombreP' required='required' class='form-control' disabled='disabled' value=\""+m.getPrimerNombre()+"\">";
				out +="</div>";
				out +="<div class='col-md-6 col-sm-6 col-xs-12 form-group'>";
					out +="<input type='text' id='nombreS' name='nombreS' required='required' class='form-control' disabled='disabled' value=\""+m.getSegundoNombre()+"\">";
				out +="</div>";
				out +="<div class='col-md-6 col-sm-6 col-xs-12 form-group'>";
					out +="<input type='text' id='apeliidoP' name='apeliidoP' required='required' class='form-control' disabled='disabled' value=\""+m.getPrimerApellido()+"\">";
				out +="</div>";
				out +="<div class='col-md-6 col-sm-6 col-xs-12 form-group'>";
					out +="<input type='text' id='apeliidoS' name='apeliidoS' required='required' class='form-control' disabled='disabled' value=\""+m.getSegundoApellido()+"\">";
				out +="</div>";
				out +="<div class='col-md-6 col-sm-6 col-xs-12 form-group'>";
					out +="<input type='hidden' id='idMonitor' name='idMonitor' value=\""+m.getIdMonitor()+"\">";
				out +="</div>";
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
