package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NGGrupo;
import negocio.NGTaller;

import org.apache.commons.lang3.StringEscapeUtils;

import entidades.Cuatrimestre;
import entidades.Grupo;

/**
 * Servlet implementation class SLComboGrupo
 */
@WebServlet("/SLComboGrupo")
public class SLComboGrupo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLComboGrupo() {
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
		String usuario = "";
		try 
		{
			usuario = request.getParameter("usuario");
			NGGrupo comboT = new NGGrupo();
			ArrayList <Grupo> listCom = new ArrayList <Grupo>();
			listCom = comboT.cargarGrupoU(Integer.parseInt(usuario));
			out += "<option value='0'>Seleccione...</option>";
			for(Grupo entiCom: listCom)
			{
				out +="<option value=\""+entiCom.getIdGrupo()+"\">"+StringEscapeUtils.escapeHtml4(entiCom.getGRUP())+"</option>";
				System.out.println("out in ajax: "+out);
			}
			
			PrintWriter pw = response.getWriter();
			pw.write(out);
			System.out.println(out);
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
