package entidades;

public class Carrera {

	private int idCarrera;
	private int idFacultad;
	private String nombre;
	
	public int getIdCarrera() {
		return idCarrera;
	}
	public void setIdCarrera(int idCarrera) {
		this.idCarrera = idCarrera;
	}
	public int getIdFacultad() {
		return idFacultad;
	}
	public void setIdFacultad(int idFacultad) {
		this.idFacultad = idFacultad;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Carrera(int idCarrera, int idFacultad, String nombre) {
		super();
		this.idCarrera = idCarrera;
		this.idFacultad = idFacultad;
		this.nombre = nombre;
	}
	public Carrera() {
		super();
		// TODO Auto-generated constructor stub
	}
}
