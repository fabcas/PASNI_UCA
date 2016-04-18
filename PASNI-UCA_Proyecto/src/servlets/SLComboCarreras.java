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

import org.apache.commons.lang3.StringEscapeUtils;

import entidades.Carrera;

/**
 * Servlet implementation class SLComboCarreras
 */
@WebServlet("/SLComboCarreras")
public class SLComboCarreras extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLComboCarreras() {
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
			String id= request.getParameter("idFacultad");
			NGCarrera ngc = new NGCarrera();
			ArrayList<Carrera> listCar = new ArrayList<Carrera>();
			listCar = ngc.comboCarrera(id);
			for (Carrera car : listCar)
			{
				out +="<option value=\""+car.getCARR()+"\">"+StringEscapeUtils.escapeHtml4(car.getNOMBRE())+"</option>";
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
