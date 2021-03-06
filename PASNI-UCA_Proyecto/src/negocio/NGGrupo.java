package negocio;

import java.util.ArrayList;
import java.util.HashMap;

import datos.MDGrupo;
import datos.MDMonitor;
import entidades.Asistencia;
import entidades.Estudiante;
import entidades.GestionHorario;
import entidades.Grupo;
import entidades.HorarioAula;
import entidades.Informe;
import entidades.Monitor;
import entidades.Profesor;
import entidades.VwMaestroAulas;

public class NGGrupo {
	
	public boolean agregarGrupo(Grupo g){
		boolean bl = false;
		
		try
		{
			MDGrupo s = new MDGrupo();
			bl = s.agregarGrupo(g);
			System.out.println("NEGOCIO: Grupo agregado con �xito!!!");
		}
	
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("NEGOCIO: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		}
		
		return bl;
	}
	
	public ArrayList<Grupo> cargarGrupo(String APER, String CARR, String CODIASI){
		
		ArrayList < Grupo > array = new ArrayList<Grupo>();
		MDGrupo datos = new MDGrupo();
		try
		{
			array = datos.cargarGrupo(APER, CARR, CODIASI);
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		return array;
	
	}
	
	public ArrayList<Grupo> cargarGrupoU(int usuario){
			
			ArrayList < Grupo > array = new ArrayList<Grupo>();
			MDGrupo datos = new MDGrupo();
			try
			{
				array = datos.cargarGrupoU(usuario);
			}
			catch(Exception e)
			{
				System.out.println("Negocio, el error es: "+e.getMessage());
				e.printStackTrace();
			}
			return array;
		
	}
	
	public ArrayList<Grupo> cargarGrupoB(){
		
		ArrayList<Grupo> array = new ArrayList<Grupo>();
		MDGrupo datos = new MDGrupo();
		
		try
		{
			array = datos.cargarGrupoB();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		return array;
		
	}
	
	public ArrayList<Grupo> cargarGrupoP(String APER, String CARR, int idProfesor){
		
		ArrayList<Grupo> array = new ArrayList<Grupo>();
		MDGrupo datos = new MDGrupo();
		
		try
		{
			array = datos.cargarGrupoP(APER, CARR, idProfesor);
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		return array;
		
	}
	
	public ArrayList<VwMaestroAulas> cargarAula(){
		
		ArrayList<VwMaestroAulas> array = new ArrayList<VwMaestroAulas>();
		MDGrupo datos = new MDGrupo();
		
		try
		{
			array = datos.cargarAula();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		return array;
	}
	
	public boolean agregarGestionH(GestionHorario gh, HorarioAula ha){
		
		boolean bl = false;
		
		try
		{
			MDGrupo s = new MDGrupo();
			bl = s.agregarGestionH(gh, ha);
			System.out.println("NEGOCIO: Gesti�n de Horario agregado con �xito!!!");
		}
	
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("NEGOCIO: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		}
		
		return bl;
	}
	
	public ArrayList<Grupo> cargarAsis(String GRUP){
		
		ArrayList<Grupo> array = new ArrayList<Grupo>();
		MDGrupo datos = new MDGrupo();
		
		try
		{
			array = datos.cargarAsis(GRUP);
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		return array;
	}
	
	public ArrayList<Estudiante> cargarEstudiante(String GRUP, String APER, String ASIG){
		
		ArrayList<Estudiante> array = new ArrayList<Estudiante>();
		MDGrupo datos = new MDGrupo();
		
		try
		{
			array = datos.cargarEstudiante(GRUP, APER, ASIG);
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		return array;
	}
	
	public boolean ingresarAsistencia(Asistencia a){
		
		boolean bl = false;
		
		try
		{
			MDGrupo s = new MDGrupo();
			bl = s.ingresarAsistencia(a);
			System.out.println("NEGOCIO: Asistencia agregada con �xito!!!");
		}
	
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("NEGOCIO: ERROR AL GUARDAR LOS DATOS " + e.getMessage());
		}
		
		return bl;
	}
	
	public ArrayList<HorarioAula> cargarHorario(){
		
		ArrayList<HorarioAula> array = new ArrayList<HorarioAula>();
		MDGrupo datos = new MDGrupo();
		
		try
		{
			array = datos.cargarHorario();
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		return array;
	}
	
	public ArrayList<HorarioAula> cargarHorarioE(int idUsuario){
		
		ArrayList<HorarioAula> array = new ArrayList<HorarioAula>();
		MDGrupo datos = new MDGrupo();
		
		try
		{
			array = datos.cargarHorarioE(idUsuario);
		}
		catch(Exception e)
		{
			System.out.println("Negocio, el error es: "+e.getMessage());
			e.printStackTrace();
		}
		return array;
	}
	
}
