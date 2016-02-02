package datos;

import java.sql.*;

import entidades.*;
import entidades.Error;

public class MDUsuario extends Conexion{
	
	public Usuario InicioSesion(Usuario s){
		
		Error e;
		
		try{
			String codError = "999";
			String mensaje = "";
			Connection cn = getConnection();
			CallableStatement cstmt = null;	
			String sql = "{call dbo.SPSPInicioSesion(?,?,?,?)}";
			 
			cstmt = cn.prepareCall(sql);	
			cstmt.setString(1, s.getUsuario());
			cstmt.setString(2,s.getUsuario());
			
			cstmt.registerOutParameter(13, Types.VARCHAR);
			cstmt.registerOutParameter(14, Types.VARCHAR);
			
			boolean rs = cstmt.execute();
			
			if(rs){
				String usuario = cstmt.getString("usuario");
				boolean estado = cstmt.getBoolean("estado");
				s.setUsuario(usuario);
				s.setEstado(estado);
			}else{
				System.out.println("El usuario no existe");
			}
			
			codError = cstmt.getString("codMensaje");
			mensaje = cstmt.getString("Mensaje");
			
			e = new Error(codError, mensaje);
			
		} catch (Exception ex) {
			e = new Error("111", ex.getMessage());
		}
		
		return s;
	}

}
