package entidades;

public class Profesor {
	
	private int IdProfesorGuia;
	private String nombre;
	private String apellido;
	private boolean sexo;
	private String direccion;
	private String email;
	private String inss;
	
	
	public Profesor() {
		
	}
	
	public Profesor(int idProfesorGuia, String nombre, String apellido,
			boolean sexo, String direccion,String email, String inss) {
		super();
		IdProfesorGuia = idProfesorGuia;
		this.nombre = nombre;
		this.apellido = apellido;
		this.sexo = sexo;
		this.direccion = direccion;
		this.email = email;
		this.inss = inss;
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
}
