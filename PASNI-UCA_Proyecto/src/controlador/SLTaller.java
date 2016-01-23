package controlador;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NGTaller;
import datos.Taller;

/**
 * Servlet implementation class SLTaller
 */
@WebServlet("/SLTaller")
public class SLTaller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLTaller() {
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
			 Taller t = new Taller();
			 NGTaller ngt = new NGTaller();
			 boolean g = false; //Verificar si guardó
			 boolean a = false; //Verificar si actualizó
			 boolean e = false; //Verificar si eliminó
			
			 String opc ="";
			 String idTaller = "";
			 String idCuat ="";
			 String fecha_Inicio="";
			 String Fecha_Fin="";
			 opc = request.getParameter("opc"); //Obtiene el parámetro 1, 2 ó 3 según la acción realizada.
			 
			if(opc.equals("1"))
			{
				idCuat = request.getParameter("cuatri");
				t.setIdCuatrimestre(Integer.parseInt(idCuat));
				t.setNombre(request.getParameter("nombre"));
				t.setDescripcion(request.getParameter("descripcion"));
				fecha_Inicio = request.getParameter("fechaini");
				Fecha_Fin = request.getParameter("fechafin");
				
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date parsed = null;
				parsed = format.parse(fecha_Inicio);
				t.setFechaInicio((new java.sql.Date(parsed.getTime())));
				
				SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date parsed2 = null;
				parsed2 = format2.parse(Fecha_Fin);
				t.setFechaFinal((new java.sql.Date(parsed2.getTime()))); 
				
				g = ngt.guardarNGTaller(t);
				if(g == true)
					response.sendRedirect("../../modulos/taller/taller.jsp?msj=1");
				else
					response.sendRedirect("../../modulos/taller/taller.jsp");
			}
			else if(opc.equals("2"))
			{
				idTaller = request.getParameter("idTaller");
				t.setIdTaller(Integer.parseInt(idTaller));
				idCuat = request.getParameter("cuatri");
				t.setIdCuatrimestre(Integer.parseInt(idCuat));
				t.setNombre(request.getParameter("nombre"));
				t.setDescripcion(request.getParameter("descripcion"));
				fecha_Inicio = request.getParameter("fechaini");
				Fecha_Fin = request.getParameter("fechafin");
				
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date parsed = null;
				parsed = format.parse(fecha_Inicio);
				t.setFechaInicio((new java.sql.Date(parsed.getTime())));
				
				SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date parsed2 = null;
				parsed2 = format2.parse(Fecha_Fin);
				t.setFechaFinal((new java.sql.Date(parsed2.getTime()))); 
				
				a = ngt.actualizarNGTaller(t);
				
				if(a == true)
					response.sendRedirect("./taller.jsp?msj=2");
				else
					response.sendRedirect("./taller.jsp");
				
			}
			else if(opc.equals("3"))
			{
				idTaller = request.getParameter("idTaller");
				t.setIdTaller(Integer.parseInt(idTaller));
				e = ngt.eliminarNGTaller(t);
				if(e == true)
					response.sendRedirect("./taller.jsp?msj=3");
				else
					response.sendRedirect("./taller.jsp");
			}
			 
		}
		 catch(Exception e)
		 {
			 e.printStackTrace();
			 System.out.println("Servlet: Error en el catch al verificar los datos del taller: -> " + e.getMessage());
			 response.sendRedirect("./taller.jsp");
		 }
		

	}

}
