package entidades;

public class Asignatura {

	private int idAsigntatura;
	private int idPlanEstudio;
	private String nombre;
	public int getIdAsigntatura() {
		return idAsigntatura;
	}
	public void setIdAsigntatura(int idAsigntatura) {
		this.idAsigntatura = idAsigntatura;
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
	public Asignatura(int idAsigntatura, int idPlanEstudio, String nombre) {
		super();
		this.idAsigntatura = idAsigntatura;
		this.idPlanEstudio = idPlanEstudio;
		this.nombre = nombre;
	}
	
}
