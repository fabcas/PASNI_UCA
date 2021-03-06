package entidades;

import java.util.Date;

public class SolicitudTaller {
	
	private int idSolicitudTaller;
	private Date fechaSolicitud;
	private int estado;
	private String cadenaEstado;
	private int idTaller;
	private String nombreTaller;
	private int idProfesor;
	private String nombreProfesor;
	private int horarioPropuesto;
	private int cantidadEstudiantes;
	private Date diaPropuesto;
	private String horario;
	
	
	public SolicitudTaller(int idSolicitudTaller, Date fechaSolicitud,
			int estado, String cadenaEstado, int idTaller, String nombreTaller, int idProfesor,
			String nombreProfesor) {
		super();
		this.idSolicitudTaller = idSolicitudTaller;
		this.fechaSolicitud = fechaSolicitud;
		this.estado = estado;
		this.idTaller = idTaller;
		this.cadenaEstado = cadenaEstado;
		this.nombreTaller = nombreTaller;
		this.idProfesor = idProfesor;
		this.nombreProfesor = nombreProfesor;
	}


	public SolicitudTaller() {
		
	}


	public int getIdSolicitudTaller() {
		return idSolicitudTaller;
	}


	public void setIdSolicitudTaller(int idSolicitudTaller) {
		this.idSolicitudTaller = idSolicitudTaller;
	}


	public Date getFechaSolicitud() {
		return fechaSolicitud;
	}


	public void setFechaSolicitud(Date fechaSolicitud) {
		this.fechaSolicitud = fechaSolicitud;
	}


	public int getEstado() {
		return estado;
	}


	public void setEstado(int estado) {
		this.estado = estado;
	}


	public int getIdTaller() {
		return idTaller;
	}


	public void setIdTaller(int idTaller) {
		this.idTaller = idTaller;
	}


	public String getNombreTaller() {
		return nombreTaller;
	}


	public void setNombreTaller(String nombreTaller) {
		this.nombreTaller = nombreTaller;
	}
	
	public String getCadenaEstado() {
		return cadenaEstado;
	}


	public void setCadenaEstado(String cadenaEstado) {
		this.cadenaEstado = cadenaEstado;
	}


	public int getIdProfesor() {
		return idProfesor;
	}


	public void setIdProfesor(int idProfesor) {
		this.idProfesor = idProfesor;
	}


	public String getNombreProfesor() {
		return nombreProfesor;
	}


	public void setNombreProfesor(String nombreProfesor) {
		this.nombreProfesor = nombreProfesor;
	}


	public int getHorarioPropuesto() {
		return horarioPropuesto;
	}


	public void setHorarioPropuesto(int horarioPropuesto) {
		this.horarioPropuesto = horarioPropuesto;
	}


	public int getCantidadEstudiantes() {
		return cantidadEstudiantes;
	}


	public void setCantidadEstudiantes(int cantidadEstudiantes) {
		this.cantidadEstudiantes = cantidadEstudiantes;
	}


	public Date getDiaPropuesto() {
		return diaPropuesto;
	}


	public void setDiaPropuesto(Date diaPropuesto) {
		this.diaPropuesto = diaPropuesto;
	}


	public String getHorario() {
		return horario;
	}


	public void setHorario(String horario) {
		this.horario = horario;
	}
	
	
	
	
	
		
}
