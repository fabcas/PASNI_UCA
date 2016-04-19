package entidades;

public class Asignatura {

	private String idAsigntatura;
	private int idPlanEstudio;
	private String nombre;
	public String getIdAsigntatura() {
		return idAsigntatura;
	}
	public void setIdAsigntatura(String idAsignatura) {
		this.idAsigntatura = idAsignatura;
	}
	public int getIdPlanEstudio() {
		return idPlanEstudio;
	}
	public void setIdPlanEstudio(int idPlanEstudio) {
		this.idPlanEstudio = idPlanEstudio;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Asignatura() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Asignatura(String idAsigntatura, int idPlanEstudio, String nombre) {
		super();
		this.idAsigntatura = idAsigntatura;
		this.idPlanEstudio = idPlanEstudio;
		this.nombre = nombre;
	}
	
}
