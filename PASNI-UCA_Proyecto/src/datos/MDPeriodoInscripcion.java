package datos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.PeriodoInscripcion;

public class MDPeriodoInscripcion extends Conexion{
	
	//Guardar
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
			e.printStackTrace();
			System.out.println("Datos: Error al guardar los datos -> " + e.getMessage());
		}	
		
		cstmt.close();
		cn.close();
		return g;
	}
	
	//Editar
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
			
		}catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Datos: Error al editar los datos -> " + e.getMessage());
		}	
		
		cstmt.close();
		cn.close();
		return g;
	}
	
	 //Eliminar
	public boolean eliminarPeriodo(PeriodoInscripcion PI){
			
	 int x = 0;
	 boolean el = false;
			
		 try{
				 Connection cn = getConnection();
				 CallableStatement s = null;	
				 String sql = "{call dbo.SPEliminarPeriodoInscripcion(?)}";
				 s = cn.prepareCall(sql);
						
				 s.setInt("idPeriodoInscripcion", PI.getIdPeriodoInscripcion());
						 
				 x = s.executeUpdate();
				 el = x > 0;
						
				 s.close();
				 cn.close();
				
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("Error al eliminar los datos -> " + e.getMessage());
			}
			return el;
	}

	/*Cargar Períodos Activados*/
	public ArrayList<PeriodoInscripcion> cargarDatosPI()throws SQLException{
		
		ArrayList <PeriodoInscripcion> array = new ArrayList <PeriodoInscripcion>();
		CallableStatement cstmt = null;	
		String sql = ("SELECT * FROM Vw_pi_habilitado");
		
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
			e.printStackTrace();
			System.out.println("Datos: Error al cargar los datos -> " + e.getMessage());
		}
		return array;		
	}
	
	/*Cargar Períodos Inactivos*/
	public ArrayList<PeriodoInscripcion> cargarDatosPIF()throws SQLException{
		
		ArrayList <PeriodoInscripcion> array = new ArrayList <PeriodoInscripcion>();
		CallableStatement cstmt = null;	
		String sql = ("SELECT * FROM Vw_pi_finalizado");
		
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
			e.printStackTrace();
			System.out.println("Datos: Error al cargar los datos -> " + e.getMessage());
		}
		return array;		
	}

	/*Verificar el período con la fecha actual */
	public boolean verificarPeriodo(PeriodoInscripcion PI) throws SQLException{	
		
		String sql = ("select idPeriodoInscripcion, fechaInicio, fechaFin from PeriodoInscripcion where estado = 1");
		
		Connection cn = getConnection();
		PreparedStatement ps = cn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		PeriodoInscripcion pi = new PeriodoInscripcion();						
		while(rs.next())		
		{	
			pi.setIdPeriodoInscripcion(rs.getInt("idPeriodoInscripcion"));
			pi.setFechaInicio(rs.getDate("fechaInicio"));
			pi.setFechaFin(rs.getDate("fechaFin"));
		}
		ps.close();
		cn.close();
		if(pi.getFechaInicio().after(PI.getFechaActual()) && pi.getFechaFin().before(PI.getFechaActual())){
			return true;
		}else{
			cambiarEstado(pi.getIdPeriodoInscripcion());
			return false;
		}
	}
	
	public boolean cambiarEstado (int pi) throws SQLException{
		
		int x = 0;
		boolean g = false;
		
		String SQL = ("UPDATE PeriodoInscripcion SET  estado = 0  WHERE idPeriodoInscripcion = ?");
		Connection cn = getConnection();
		PreparedStatement s = cn.prepareStatement(SQL);

		s.setInt(1, pi);

		x = s.executeUpdate();
		g = x >0;
			
		s.close();
		cn.close();
				
		return g;
	}
}

















