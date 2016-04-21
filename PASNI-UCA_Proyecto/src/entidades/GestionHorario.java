package entidades;

import java.util.Date;

public class GestionHorario {
	
	private int idGestionHorario;
	private int idGrupo;
	private Date fecha;
	private boolean estado;
	public int getIdGestionHorario() {
		return idGestionHorario;
	}
	public void setIdGestionHorario(int idGestionHorario) {
		this.idGestionHorario = idGestionHorario;
	}
	public int getIdGrupo() {
		return idGrupo;
	}
	public void setIdGrupo(int idGrupo) {
		this.idGrupo = idGrupo;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	public GestionHorario() {
		super();
	}
	public GestionHorario(int idGestionHorario, int idGrupo, Date fecha,
			boolean estado) {
		super();
		this.idGestionHorario = idGestionHorario;
		this.idGrupo = idGrupo;
		this.fecha = fecha;
		this.estado = estado;
	}
}
