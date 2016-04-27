package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NGFacilitador;
import negocio.NGHorarioTaller;
import entidades.Facilitador;
import entidades.HorarioTaller;

/**
 * Servlet implementation class SLHorarioTaller
 */
@WebServlet("/SLHorarioTaller")
public class SLHorarioTaller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLHorarioTaller() {
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
			String value = "";
			String idHorarioTaller = "";
			HorarioTaller h = new HorarioTaller();
			NGHorarioTaller ht  = new NGHorarioTaller();
			boolean g = false;
			boolean m = false;
			boolean e = false;
			
			opc = request.getParameter("opc");
			
			
			if(opc.equals("1")){
				
				h.setHoraInicio(request.getParameter("horainicio"));
				h.setHoraFin(request.getParameter("horafin"));
				value = request.getParameter("turno");
				
				if(value.equals("1")){
					value = "AM";
					h.setTurno(value);
				}
				else if(value.equals("2")){
					value = "PM";
					h.setTurno(value);
				}
				//h.setTurno(request.getParameter("turno"));
				
				g = ht.guardarNGHorarioTaller(h);
				if( g == true){
					response.sendRedirect("./modulos/taller/horario-taller.jsp?msj=1");
				}
				else{
					response.sendRedirect("./modulos/taller/horario-taller.jsp");
				}
				
			}
			
			if(opc.equals("2")){
				
				idHorarioTaller = request.getParameter("IdHorarioTallerEditar");
				
				if(idHorarioTaller.equals(""))
				{
					idHorarioTaller = "0";
				}
				
				if(ht.NGexistencia(Integer.parseInt(idHorarioTaller)))
				{
					h.setIdHorarioTaller(Integer.parseInt(request.getParameter("IdHorarioTallerEditar")));
					h.setHoraInicio(request.getParameter("horainicioEditar"));
					h.setHoraFin(request.getParameter("horafinEditar"));
					value = request.getParameter("turno");
					
					if(value.equals("1")){
						value = "AM";
						h.setTurno(value);
					}
					else if(value.equals("2")){
						value = "PM";
						h.setTurno(value);
					}
				
					m = ht.actualizarNGHorarioTaller(h);
					if(m == true)
					{
						response.sendRedirect("./modulos/taller/horario-taller.jsp?msj=2");
					}
					else
					{
						response.sendRedirect("./modulos/taller/horario-taller.jsp");
					}
				}
				else
				{
					response.sendRedirect("./modulos/taller/horario-taller.jsp?msj=4");
				}
				
			}
			
			if(opc.equals("3")){
				
				idHorarioTaller = request.getParameter("IdHorarioTallerEliminar");
				if(idHorarioTaller.equals("0"))
				{
					idHorarioTaller = "0";
				}
				else
				{
					if(ht.NGexistencia(Integer.parseInt(idHorarioTaller)))
					{
						h.setIdHorarioTaller(Integer.parseInt(request.getParameter("IdHorarioTallerEliminar")));
						e = ht.eliminarNGHorarioTaller(h);
						if(e == true)
						{
							response.sendRedirect("./modulos/taller/horario-taller.jsp?msj=3");
						}
						else
						{
							response.sendRedirect("./modulos/taller/horario-taller.jsp");
						}
					}
					else
					{
						response.sendRedirect("./modulos/taller/horario-taller.jsp?msj=4");
					}
			}
			}
		}
		catch(Exception ex){
			
			ex.printStackTrace();
			System.out.println("Servlet: Error en el catch al verificar los datos del facilitador: -> " + ex.getMessage());
			response.sendRedirect("./modulos/taller/horario-taller.jsp");
		}
		
	}

}
