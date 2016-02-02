package entidades;

import java.util.Date;

public class Cuatrimestre {
	
	private int idCuatrimestre;
	private String nombre;
	private Date fechaInicio;
	private Date fechaFinal;
	
	public Cuatrimestre() {
		
	}
	
	public Cuatrimestre(int idCuatrimestre, String nombre, Date fechaInicio,
			Date fechaFinal) {
		super();
		this.idCuatrimestre = idCuatrimestre;
		this.nombre = nombre;
		this.fechaInicio = fechaInicio;
		this.fechaFinal = fechaFinal;
	}
	
	public int getIdCuatrimestre() {
		return idCuatrimestre;
	}
	public void setIdCuatrimestre(int idCuatrimestre) {
		this.idCuatrimestre = idCuatrimestre;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Date getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public Date getFechaFinal() {
		return fechaFinal;
	}
	public void setFechaFinal(Date fechaFinal) {
		this.fechaFinal = fechaFinal;
	}
	
	

}
