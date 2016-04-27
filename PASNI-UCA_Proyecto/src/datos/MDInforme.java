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
		String sql = ("SELECT i.idInforme, g.GRUP AS GRUP, i.semana, i.fecha, m.primerNombre + ' ' + m.primerApellido [Monitor], i.pregunta1, i.pregunta2, i.pregunta3, i.pregunta4, i.pregunta5"
				+ " FROM Informe i INNER JOIN Grupo g ON g.idGrupo = i.idGrupo "
				+ "INNER JOIN Inscripcion c ON c.idInscripcion = g.idInscripcion "
				+ "INNER JOIN Monitor m ON m.idMonitor = c.idMonitor WHERE m.idUsuario = ?");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setInt(1, usuario);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				Informe  i = new Informe();
				
				i.setIdInforme(rs.getInt("idInforme"));
				i.setGRUP(rs.getString("GRUP"));
				i.setSemana(rs.getString("semana"));
				i.setFecha(rs.getDate("fecha"));
				i.setMonitor(rs.getString("Monitor"));
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
		String sql = "{call dbo.SPAgregarInforme(?,?,?,?,?,?,?)}";
		cstmt = cn.prepareCall(sql);
					
		try {
			cstmt.setInt("idGrupo", i.getIdGrupo());
			cstmt.setString("semana", i.getSemana());
			cstmt.setString("pregunta1",i.getPregunta1());
			cstmt.setString("pregunta2",i.getPregunta2());
			cstmt.setString("pregunta3",i.getPregunta3());
			cstmt.setString("pregunta4",i.getPregunta4());
			cstmt.setString("pregunta5",i.getPregunta5());
			y = cstmt.executeUpdate();
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
	
	public ArrayList<Informe> cargarInformeT(){
		
		ArrayList<Informe> array = new ArrayList<Informe>();
		String sql = ("SELECT i.idInforme, i.idGrupo, g.GRUP AS GRUP, i.semana, i.fecha, m.primerNombre + ' ' + m.primerApellido [Monitor], i.pregunta1, i.pregunta2, i.pregunta3, i.pregunta4, i.pregunta5, i.observacionP, i.observacionA"
				+ "		FROM Informe i INNER JOIN Grupo g ON g.idGrupo = i.idGrupo "
				+ "		INNER JOIN Inscripcion c ON c.idInscripcion = g.idInscripcion "
				+ "		INNER JOIN Monitor m ON m.idMonitor = c.idMonitor");
		
		
		try{
			
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    			
				Informe i = new Informe();
				
				i.setIdInforme(rs.getInt("idInforme"));
				i.setIdGrupo(rs.getInt("idGrupo"));
				i.setGRUP(rs.getString("GRUP"));
				i.setMonitor(rs.getString("Monitor"));
				i.setSemana(rs.getString("semana"));
				i.setFecha(rs.getDate("fecha"));
				i.setPregunta1(rs.getString("pregunta1"));
				i.setPregunta2(rs.getString("pregunta2"));
				i.setPregunta3(rs.getString("pregunta3"));
				i.setPregunta4(rs.getString("pregunta4"));
				i.setPregunta5(rs.getString("pregunta5"));
				i.setObservacionP(rs.getString("observacionP"));
				i.setObservacionA(rs.getString("observacionA"));
				array.add(i);
			}
		}catch(Exception e)
		{
			System.out.println("DATOS: ERROR AL CONSULTAR LOS DATOS "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}
	
	public boolean agregarObservacion(Informe i)throws SQLException{
		
		boolean m = false;
		int y = 0;
		
		Connection cn = getConnection();
		CallableStatement cstmt = null;	
		String sql = "{call dbo.SPEnviarObservacion(?,?,?)}";
		cstmt = cn.prepareCall(sql);
					
		try {
			cstmt.setInt("idInforme", i.getIdInforme());
			cstmt.setString("observacionP", i.getObservacionP());
			cstmt.setString("observacionA",i.getObservacionA());
			y = cstmt.executeUpdate();
			m = y > 0;
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Datos: Error al enviar la solicitud-> " + e.getMessage());
		}
		cstmt.close();
		cn.close();
		return m;
	}

}
