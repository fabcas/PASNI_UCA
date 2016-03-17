package entidades;

public class ProfesorGuia {
	
	private int IdProfesorGuia;
	private String nombre;
	private String apellido;
	private boolean sexo;
	private String direccion;
	
	
	public ProfesorGuia() {
		
	}
	
	public ProfesorGuia(int idProfesorGuia, String nombre, String apellido,
			boolean sexo, String direccion) {
		super();
		IdProfesorGuia = idProfesorGuia;
		this.nombre = nombre;
		this.apellido = apellido;
		this.sexo = sexo;
		this.direccion = direccion;
	}
	public int getIdProfesorGuia() {
		return IdProfesorGuia;
	}
	public void setIdProfesorGuia(int idProfesorGuia) {
		IdProfesorGuia = idProfesorGuia;
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
	public boolean isSexo() {
		return sexo;
	}
	public void setSexo(boolean sexo) {
		this.sexo = sexo;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	
	

}
