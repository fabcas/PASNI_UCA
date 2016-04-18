package entidades;

public class Grupo {

	private int idGrupo;
	private String GRUP;
	private int idAsignatura;
	private int idInscripcion;
	private String CARR;
	private boolean estado;
	public int getIdGrupo() {
		return idGrupo;
	}
	public void setIdGrupo(int idGrupo) {
		this.idGrupo = idGrupo;
	}
	public String getGRUP() {
		return GRUP;
	}
	public void setGRUP(String gRUP) {
		GRUP = gRUP;
	}
	public int getIdAsignatura() {
		return idAsignatura;
	}
	public void setIdAsignatura(int idAsignatura) {
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
	public Grupo() {
		super();
	}
	public Grupo(int idGrupo, String gRUP, int idAsignatura, int idInscripcion,
			String cARR, boolean estado) {
		super();
		this.idGrupo = idGrupo;
		GRUP = gRUP;
		this.idAsignatura = idAsignatura;
		this.idInscripcion = idInscripcion;
		CARR = cARR;
		this.estado = estado;
	}
}
