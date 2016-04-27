package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.crypto.provider.RSACipher;

import negocio.NGGrupo;
import negocio.NGInforme;
import entidades.Estudiante;
import entidades.Grupo;
import entidades.Informe;

/**
 * Servlet implementation class SLInforme
 */
@WebServlet("/SLMonitoreo")
public class SLMonitoreo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLMonitoreo() {
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		try{
			String opc = "";
			String out = "";
			String idGrupo = "";
			String idInforme = "";
			boolean a = false; //agregar
			boolean m = false; //modificar
			
			Informe i = new Informe();
			NGInforme inf = new NGInforme();
			NGGrupo ng = new NGGrupo();
			
			opc = request.getParameter("opc");
			
			if(opc.isEmpty() == true){
				response.sendRedirect("./modulos/monitor/monitoreo.jsp");
			}
			else if(opc.equals("1")){
				
				idGrupo = request.getParameter("idGrupo");
				i.setIdGrupo(Integer.parseInt(idGrupo));
				i.setSemana(request.getParameter("semana"));
				i.setPregunta1(request.getParameter("p1"));
				i.setPregunta2(request.getParameter("p2"));
				i.setPregunta3(request.getParameter("p3"));
				i.setPregunta4(request.getParameter("p4"));
				i.setPregunta5(request.getParameter("p5"));
				
				a = inf.agregarInforme(i);
				if(a == true){
					response.sendRedirect("./modulos/monitor/monitoreo.jsp?msj=1");}
				else{
					response.sendRedirect("./modulos/monitor/monitoreo.jsp");}
			}
			else if(opc.equals("2")){
				idInforme = request.getParameter("idInformei");
				i.setIdInforme(Integer.parseInt(idInforme));
				i.setObservacionP(request.getParameter("observacionP"));
				i.setObservacionA(request.getParameter("observacionA"));
				
				m = inf.agregarObservacion(i);
				if(m == true){
					response.sendRedirect("./modulos/monitor/planificacion-monitoreo.jsp?msj=2");}
				else{
					response.sendRedirect("./modulos/monitor/planificacion-monitoreo.jsp");}
				
			}
			else if(opc.equals("3")){
				
				String APER = request.getParameter("aperAsis");
				String GRUP = request.getParameter("grupoAsis");
				String ASIG = request.getParameter("asigAsis");
				ArrayList<Estudiante> liste = new ArrayList<Estudiante>();
				liste = ng.cargarEstudiante(GRUP, APER, ASIG);
				
				out += "<thead>";
				out += "<tr class='headings'>";
					out += "<th class='column-title'># Carné</th>";
					out += "<th class='column-title'>Nombres y Apellidos</th>";
					out += "<th class='column-title'>Seleccione</th>";
				out += "</tr>";
				out += "</thead>";
				out += "<tbody>";
				for(Estudiante est: liste){
					out += "<tr class='even pointer'>";
						out += "<td class='a-center'>"+est.getNCAR()+"</td>";
						out += "<td class='a-center'>"+est.getNombrec()+"</td>";
						out += "<td class='a-center'>";
							out += "<input type='checkbox' name='checkg' id='checkg' value='"+est.getNCAR()+"'>";
						out += "</td>";
					out += "</tr>";
				}
				out += "</tbody>";
	
				PrintWriter pw = response.getWriter();
				pw.write(out);
				pw.flush();
				
			}
			else if(opc.equals("4")){
				
			}
		}catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Servlet: Error en el catch al cargar a los estudiantes: -> " + e.getMessage());
			response.sendRedirect("../../index.jsp");
		}
	}

}
