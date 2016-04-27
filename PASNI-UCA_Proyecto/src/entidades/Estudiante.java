package entidades;

public class Estudiante {
	private int idEstudiante;
	private String nombrec;
	private String NCAR;
	
	public int getIdEstudiante() {
		return idEstudiante;
	}
	public void setIdEstudiante(int idEstudiante) {
		this.idEstudiante = idEstudiante;
	}
	public String getNombrec() {
		return nombrec;
	}
	public void setNombrec(String nombrec) {
		this.nombrec = nombrec;
	}
	public String getNCAR() {
		return NCAR;
	}
	public void setNCAR(String nCAR) {
		NCAR = nCAR;
	}
	public Estudiante() {
		super();
	}
	public Estudiante(int idEstudiante, String nombrec, String nCAR) {
		super();
		this.idEstudiante = idEstudiante;
		this.nombrec = nombrec;
		NCAR = nCAR;
	}	
}
