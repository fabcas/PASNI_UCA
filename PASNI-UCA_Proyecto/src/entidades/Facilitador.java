package entidades;

public class Facilitador {
	
	private int idFacilitador;
	private String nombre;
	private String apellido;
	private String email;
	private String inss;
	private String telefono;
	private boolean estado;
	
	public Facilitador(int idFacilitador, String nombre, String apellido,
			String email, String inss, String telefono) {
		super();
		this.idFacilitador = idFacilitador;
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.inss = inss;
		this.telefono = telefono;
	}
	
	public Facilitador() {
		super();
	}
	
	public int getIdFacilitador() {
		return idFacilitador;
	}
	public void setIdFacilitador(int idFacilitador) {
		this.idFacilitador = idFacilitador;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getInss() {
		return inss;
	}
	public void setInss(String inss) {
		this.inss = inss;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	

}
