package entidades;

public class Monitor {

	private int idMonitor;
	private int idUsuario;
	private String primerNombre;
	private String email;
	private String segundoNombre;
	private String telefono;
	private String primerApellido;
	private String segundoApellido;
	private String carne;
	private float promedio;
	private int idCarrera;
	private boolean estipendio;
	
	public int getIdMonitor() {
		return idMonitor;
	}
	public void setIdMonitor(int idMonitor) {
		this.idMonitor = idMonitor;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getPrimerNombre() {
		return primerNombre;
	}
	public void setPrimerNombre(String primerNombre) {
		this.primerNombre = primerNombre;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSegundoNombre() {
		return segundoNombre;
	}
	public void setSegundoNombre(String segundoNombre) {
		this.segundoNombre = segundoNombre;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getPrimerApellido() {
		return primerApellido;
	}
	public void setPrimerApellido(String primerApellido) {
		this.primerApellido = primerApellido;
	}
	public String getSegundoApellido() {
		return segundoApellido;
	}
	public void setSegundoApellido(String segundoApellido) {
		this.segundoApellido = segundoApellido;
	}
	public String getCarne() {
		return carne;
	}
	public void setCarne(String carne) {
		this.carne = carne;
	}
	public float getPromedio() {
		return promedio;
	}
	public void setPromedio(float promedio) {
		this.promedio = promedio;
	}
	public int getIdCarrera() {
		return idCarrera;
	}
	public void setIdCarrera(int idCarrera) {
		this.idCarrera = idCarrera;
	}
	public boolean isEstipendio() {
		return estipendio;
	}
	public void setEstipendio(boolean estipendio) {
		this.estipendio = estipendio;
	}
	
	public Monitor() {
		super();
	}
	
	public Monitor(int idMonitor, int idUsuario, String primerNombre,
			String email, String segundoNombre, String telefono,
			String primerApellido, String segundoApellido, String carne,
			float promedio, int idCarrera, boolean estipendio) {
		super();
		this.idMonitor = idMonitor;
		this.idUsuario = idUsuario;
		this.primerNombre = primerNombre;
		this.email = email;
		this.segundoNombre = segundoNombre;
		this.telefono = telefono;
		this.primerApellido = primerApellido;
		this.segundoApellido = segundoApellido;
		this.carne = carne;
		this.promedio = promedio;
		this.idCarrera = idCarrera;
		this.estipendio = estipendio;
	}
}
