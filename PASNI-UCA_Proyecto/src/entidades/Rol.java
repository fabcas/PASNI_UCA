package entidades;

public class Rol {
	
	private int IdRol;
	private String nombre;
	private String descripcion;
	private boolean activo;
	
	
	public Rol(int idRol, String nombre, String descripcion, boolean activo) {
		super();
		IdRol = idRol;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.activo = activo;
	}


	public Rol() {
		super();
	}


	public int getIdRol() {
		return IdRol;
	}


	public void setIdRol(int idRol) {
		IdRol = idRol;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getDescripcion() {
		return descripcion;
	}


	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}


	public boolean isActivo() {
		return activo;
	}


	public void setActivo(boolean activo) {
		this.activo = activo;
	}
	
	
	
	

}
