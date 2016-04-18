package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NGFacultad;
import negocio.NGTaller;
import negocio.NG_VwMaestroDeFacultad;

import org.apache.commons.lang3.StringEscapeUtils;

import entidades.Cuatrimestre;
import entidades.Facultad;

/**
 * Servlet implementation class SLComboFacultad
 */
@WebServlet("/SLComboFacultad")
public class SLComboFacultad extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLComboFacultad() {
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
		String out = "";
		try
		{
			NGFacultad ndm = new NGFacultad();
			ArrayList<Facultad> listFac= new ArrayList<Facultad>();
			listFac = ndm.comboFacultad();
			out += "<option value=''>SELECCIONE</option>";
			for (Facultad fac: listFac)
			{
				out +="<option value=\""+fac.getCOFA()+"\">"+StringEscapeUtils.escapeHtml4(fac.getNOMBRE())+"</option>";
			}
			PrintWriter pw = response.getWriter();
			pw.write(out);
			pw.flush();
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.err.println("SLComboFacultad: EL ERROR ES: "+e.getMessage());
		}
	}

}
