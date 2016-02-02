package entidades;

import java.util.Date;

public class Taller {
	
	private int idTaller;
	private int idCuatrimestre;
	private String nombreCuatrimestre;
	private String nombre;
	private String descripcion;
	private Date fechaInicio;
	private Date fechaFinal;
	private boolean estado;
	
	
	public Taller() {
		super();
	}
	
	public Taller(int idTaller, int idCuatrimestre, String nombreCuatrimestre, String nombre,
			String descripcion, Date fechaInicio, Date fechaFinal,
			boolean estado) {
		super();
		this.idTaller = idTaller;
		this.idCuatrimestre = idCuatrimestre;
		this.nombreCuatrimestre = nombreCuatrimestre;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.fechaInicio = fechaInicio;
		this.fechaFinal = fechaFinal;
		this.estado = estado;
	}



	public int getIdTaller() {
		return idTaller;
	}
	public void setIdTaller(int idTaller) {
		this.idTaller = idTaller;
	}
	public int getIdCuatrimestre() {
		return idCuatrimestre;
	}
	public void setIdCuatrimestre(int idCuatrimestre) {
		this.idCuatrimestre = idCuatrimestre;
	}
	
	public String getNombreCuatrimestre() {
		return nombreCuatrimestre;
	}

	public void setNombreCuatrimestre(String nombreCuatrimestre) {
		this.nombreCuatrimestre = nombreCuatrimestre;
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

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	

}
