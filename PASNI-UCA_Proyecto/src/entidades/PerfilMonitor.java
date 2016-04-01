package entidades;

import java.io.InputStream;
import java.sql.Date;

public class PerfilMonitor {
	
	private int idDocumento;
	private String nombre;
	private Date fecha;
	private int idMonitor;
	private int semana;
	private int idCuatrimestre;
	private InputStream imagen;
	
	public int getIdDocumento() {
		return idDocumento;
	}
	public void setIdDocumento(int idDocumento) {
		this.idDocumento = idDocumento;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public int getIdMonitor() {
		return idMonitor;
	}
	public void setIdMonitor(int idMonitor) {
		this.idMonitor = idMonitor;
	}
	public int getSemana() {
		return semana;
	}
	public void setSemana(int semana) {
		this.semana = semana;
	}
	public int getIdCuatrimestre() {
		return idCuatrimestre;
	}
	public void setIdCuatrimestre(int idCuatrimestre) {
		this.idCuatrimestre = idCuatrimestre;
	}
	public InputStream getImagen() {
		return imagen;
	}
	public void setImagen(InputStream inputStream) {
		this.imagen = inputStream;
	}
	public PerfilMonitor() {
		super();
	}
	public PerfilMonitor(int idDocumento, String nombre, Date fecha,
			int idMonitor, int semana, int idCuatrimestre, InputStream imagen) {
		super();
		this.idDocumento = idDocumento;
		this.nombre = nombre;
		this.fecha = fecha;
		this.idMonitor = idMonitor;
		this.semana = semana;
		this.idCuatrimestre = idCuatrimestre;
		this.imagen = imagen;
	}
	
	
}
