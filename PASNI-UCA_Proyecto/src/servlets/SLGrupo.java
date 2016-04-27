package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidades.GestionHorario;
import entidades.Grupo;
import entidades.HorarioAula;
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
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
	try{
			//var
			String opc = "";
			String out = "";
			boolean a = false;
			
			//ent
			NGGrupo ng = new NGGrupo();
			
			Grupo g = new Grupo();
			GestionHorario gh = new GestionHorario();
			HorarioAula ha = new HorarioAula();
			
			//val
			opc = request.getParameter("opc");
			
			String idDocente = "";
			String idInscripcion = "";
			
			if(opc.equals("1")){
				
				String CARR= request.getParameter("carrera");
				String APER= request.getParameter("idCuatrimestre");
				String CODIASI = request.getParameter("idAsignatura");
				
				ArrayList <Grupo> lista = new ArrayList <Grupo>();
				lista = ng.cargarGrupo(APER, CARR, CODIASI);
				
				out += "<thead>";
				out += "<tr class='headings'>";
					out += "<th class='column-title'>Grupo</th>";
					out += "<th class='column-title'>Seleccione</th>";
				out += "</tr>";
				out += "</thead>";
				out += "<tbody>";
				for(Grupo gr : lista){
					out += "<tr class='even pointer'>";
						out += "<td class='a-center'>"+gr.getGRUP()+"</td>";
						out += "<td class='a-center'>";
							out += "<input type='checkbox' name='check' id='check' value='"+gr.getGRUP()+"'>";
						out += "</td>";
					out += "</tr>";
				}
				out += "</tbody>";
	
				PrintWriter pw = response.getWriter();
				pw.write(out);
				pw.flush();
			}
			else if(opc.equals("2")){
				
				String [] ListCheck = request.getParameterValues("check");
				if(ListCheck!=null && ListCheck.length>0 && ListCheck.length<=3)
				{
					for(int i=0; i<ListCheck.length; i++){
						idDocente = request.getParameter("idProfesor");
						g.setIdDocente(Integer.parseInt(idDocente));
						idInscripcion = request.getParameter("idInscripcion");
						g.setIdInscripcion(Integer.parseInt(idInscripcion));
						g.setCARR(request.getParameter("carrera"));
						g.setGRUP(ListCheck[i]);
						g.setAPER(request.getParameter("idCuatrimestre"));
						a = ng.agregarGrupo(g);
						
						if(a == true){
							response.sendRedirect("./modulos/monitor/planificacion-monitoreo.jsp?msj=1");}
						else{
							response.sendRedirect("./modulos/monitor/planificacion-monitoreo.jsp");}
					}
				}else{
					response.sendRedirect("./modulos/monitor/planificacion-monitoreo.jsp?msj=2");
				}
			}
			else if(opc.equals("3")){
				
				String id = request.getParameter("IDP");
				String CUATRI = request.getParameter("CUATRI");
				System.out.println(CUATRI);
				String CAR = request.getParameter("CAR");
				System.out.println(CAR);
				
				//parse
				int IDP = Integer.parseInt(id);
				System.out.println(IDP);
				
				ArrayList <Grupo> listah = new ArrayList <Grupo>();
				listah = ng.cargarGrupoP(CUATRI, CAR, IDP);
				//System.out.println(listah.get(0).getIdGrupo());
				out += "<thead>";
				out += "<tr class='headings'>";
					out += "<th class='column-title'># Grupo</th>";
					out += "<th class='column-title'>Grupo</th>";
					out += "<th class='column-title'>Seleccione</th>";
				out += "</tr>";
				out += "</thead>";
				out += "<tbody>";
				for(Grupo gru : listah){
					System.out.println("Entró al for: "+gru.getIdGrupo());
					out += "<tr class='even pointer'>";
						out += "<td class='a-center'>"+gru.getIdGrupo()+"</td>";
						System.out.println(out);
						out += "<td class='a-center'>"+gru.getGRUP()+"</td>";
						System.out.println(out);
						out += "<td class='a-center'>";
							out += "<input type='checkbox' name='checkg' id='checkg' value='"+gru.getIdGrupo()+"'>";
						out += "</td>";
					out += "</tr>";
				}
				out += "</tbody>";
	
				PrintWriter pw = response.getWriter();
				pw.write(out);
				pw.flush();
			}
			else if(opc.equals("4")){
				
						String idgrupo = request.getParameter("idgrupo");
						gh.setIdGrupo(Integer.parseInt(idgrupo));
						ha.setCODIAULA(request.getParameter("idAula"));
						ha.setDia(request.getParameter("dia"));
						ha.setHoraInicio(request.getParameter("horaInicio"));
						ha.setHoraFin(request.getParameter("horaFin"));
						a = ng.agregarGestionH(gh, ha);
						
						if(a == true){
							response.sendRedirect("./modulos/monitor/planificacion-monitoreo.jsp?msj=3");}
						else{
							response.sendRedirect("./modulos/monitor/planificacion-monitoreo.jsp");}
					
				}else{
					response.sendRedirect("./modulos/monitor/planificacion-monitoreo.jsp?msj=4");
				}
						
		}

		catch (Exception e)
		{
				e.printStackTrace();
				System.err.println("SL: EL ERROR ES: "+e.getMessage());
		}
	}

}
