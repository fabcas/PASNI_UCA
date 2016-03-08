package datos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import entidades.CategoriaTaller;
import entidades.PeriodoInscripcion;;

public class MDPeriodoInscripcion extends Conexion{
	
	public boolean guardarPI(PeriodoInscripcion pi) throws SQLException
	{
		boolean g = false;
		int y = 0;
		
		Connection cn = getConnection();
		CallableStatement cstmt = null;	
		String sql = "{call dbo.SPInsertarPeriodInscripcion(?,?,?)}";
		cstmt = cn.prepareCall(sql);			
					
		try {
			cstmt.setInt("idCuatrimestre", pi.getIdCuatrimestre());
			cstmt.setDate("fechaInicio", (Date) pi.getFechaInicio());
			cstmt.setDate("fechaFin", (Date) pi.getFechaFin());
			y = cstmt.executeUpdate();
			g = y > 0;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Datos: Error al guardar los datos -> " + e.getMessage());
		}	
		
		cstmt.close();
		cn.close();
		return g;
	}
	
	public boolean editarPI(PeriodoInscripcion pi) throws SQLException
	{
		boolean g = false;
		int y = 0;
		
		Connection cn = getConnection();
		CallableStatement cstmt = null;	
		String sql = "{call dbo.SPEditarPeriodoI(?,?,?)}";
		cstmt = cn.prepareCall(sql);			
					
		try {
			cstmt.setInt("idPeriodoInscripcion", pi.getIdPeriodoInscripcion());
			cstmt.setDate("fechaInicio", (Date) pi.getFechaInicio());
			cstmt.setDate("fechaFin", (Date) pi.getFechaFin());
			y = cstmt.executeUpdate();
			g = y > 0;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Datos: Error al editar los datos -> " + e.getMessage());
		}	
		
		cstmt.close();
		cn.close();
		return g;
	}

	public ArrayList<PeriodoInscripcion> cargarDatosPI()throws SQLException{
		
		ArrayList <PeriodoInscripcion> array = new ArrayList <PeriodoInscripcion>();
		CallableStatement cstmt = null;	
		String sql = "{call dbo.SPListarPeriodoInscripcion}";
		
		try{
			
			Connection cn = getConnection();
			cstmt = cn.prepareCall(sql);
			ResultSet rs = cstmt.executeQuery();
			
			while(rs.next()){
				PeriodoInscripcion pi = new PeriodoInscripcion();
				pi.setIdPeriodoInscripcion(rs.getInt("idPeriodoInscripcion"));
				pi.setNombreC(rs.getString("nombre"));
				pi.setFechaInicio(rs.getDate("fechaInicio"));
				pi.setFechaFin(rs.getDate("fechaFin"));
				array.add(pi);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Datos: Error al cargar los datos -> " + e.getMessage());
		}
		return array;		
	}
	
	public boolean verificarPeriodo(PeriodoInscripcion PI) throws SQLException
	{	
		String sql = ("select fechaFin from PeriodoInscripcion where estado = 1");
		
		Connection cn = getConnection();
		PreparedStatement ps = cn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		PeriodoInscripcion pi = new PeriodoInscripcion();						
		while(rs.next())		
		{			    					
			pi.setFechaFin(rs.getDate("fechaFin"));
		}
		ps.close();
		cn.close();
		if(PI.getFechaActual().after(pi.getFechaFin())){
			return true;
		}else{
			return false;
		}
	}
	
	
}

















