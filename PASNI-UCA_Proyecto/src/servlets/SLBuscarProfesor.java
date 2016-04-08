package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import negocio.NGProfesor;
import datos.MDProfesor;
import entidades.Profesor;

/**
 * Servlet implementation class SLBuscarProfesor
 */
@WebServlet("/SLBuscarProfesor")
public class SLBuscarProfesor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SLBuscarProfesor() {
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

		String opc = "";
		String out = "";
		String inss = request.getParameter("inss");
		ArrayList<Profesor> lista = new ArrayList<Profesor>();
		NGProfesor mp = new NGProfesor();
		lista = mp.buscarMonitorP(inss);
		opc = request.getParameter("opc");
		
		if(opc.equals("1")){
			for (Profesor p : lista){
				out+="<p>Por favor, complete los siguientes datos</p><br>";
				out +="<div>";
					out +="<input type='text' id='nombreS' name='nombreS' required='required' class='form-control' disabled='disabled' value=\""+p.getNombre()+ " " + p.getApellido()+"\">";
	            out +="</div>";
	            out +="<div>";
	                out +="<input type='email' class='form-control' placeholder='Correo'  disabled='disabled' value=\""+p.getEmail()+"\">";
	            out +="</div>";
	            out +="<div>";
	                out +="<input type='text' id='usuario' name='usuario' class='form-control' placeholder='Usuario'>";
	            out +="</div>";
	            out +="<div>";
	                out +="<input type='password' id='pass' name='pass' class='form-control' placeholder='Contraseña'>";
	            out +="</div>";
				out +="<div>";
					out +="<select id='rol' name='rol' class='form-control' tabindex='-1'>";
						out +="<option value='3'>Profesor</option>";
						out +="<option value='4'>Profesor Guía</option>";
						out +="<option value='5'>Coordinador de Carrera</option>";
						out +="<option value='0'>Director de Departamento</option>";
					out +="</select>";
				out +="</div><br>";
				out +="<input type='hidden' id='idProfesor' name='idProfesor' value=\""+p.getIdProfesorGuia()+"\">";
				out += "<button type='submit' class='btn btn-primary'>Enviar</button>";
			}
			 PrintWriter pw = response.getWriter();
             pw.write(out);
             pw.flush();
		}
		
	}

}
