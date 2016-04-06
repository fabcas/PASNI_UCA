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
			String opc = "";
			String out = "";
			String carne= request.getParameter("carneA");
			NGMonitor ngm = new NGMonitor();
			ArrayList<Monitor> list = new ArrayList<Monitor>();
			list = ngm.buscarMonitorC(carne);
			
			opc = request.getParameter("opc");
			
			 if(opc.equals("1")){
			
				for(Monitor m : list){
					out +="<div class='col-md-6 col-sm-6 col-xs-12 form-group'>";
						out +="<input type='text' id='nombreP' name='nombreP' required='required' class='form-control' disabled='disabled' value=\""+m.getPrimerNombre()+"\">";
					out +="</div>";
					out +="<div class='col-md-6 col-sm-6 col-xs-12 form-group'>";
						out +="<input type='text' id='nombreS' name='nombreS' required='required' class='form-control' disabled='disabled' value=\""+m.getSegundoNombre()+"\">";
					out +="</div>";
					out +="<div class='col-md-6 col-sm-6 col-xs-12 form-group'>";
						out +="<input type='text' id='apellidoP' name='apellidoP' required='required' class='form-control' disabled='disabled' value=\""+m.getPrimerApellido()+"\">";
					out +="</div>";
					out +="<div class='col-md-6 col-sm-6 col-xs-12 form-group'>";
						out +="<input type='text' id='apellidoS' name='apellidoS' required='required' class='form-control' disabled='disabled' value=\""+m.getSegundoApellido()+"\">";
					out +="</div>";
					out +="<input type='hidden' id='idMonitor' name='idMonitor' value=\""+m.getIdMonitor()+"\">";
				}
				
				PrintWriter pw = response.getWriter();
				pw.write(out);
				pw.flush();
			}else if(opc.equals("2")){
				for(Monitor mo : list){
                    out +="<div>";
                        out +="<input type='text' id='nombreS' name='nombreS' required='required' class='form-control' disabled='disabled' value=\""+mo.getPrimerNombre()+ " " + mo.getPrimerApellido()+"\">";
                    out +="</div>";
                    out +="<div>";
                        out +="<input type='email' class='form-control' placeholder='Correo'  disabled='disabled' value=\""+mo.getEmail()+"\">";
                    out +="</div>";
                    out +="<div>";
                        out +="<input type='text' id='usuario' name='usuario' class='form-control' placeholder='Usuario'>";
                    out +="</div>";
                    out +="<div>";
                        out +="<input type='password' id='pass' name='pass' class='form-control' placeholder='Contraseña'>";
                    out +="</div>";
                    out +="<input type='hidden' id='idMonitor' name='idMonitor' value=\""+mo.getIdMonitor()+"\">";
                    out += "<button type='submit' class='btn btn-primary'>Enviar</button>";
                }
                
                PrintWriter pw = response.getWriter();
                pw.write(out);
                pw.flush();
			}
		
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.err.println("SL: EL ERROR ES: "+e.getMessage());
		}
	}

}
