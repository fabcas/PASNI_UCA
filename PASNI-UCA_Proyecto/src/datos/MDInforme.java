package datos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entidades.Cuatrimestre;
import entidades.Informe;

public class MDInforme extends Conexion{
	
	public ArrayList <Informe> cargarInforme(int usuario)
	{
		ArrayList <Informe> array = new ArrayList <Informe>();
		String sql = ("{SELECT dbo.Informe.idInforme, dbo.Informe.idMonitor, dbo.Informe.idCuatrimestre, dbo.Cuatrimestre.nombre, dbo.Informe.semana,"
				+ " dbo.Informe.fecha,dbo.Informe.pregunta1, dbo.Informe.pregunta2, dbo.Informe.pregunta3, dbo.Informe.pregunta4, dbo.Informe.pregunta5" 
				+ "from dbo.Informe INNER JOIN dbo.Monitor ON dbo.Monitor.idMonitor = dbo.Informe.idMonitor INNER JOIN Usuario ON dbo.Usuario.idUsuario = dbo.Monitor.idUsuario,"
				+ "Cuatrimestre where dbo.Cuatrimestre.idCuatrimestre = dbo.Informe.idCuatrimestre and dbo.Usuario.idUsuario = ?}");
		
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
				c.setNombre(rs.getString("nombre"));
				i.setSemana(rs.getString("semana"));
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

}
