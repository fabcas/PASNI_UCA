package datos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entidades.CategoriaTaller;
import entidades.Facilitador;
import entidades.HorarioTaller;

public class MDHorarioTaller extends Conexion{
	
	public boolean guardarHorarioTaller(HorarioTaller h) throws SQLException
	{
		boolean g = false;
		int y = 0;
		
		try
		{
		
			String SQL= ("INSERT INTO HorarioTaller (HoraInicio, HoraFin, Turno, Estado) VALUES (?, ? , ?, 1)");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(SQL);
		
			   
				s.setString(1, h.getHoraInicio());
				s.setString(2, h.getHoraFin());
				s.setString(3, h.getTurno());
								
				
			y = s.executeUpdate();
			g = y >0;
			
			//Cerramos la conexion
			s.close();
			cn.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("DATOS: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		}
		
		
		return g;
	}//guardar
	
	
	
	//M?todo Actualizar
	public boolean actualizarHorarioTaller(HorarioTaller h)
	{
		boolean g = false;
		int y = 0;
		
		try
		{
		
			String SQL= ("UPDATE HorarioTaller SET HoraInicio=?, HoraFin=?, Turno=? WHERE IdHorarioTaller=?");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(SQL);
		
			   
				s.setString(1, h.getHoraInicio());
				s.setString(2, h.getHoraFin());
				s.setString(3, h.getTurno());
				s.setInt(4, h.getIdHorarioTaller());
				//s.setBoolean(3, c.isActivo());
				
				
			y = s.executeUpdate();
			g = y >0;
			
			//Cerramos la conexion
			s.close();
			cn.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("DATOS: ERROR AL MODIFICAR LOS DATOS " + e.getMessage());
		}
		
		
		return g;
		
	}//actualizar


	//metodo para eliminar logico
	public boolean eliminarHorarioTaller(HorarioTaller h){
		
		boolean el = false;
		int y = 0;
		
		try
		{
		
			String SQL= ("UPDATE HorarioTaller SET Estado = 0 WHERE IdHorarioTaller=?");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(SQL);
		
				s.setInt(1, h.getIdHorarioTaller());
				
			y = s.executeUpdate();
			el = y >0;
			
			//Cerramos la conexion
			s.close();
			cn.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("DATOS: ERROR AL ELIMINAR LOS DATOS " + e.getMessage());
		}
		
		
		return el;
	}//eliminar
	
	
	public boolean existencia(int IdHorarioTaller)
	{
		boolean existe=false;
		try
		{
			String sql = ("SELECT * FROM HorarioTaller WHERE IdHorarioTaller=?");
			Connection cn = getConnection();
			PreparedStatement s = cn.prepareStatement(sql);
			
			s.setInt(1, IdHorarioTaller);
			
			ResultSet rs = s.executeQuery();
			if(rs.next())
			{
				existe = true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("DATOS: AL PARECER EL DATO, NO EXISTE"+e.getMessage());
		}
		
		return existe;
	}
	
	//Cargar datos
	public ArrayList < HorarioTaller  > cargarDatos()
	{
		ArrayList <HorarioTaller> array = new ArrayList <HorarioTaller>();
		CallableStatement s = null;	
		String sql = ("SELECT IdHorarioTaller, HoraInicio, HoraFin, Turno FROM HorarioTaller WHERE Estado = 1;");
		
		try
		{
			Connection cn = getConnection();
			s = cn.prepareCall(sql);
			ResultSet rs = s.executeQuery();
											
			while(rs.next())		
			{					    					
				HorarioTaller enti = new HorarioTaller();
				
				
				enti.setIdHorarioTaller(rs.getInt("IdHorarioTaller"));
				enti.setHoraInicio(rs.getString("HoraInicio"));
				enti.setHoraFin(rs.getString("HoraFin"));
				enti.setTurno(rs.getString("Turno"));			
					
				array.add(enti);
			}
			
			//Cerramos la conexion
			s.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("DATOS: ERROR AL CONSULTAR LOS DATOS "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}
	
	public ArrayList <HorarioTaller> comboHorarioTaller()
	{
		ArrayList <HorarioTaller> array = new ArrayList <HorarioTaller>();
		String sql = ("SELECT IdHorarioTaller, HoraInicio + ' - ' + HoraFin + ' ' + Turno [HoraInicioFin]  FROM HorarioTaller WHERE Estado = 1;");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				HorarioTaller  enti = new HorarioTaller();
				
				enti.setIdHorarioTaller(rs.getInt("IdHorarioTaller"));
				enti.setHoraInicioFin(rs.getString("HoraInicioFin"));
				//enti.setHoraInicio(rs.getString("HoraFin"));
				array.add(enti);
			}
			
			//Cerramos la conexion
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("Datos: Error al cargar la lista de categoría -> "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}

}
