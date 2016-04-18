package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

import entidades.PerfilMonitor;
import negocio.NGMonitor;

/**
 * Servlet implementation class SLSubirArchivo
 */
@WebServlet("/SLSubirArchivo")
@MultipartConfig(maxFileSize = 16177215) 
public class SLSubirArchivo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLSubirArchivo() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		NGMonitor ng = new NGMonitor();
		PerfilMonitor pm = new PerfilMonitor();
		boolean g = false;
		String idMonitor = "";
		try{
			idMonitor = request.getParameter("idMonitor");
			pm.setIdMonitor(Integer.parseInt(idMonitor));
			
			InputStream inputStream = null; 
	         
			Part filePart = request.getPart("photo");
	        if (filePart != null) {
	            
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	             
	            inputStream = filePart.getInputStream();
	        }
	        pm.setImagen(inputStream);
	        g = ng.subirArchivo(pm);
			if(g == true)
			{
				response.sendRedirect("./modulos/monitor/perfil-monitor.jsp?msj=1");
				
			}
			else
			{
				response.sendRedirect("./modulos/monitor/perfil-monitor.jsp");
			}
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("Servlet: Error en el catch al guardar el inform: -> " + e.getMessage());
			response.sendRedirect("./modulos/monitor/perfil-monitor.jsp");
		}
	
	}

}
