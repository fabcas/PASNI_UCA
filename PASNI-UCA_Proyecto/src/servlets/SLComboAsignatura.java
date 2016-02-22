package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringEscapeUtils;

import java.util.*;

import negocio.NGAsignatura;
import entidades.Asignatura;
/**
 * Servlet implementation class SLComboAsignatura
 */
@WebServlet("/SLComboAsignatura")
public class SLComboAsignatura extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLComboAsignatura() {
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
		
		String out="";
		
		try{
			ArrayList<Asignatura> lista = new ArrayList<Asignatura>();
			NGAsignatura combo = new NGAsignatura();
			lista = combo.comboAsignatura();
			for(Asignatura enti : lista){
				
				out +="<option value=\""+enti.getIdAsigntatura()+"\">"+StringEscapeUtils.escapeHtml4(enti.getNombre())+"</option>";
			}
			PrintWriter pw = response.getWriter();
			pw.write(out);
			pw.flush();
			
		}catch(Exception e){
			e.printStackTrace();
			System.err.println("SL: EL ERROR ES: "+e.getMessage());
		}
	}

}
