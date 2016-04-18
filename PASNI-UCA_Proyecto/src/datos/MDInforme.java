package datos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.Cuatrimestre;
import entidades.Informe;

public class MDInforme extends Conexion{
	
	public ArrayList <Informe> cargarInforme(int usuario)
	{
		ArrayList <Informe> array = new ArrayList <Informe>();
		String sql = ("SELECT idInforme, dbo.Informe.idMonitor, dbo.Informe.idCuatrimestre, dbo.Cuatrimestre.nombre AS [cuatrimestre], semana, dbo.Informe.fecha,"
				+ "pregunta1,pregunta2, pregunta3, pregunta4, pregunta5 FROM Informe INNER JOIN Monitor ON dbo.Monitor.idMonitor = dbo.Informe.idMonitor "
				+ "INNER JOIN Usuario ON dbo.Usuario.idUsuario = dbo.Monitor.idUsuario, Cuatrimestre WHERE dbo.Cuatrimestre.idCuatrimestre = dbo.Informe.idCuatrimestre "
				+ "AND dbo.Usuario.idUsuario = ?");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setInt(1, usuario);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				Informe  i = new Informe();
				Cuatrimestre c = new Cuatrimestre();
				
				i.setIdInforme(rs.getInt("idInforme"));
				i.setIdMonitor(rs.getInt("idMonitor"));
				i.setIdCuatrimestre(rs.getInt("idCuatrimestre"));
/*REVISAR AQUÍ*/i.setCuatrimestre(rs.getString("cuatrimestre"));
				i.setSemana(rs.getString("semana"));
				i.setFecha(rs.getDate("fecha"));
				i.setPregunta1(rs.getString("pregunta1"));
				i.setPregunta2(rs.getString("pregunta2"));
				i.setPregunta3(rs.getString("pregunta3"));
				i.setPregunta4(rs.getString("pregunta4"));
				i.setPregunta5(rs.getString("pregunta5"));
				array.add(i);
			}
			
			//Cerramos la conexion 
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("DATOS: ERROR AL CONSULTAR LOS DATOS "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}
	
	public boolean agregarInforme(Informe i)throws SQLException{
		
		boolean a = false;
		int y = 0;
		
		Connection cn = getConnection();
		CallableStatement cstmt = null;	
		String sql = "{call dbo.SPAgregarInforme(?,?,?,?,?,?,?,?,?)}";
		cstmt = cn.prepareCall(sql);
					
		try {
			cstmt.setInt("idMonitor", i.getIdMonitor());
			cstmt.setInt("idCuatrimestre", i.getIdCuatrimestre());
			cstmt.setString("semana", i.getSemana());
			cstmt.setString("GRUP", i.getGRUP());
			cstmt.setString("pregunta1",i.getPregunta1());
			cstmt.setString("pregunta2",i.getPregunta2());
			cstmt.setString("pregunta3",i.getPregunta3());
			cstmt.setString("pregunta4",i.getPregunta4());
			cstmt.setString("pregunta5",i.getPregunta5());
			a = y > 0;
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Datos: Error al enviar la solicitud-> " + e.getMessage());
		}
		cstmt.close();
		cn.close();
		return a;
	}

}
