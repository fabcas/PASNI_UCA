package entidades;

import java.sql.Date;

public class Inscripcion {

	private int idInscripcion;
	private int idMonitor;
	private Date fecha;
	private int estado;
	private int idAsignatura; 
	private String motivo; 
	private int calificación;
	private String turno;
	
	public int getIdInscripcion() {
		return idInscripcion;
	}
	public void setIdInscripcion(int idInscripcion) {
		this.idInscripcion = idInscripcion;
	}
	public int getIdMonitor() {
		return idMonitor;
	}
	public void setIdMonitor(int idMonitor) {
		this.idMonitor = idMonitor;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public int getIdAsignatura() {
		return idAsignatura;
	}
	public void setIdAsignatura(int idAsignatura) {
		this.idAsignatura = idAsignatura;
	}
	public String getMotivo() {
		return motivo;
	}
	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}
	public int getCalificación() {
		return calificación;
	}
	public void setCalificación(int calificación) {
		this.calificación = calificación;
	}
	public String getTurno() {
		return turno;
	}
	public void setTurno(String turno) {
		this.turno = turno;
	}
	
	public Inscripcion() {
		super();
	}
	
	public Inscripcion(int idInscripcion, int idMonitor, Date fecha, int estado,
			int idAsignatura, String motivo, int calificación, String turno) {
		super();
		this.idInscripcion = idInscripcion;
		this.idMonitor = idMonitor;
		this.fecha = fecha;
		this.estado = estado;
		this.idAsignatura = idAsignatura;
		this.motivo = motivo;
		this.calificación = calificación;
		this.turno = turno;
	}
}
