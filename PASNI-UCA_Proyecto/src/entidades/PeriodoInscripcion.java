package entidades;

import java.util.*;

public class PeriodoInscripcion {

	private int idPeriodoInscripcion;
	private int idCuatrimestre;
	private String nombreC;
	private Date fechaInicio;
	private Date fechaFin;
	private boolean estado;
	
	public int getIdPeriodoInscripcion() {
		return idPeriodoInscripcion;
	}
	public void setIdPeriodoInscripcion(int idPeriodoInscripcion) {
		this.idPeriodoInscripcion = idPeriodoInscripcion;
	}
	public int getIdCuatrimestre() {
		return idCuatrimestre;
	}
	public void setIdCuatrimestre(int idCuatrimestre) {
		this.idCuatrimestre = idCuatrimestre;
	}
	public String getNombreC() {
		return nombreC;
	}
	public void setNombreC(String nombreC) {
		this.nombreC = nombreC;
	}
	public Date getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public Date getFechaFin() {
		return fechaFin;
	}
	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}	
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	public PeriodoInscripcion() {
		super();
	}
	
	public PeriodoInscripcion(int idPeriodoInscripcion, int idCuatrimestre,
			String nombreC, Date fechaInicio, Date fechaFin, boolean estado) {
		super();
		this.idPeriodoInscripcion = idPeriodoInscripcion;
		this.idCuatrimestre = idCuatrimestre;
		this.nombreC = nombreC;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.estado = estado;
	}
	
}
