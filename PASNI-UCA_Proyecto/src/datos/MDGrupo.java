package datos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import entidades.GestionHorario;
import entidades.Grupo;
import entidades.HorarioAula;
import entidades.Profesor;
import entidades.VwMaestroAulas;

public class MDGrupo extends Conexion{
	
	public boolean agregarGrupo(Grupo g)throws SQLException {
		
		boolean a = false;
		int y = 0;
		
		Connection cn = getConnection();
		CallableStatement cstmt = null;	
		String sql = "{call dbo.SPPlanificarGrupo(?,?,?,?,?)}";
		cstmt = cn.prepareCall(sql);
		
		try{
			
			cstmt.setInt("idDocente", g.getIdDocente());
			cstmt.setInt("idInscripcion", g.getIdInscripcion());
			cstmt.setString("CARR", g.getCARR());
			cstmt.setString("GRUP", g.getGRUP());
			cstmt.setString("APER", g.getAPER());
			y = cstmt.executeUpdate();
			a = y > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Datos: Error al agregar la planificación de grupo-> " + e.getMessage());
		}
		cstmt.close();
		cn.close();
		return a;
		
	}
	
	public ArrayList<Grupo> cargarGrupo(String APER, String CARR, String CODIASI){
		
		ArrayList <Grupo> array= new ArrayList <Grupo>();
		String sql = (" SELECT  DISTINCT t.GRUP FROM Vw_temporal_notas_semestre t "
						+ "INNER JOIN Vw_maestro_carreras c ON c.CARR = t.CARR "
						+ "INNER JOIN Vw_maestro_asignaturas a ON a.CODIASI = t.CODIASI "
						+ "WHERE  APER = ? AND t.CARR = ? AND t.CODIASI = ?");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, APER);
			ps.setString(2, CARR);
			ps.setString(3, CODIASI);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				Grupo g = new Grupo();
				
				g.setGRUP(rs.getString("GRUP"));
				System.out.println(g.getGRUP());
				array.add(g);
			}
		
			//Cerramos la conexion
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("Datos: Error al buscar el grupo-> "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}
	
	public ArrayList<Grupo> cargarGrupoU(int usuario){
			
			ArrayList <Grupo> array= new ArrayList <Grupo>();
			String sql = (" SELECT DISTINCT idGrupo, GRUP FROM Grupo, Inscripcion i, Monitor m  WHERE i.idMonitor = m.idMonitor and m.idUsuario = ? ");
			
			try
			{
				Connection cn = getConnection();
				PreparedStatement ps = cn.prepareStatement(sql);
				ps.setInt(1,usuario);
				System.out.println(usuario);
				ResultSet rs = ps.executeQuery();
												
				while(rs.next())		
				{					    					
					Grupo g = new Grupo();
					g.setIdGrupo(rs.getInt("idGrupo"));
					g.setGRUP(rs.getString("GRUP"));
					array.add(g);
				}
			
				//Cerramos la conexion
				ps.close();
				cn.close();
			}
			catch(Exception e)
			{
				System.out.println("Datos: Error al buscar el grupo-> "+e.getMessage());
				e.printStackTrace();
			}
			
			return array;
		
	}
	
	public ArrayList<Grupo> cargarGrupoB(){
		
		ArrayList<Grupo> array = new ArrayList<Grupo>();
		String sql = (" SELECT * FROM Vw_grupo");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				Grupo g = new Grupo();
				Profesor p = new Profesor();
				g.setGRUP(rs.getString("GRUP"));
				g.setProfesor(rs.getString("profesor"));
				g.setMonitor(rs.getString("monitor"));
				g.setCARR(rs.getString("carrera"));
				g.setAPER(rs.getString("APER"));
				g.setFecha(rs.getDate("fecha"));
				array.add(g);
			}
		
			//Cerramos la conexion
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("Datos: Error al buscar el grupo-> "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}
	
	public ArrayList<Grupo> cargarGrupoP(String APER, String CARR, int idProfesor){
		
		ArrayList <Grupo> array= new ArrayList <Grupo>();
		String sql = (" SELECT  idGrupo, GRUP FROM Grupo  WHERE  APER = ?  AND CARR = ?  AND idDocente = ?");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, APER);
			ps.setString(2, CARR);
			ps.setInt(3, idProfesor);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				Grupo g = new Grupo();
				
				g.setIdGrupo(rs.getInt("idGrupo"));
				g.setGRUP(rs.getString("GRUP"));
				array.add(g);
			}
		
			//Cerramos la conexion
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("Datos: Error al buscar el grupo-> "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	
	}
	
	public ArrayList<VwMaestroAulas> cargarAula(){
		
		ArrayList <VwMaestroAulas> array= new ArrayList <VwMaestroAulas>();
		String sql = (" SELECT * FROM Vw_maestro_aulas");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				VwMaestroAulas a = new VwMaestroAulas();
				
				a.setCODIAULA(rs.getString("CODIAULA"));
				a.setCAPA(rs.getInt("CAPA"));
				array.add(a);
			}
		
			//Cerramos la conexion
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("Datos: Error al buscar las aulas-> "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	
	}
	
	public boolean agregarGestionH(GestionHorario gh, HorarioAula ha) throws SQLException{
		
		boolean a = false;
		int y = 0;
		
		Connection cn = getConnection();
		CallableStatement cstmt = null;	
		String sql = "{call dbo.SPGestionHorario(?,?,?,?,?)}";
		cstmt = cn.prepareCall(sql);
		
		try{
			
			cstmt.setInt("idGrupo", gh.getIdGrupo());
			cstmt.setString("CODIAULA", ha.getCODIAULA());
			cstmt.setString("dia", ha.getDia());
			cstmt.setString("horaInicio", ha.getHoraInicio());
			cstmt.setString("horaFin", ha.getHoraFin());
			y = cstmt.executeUpdate();
			a = y > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Datos: Error al agregar la gestión de horario-> " + e.getMessage());
		}
		cstmt.close();
		cn.close();
		return a;
	}

}
