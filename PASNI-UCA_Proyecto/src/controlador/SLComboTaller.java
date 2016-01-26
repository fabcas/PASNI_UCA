package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NGTaller;
import datos.Cuatrimestre;
import org.apache.commons.lang3.StringEscapeUtils;

/**
 * Servlet implementation class SLComboTaller
 */
@WebServlet("/SLComboTaller")
public class SLComboTaller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLComboTaller() {
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
		// TODO Auto-generated method stub
	
		String out = "";
			
		try 
		{
			NGTaller comboT = new NGTaller();
			ArrayList <Cuatrimestre> listCom = new ArrayList <Cuatrimestre>();
			listCom = comboT.comboCuatrimestre();
			out += "<option value='0'>Seleccione...</option>";
			for(Cuatrimestre entiCom: listCom)
			{
				out +="<option value=\""+entiCom.getIdCuatrimestre()+"\">"+StringEscapeUtils.escapeHtml4(entiCom.getNombre())+"</option>";
				System.out.println("out in ajax: "+out);
			}
			
			PrintWriter pw = response.getWriter();
			pw.write(out);
			pw.flush();
			boolean error = pw.checkError();
			System.out.println("Error? "+error);
			
		} 
		
		catch (Exception e) 
		{
			System.out.println("SL: error en el servlet:" +e.getMessage());
			e.printStackTrace();
		}
	}

}
