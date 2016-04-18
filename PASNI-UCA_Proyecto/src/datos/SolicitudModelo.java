package datos;

import datos.Conexion;
import entidades.DetalleSolicitud;
import entidades.Error;
import entidades.Monitor;

import java.sql.*;
import java.util.List;

//import org.apache.jasper.tagplugins.jstl.ForEach;

public class SolicitudModelo extends Conexion {
	
	public SolicitudModelo() {
		
	}
	
	public Error RegistrarSolicitud(Monitor m, List<DetalleSolicitud> ds) {
		Error e;
		
		try {			
			String codError = "999";
			String mensaje = "";
			String listDetalleSolicitud = procesarDetalleSolicitud(ds);
			Integer idUsuario = null;
			Connection cn = getConnection();
			CallableStatement cstmt = null;	
			String sql = "{call dbo.SPInsertarSolicitud(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
			
			cstmt = cn.prepareCall(sql);			
			if (idUsuario == null)
				cstmt.setNull(1, Types.INTEGER);
			else				
				cstmt.setInt(1, m.getIdUsuario());
			
			cstmt.setString(2, m.getPrimerNombre());
			cstmt.setString(3, m.getEmail());
			cstmt.setString(4, m.getSegundoNombre());
			cstmt.setString(5, m.getTelefono());
			cstmt.setString(6, m.getPrimerApellido());
			cstmt.setString(7, m.getSegundoApellido());
			cstmt.setString(8, m.getCarne());
			cstmt.setFloat(9, m.getPromedio());
			cstmt.setBoolean(10, m.isEstipendio());
			cstmt.setString(11, m.getCARR());			
			cstmt.setString(12, listDetalleSolicitud);
			
			cstmt.registerOutParameter(13, Types.VARCHAR);
			cstmt.registerOutParameter(14, Types.VARCHAR);
			
			cstmt.execute();
			
			codError = cstmt.getString("codMensaje");
			mensaje = cstmt.getString("Mensaje");
			
			e = new Error(codError, mensaje);
			
			
		} catch (Exception ex) {
			e = new Error("111", ex.getMessage());
		}
		
		return e;
	}
	
	private String procesarDetalleSolicitud(List<DetalleSolicitud> ds) throws Exception{
		String r = "";
		
		try {
			
			for (DetalleSolicitud detalleSolicitud : ds) {
				r += detalleSolicitud.getAsignatura() + "," + detalleSolicitud.getMotivo() + "," + detalleSolicitud.getTurno() + "|";
			}
			
		} catch (Exception ex) {
			throw new Exception("Ha ocurrido un error al momento de procesar los detalles");
		}
		
		return r;
	}


	public void RellenarCbAsignaturas () throws Exception{
		
		try{
			
			Connection cn = getConnection();
			CallableStatement cstmt = null;	
			String sql = "{call dbo.SPSelectCbAsignaturas}";
			
		}catch (Exception ex){
			throw new Exception("Ha ocurrido un error al momento de procesar los detalles");
		}
	}

}