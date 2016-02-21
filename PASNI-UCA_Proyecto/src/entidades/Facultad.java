package entidades;

public class Facultad {

	private int idFacultad;
	private String nombre;
	
	public Facultad() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Facultad(int idFacultad, String nombre) {
		super();
		this.idFacultad = idFacultad;
		this.nombre = nombre;
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
}
