package entidades;

import java.util.Date;

public class Grupo {

	private int idGrupo;
	private String GRUP;
	private String idAsignatura;
	private int idInscripcion;
	private String CARR;
	private boolean estado;
	private int idDocente;
	private String APER;
	private Date fecha;
	private String monitor;
	private String profesor;
	public int getIdGrupo() {
		return idGrupo;
	}
	public void setIdGrupo(int idGrupo) {
		this.idGrupo = idGrupo;
	}
	public String getGRUP() {
		return GRUP;
	}
	public void setGRUP(String GRUP) {
		this.GRUP = GRUP;
	}
	public String getIdAsignatura() {
		return idAsignatura;
	}
	public void setIdAsignatura(String idAsignatura) {
		this.idAsignatura = idAsignatura;
	}
	public int getIdInscripcion() {
		return idInscripcion;
	}
	public void setIdInscripcion(int idInscripcion) {
		this.idInscripcion = idInscripcion;
	}
	public String getCARR() {
		return CARR;
	}
	public void setCARR(String cARR) {
		CARR = cARR;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	public int getIdDocente() {
		return idDocente;
	}
	public void setIdDocente(int idDocente) {
		this.idDocente = idDocente;
	}
	public String getAPER() {
		return APER;
	}
	public void setAPER(String aPER) {
		APER = aPER;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public String getMonitor() {
		return monitor;
	}
	public void setMonitor(String monitor) {
		this.monitor = monitor;
	}
	public String getProfesor() {
		return profesor;
	}
	public void setProfesor(String profesor) {
		this.profesor = profesor;
	}
	public Grupo() {
		super();
	}
	public Grupo(int idGrupo, String GRUP, String idAsignatura, int idInscripcion,
			String CARR, boolean estado, int idDocente, String APER, Date fecha, String profesor, String monitor) {
		super();
		this.idGrupo = idGrupo;
		this.GRUP = GRUP;
		this.idAsignatura = idAsignatura;
		this.idInscripcion = idInscripcion;
		this.CARR = CARR;
		this.APER = APER;
		this.estado = estado;
		this.idDocente = idDocente;
		this.fecha = fecha;
		this.monitor = monitor;
		this.profesor = profesor;
	}
}
