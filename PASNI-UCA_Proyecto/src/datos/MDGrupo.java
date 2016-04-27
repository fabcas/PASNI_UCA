package datos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import entidades.Asistencia;
import entidades.Estudiante;
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
				g.setIdGrupo(rs.getInt("idGrupo"));
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
		
		ArrayList <Grupo> array = new ArrayList <Grupo>();
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
				System.out.println(array.get(0).getIdGrupo());
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
	
	public ArrayList<Grupo> cargarAsis(String GRUP){
		
		ArrayList<Grupo> array = new ArrayList<Grupo>();
		String sql = ("SELECT g.idGrupo, i.idAsignatura AS asignatura, g.GRUP, g.APER FROM Grupo g  "
				+ "INNER JOIN Inscripcion i ON i.idInscripcion = g.idInscripcion WHERE g.GRUP = ?");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, GRUP);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				Grupo g = new Grupo();
				
				g.setIdGrupo(rs.getInt("idGrupo"));
				g.setIdAsignatura(rs.getString("asignatura"));
				g.setGRUP(rs.getString("GRUP"));
				g.setAPER(rs.getString("APER"));
				array.add(g);
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
	
	public ArrayList<Estudiante> cargarEstudiante(String GRUP, String APER, String ASIG){
		
		ArrayList<Estudiante> array = new ArrayList<Estudiante>();
		String sql = ("SELECT vwtns.NCAR as carne, vwau.NOMB AS nombrec FROM Vw_temporal_notas_semestre vwtns INNER JOIN Vw_alumnos_uca vwau ON vwtns.NCAR = vwau.NCAR WHERE APER = ? AND CODIASI = ? AND GRUP = ?");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, APER);
			ps.setString(2, ASIG);
			ps.setString(3,GRUP);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				Estudiante e = new Estudiante();
				
				e.setNCAR(rs.getString("carne"));
				e.setNombrec(rs.getString("nombrec"));
				array.add(e);
			}
		
			//Cerramos la conexion
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("Datos: Error al cargar a los estudiantes-> "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}
	
	public boolean ingresarAsistencia(Asistencia a)throws SQLException {
		
		boolean i = false;
		int y = 0;
		
		Connection cn = getConnection();
		CallableStatement cstmt = null;	
		String sql = "{call dbo.SPIngresarAsistencia(?,?,?,?)}";
		cstmt = cn.prepareCall(sql);
		
		try{
			
			cstmt.setString("NCAR", a.getNCAR());
			cstmt.setInt("idGrupo", a.getIdGrupo());
			cstmt.setString("semana", a.getSemana());
			cstmt.setInt("asistio", a.getAsistio());
			y = cstmt.executeUpdate();
			i = y > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Datos: Error al guardar la asistencia-> " + e.getMessage());
		}
		cstmt.close();
		cn.close();
		return i;
	}
	
	public ArrayList<HorarioAula> cargarHorario(){
		
		ArrayList<HorarioAula> array = new ArrayList<HorarioAula>();
		String sql = ("SELECT * FROM Vw_horario");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				HorarioAula h = new HorarioAula();
				
				h.setIdGestionHorario(rs.getInt("idGestionHorario"));
				h.setGRUP(rs.getString("GRUP"));
				h.setCODIAULA(rs.getString("CODIAULA"));
				h.setIdHorario(rs.getInt("idHorario"));
				h.setDia(rs.getString("dia"));
				h.setHoraInicio(rs.getString("horaInicio"));
				h.setHoraFin(rs.getString("horaFin"));
				array.add(h);
			}
		
			//Cerramos la conexion
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("Datos: Error al cargar el horario-> "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	}
	
	public ArrayList<HorarioAula> cargarHorarioE(int idUsuario){
		
		ArrayList<HorarioAula> array = new ArrayList<HorarioAula>();
		String sql = ("SELECT gr.GRUP, h.CODIAULA, h.idHorario, h.dia, h.horaInicio, h.horaFin FROM GestionHorario g INNER JOIN HorarioAula h ON h.idGestionHorario = g.idGestionHorario INNER JOIN Grupo gr ON g.idGrupo = gr.idGrupo INNER JOIN Inscripcion i ON i.idInscripcion = gr.idInscripcion INNER JOIN Monitor m ON m.idMonitor = i.idMonitor WHERE m.idUsuario = ?");
		
		try
		{
			Connection cn = getConnection();
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setInt(1, idUsuario);
			ResultSet rs = ps.executeQuery();
											
			while(rs.next())		
			{					    					
				HorarioAula h = new HorarioAula();
				
				h.setGRUP(rs.getString("GRUP"));
				h.setCODIAULA(rs.getString("CODIAULA"));
				h.setIdHorario(rs.getInt("idHorario"));
				h.setDia(rs.getString("dia"));
				h.setHoraInicio(rs.getString("horaInicio"));
				h.setHoraFin(rs.getString("horaFin"));
				array.add(h);
			}
		
			//Cerramos la conexion
			ps.close();
			cn.close();
		}
		catch(Exception e)
		{
			System.out.println("Datos: Error al cargar el horario-> "+e.getMessage());
			e.printStackTrace();
		}
		
		return array;
	
	}

}
