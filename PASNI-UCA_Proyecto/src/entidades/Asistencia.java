package entidades;

import java.util.Date;

public class Asistencia {

	private int idAsistencia;
	private String NCAR;
	private int idGrupo;
	private int asistio;
	private String semana;
	private Date fecha;
	public int getIdAsistencia() {
		return idAsistencia;
	}
	public void setIdAsistencia(int idAsistencia) {
		this.idAsistencia = idAsistencia;
	}
	public String getNCAR() {
		return NCAR;
	}
	public void setNCAR(String nCAR) {
		NCAR = nCAR;
	}
	public int getIdGrupo() {
		return idGrupo;
	}
	public void setIdGrupo(int idGrupo) {
		this.idGrupo = idGrupo;
	}
	public int getAsistio() {
		return asistio;
	}
	public void setAsistio(int asistio) {
		this.asistio = asistio;
	}
	public String getSemana() {
		return semana;
	}
	public void setSemana(String semana) {
		this.semana = semana;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public Asistencia() {
		super();
	}
	public Asistencia(int idAsistencia, String NCAR, int idGrupo,
			int asistio, String semana, Date fecha) {
		super();
		this.idAsistencia = idAsistencia;
		this.NCAR = NCAR;
		this.idGrupo = idGrupo;
		this.asistio = asistio;
		this.semana = semana;
		this.fecha = fecha;
	}
	
}
