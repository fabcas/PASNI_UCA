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
		String GRUP = "";
		try 
		{
			GRUP = request.getParameter("idGrupoAsis");
			NGGrupo comboT = new NGGrupo();
			ArrayList <Grupo> listCom = new ArrayList <Grupo>();
			listCom = comboT.cargarAsis(GRUP);
			for(Grupo entiCom: listCom)
			{
				out +="<input type='hidden' id='idgrupAsis' name='idgrupAsis' class='form-control'  value=\""+entiCom.getIdGrupo()+"\">";
				out +="<input type='hidden' id='asigAsis' name='asigAsis' class='form-control' value=\""+entiCom.getIdAsignatura()+"\">";
				out +="<input type='hidden' id='grupoAsis' name='grupoAsis' class='form-control'  value=\""+entiCom.getGRUP()+"\">";
				out +="<input type='hidden' id='aperAsis' name='aperAsis' class='form-control'  value=\""+entiCom.getAPER()+"\">";

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
