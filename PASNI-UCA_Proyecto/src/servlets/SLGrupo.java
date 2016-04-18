package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.Grupo;
import negocio.NGGrupo;

/**
 * Servlet implementation class SLGrupo
 */
@WebServlet("/SLGrupo")
public class SLGrupo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLGrupo() {
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

	try{
			String opc = "";
			String out = "";
			String CARR= request.getParameter("carrera");
			//String ANOMBRE= request.getParameter("nombreA");
			String APER= request.getParameter("idCuatrimestre");
			NGGrupo ng = new NGGrupo();
			ArrayList <Grupo> lista = new ArrayList <Grupo>();
			lista = ng.cargarGrupo(APER, CARR);
			
			opc = request.getParameter("opc");
			
				
						out += "<thead>";
							out += "<tr class='headings'>";
								out += "th class='column-title'>Grupo</th>";
								out += "th class='column-title'>Seleccione</th>";
							out += "</tr>";
						out += "</thead>";
						out += "<tbody>";
						for(Grupo gr : lista){
							out += "<tr class='even pointer'>";
								out += "<td class=''>"+gr.getGRUP()+"</td>";
								out += "<td class='a-center'>";
									out += "<input type='checkbox' class='tableflat'>";
								out += "</td>";
							out += "</tr";
						}
						out += "</tbody>";
			
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
