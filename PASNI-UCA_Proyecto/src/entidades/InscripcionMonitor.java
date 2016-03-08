package entidades;

import java.util.Date;

public class InscripcionMonitor {
	
	private int idMonitor;
	private String primerNombre; 
	private String segundoNombre; 
	private String primerApellido; 
	private String segundoApellido;
	private String carne;
	private String telefono;
	private String email;
	private String nombreC;
	private float promedio;
	private boolean estipendio;
	private int idInscripcion; 
	private String nombreA; 
	private int calificacion; 
	private String motivo;
	private String turno;
	private Date fecha;
	private int estado;
	
	public int getIdMonitor() {
		return idMonitor;
	}
	public void setIdMonitor(int idMonitor) {
		this.idMonitor = idMonitor;
	}
	public String getPrimerNombre() {
		return primerNombre;
	}
	public void setPrimerNombre(String primerNombre) {
		this.primerNombre = primerNombre;
	}
	public String getSegundoNombre() {
		return segundoNombre;
	}
	public void setSegundoNombre(String segundoNombre) {
		this.segundoNombre = segundoNombre;
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
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNombreC() {
		return nombreC;
	}
	public void setNombreC(String nombreC) {
		this.nombreC = nombreC;
	}
	public float getPromedio() {
		return promedio;
	}
	public void setPromedio(float promedio) {
		this.promedio = promedio;
	}
	public boolean isEstipendio() {
		return estipendio;
	}
	public void setEstipendio(boolean estipendio) {
		this.estipendio = estipendio;
	}
	public int getIdInscripcion() {
		return idInscripcion;
	}
	public void setIdInscripcion(int idInscripcion) {
		this.idInscripcion = idInscripcion;
	}
	public String getNombreA() {
		return nombreA;
	}
	public void setNombreA(String nombreA) {
		this.nombreA = nombreA;
	}
	public int getCalificacion() {
		return calificacion;
	}
	public void setCalificacion(int calificacion) {
		this.calificacion = calificacion;
	}
	public String getMotivo() {
		return motivo;
	}
	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}
	public String getTurno() {
		return turno;
	}
	public void setTurno(String turno) {
		this.turno = turno;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public InscripcionMonitor() {
		super();
	}
	public InscripcionMonitor(int idMonitor, String primerNombre,
			String segundoNombre, String primerApellido,
			String segundoApellido, String carne, String telefono,
			String email, String nombreC, float promedio, boolean estipendio,
			int idInscripcion, String nombreA, int calificacion, String motivo,
			String turno, Date fecha, int estado) {
		super();
		this.idMonitor = idMonitor;
		this.primerNombre = primerNombre;
		this.segundoNombre = segundoNombre;
		this.primerApellido = primerApellido;
		this.segundoApellido = segundoApellido;
		this.carne = carne;
		this.telefono = telefono;
		this.email = email;
		this.nombreC = nombreC;
		this.promedio = promedio;
		this.estipendio = estipendio;
		this.idInscripcion = idInscripcion;
		this.nombreA = nombreA;
		this.calificacion = calificacion;
		this.motivo = motivo;
		this.turno = turno;
		this.fecha = fecha;
		this.estado = estado;
	}
	
	
}
