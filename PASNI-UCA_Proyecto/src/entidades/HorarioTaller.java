package entidades;

public class HorarioTaller {
	
	private int IdHorarioTaller;
	private String horaInicio;
	private String horaFin;
	private String horaInicioFin;
	private String turno;
	private boolean estado;
	
	public HorarioTaller() {
		super();
	}
	
	public HorarioTaller(int idHorarioTaller, String horaInicio,
			String horaFin, String turno, boolean estado) {
		super();
		IdHorarioTaller = idHorarioTaller;
		this.horaInicio = horaInicio;
		this.horaFin = horaFin;
		this.turno = turno;
		this.estado = estado;
	}
	
	
	public int getIdHorarioTaller() {
		return IdHorarioTaller;
	}
	public void setIdHorarioTaller(int idHorarioTaller) {
		IdHorarioTaller = idHorarioTaller;
	}
	public String getHoraInicio() {
		return horaInicio;
	}
	public void setHoraInicio(String horaInicio) {
		this.horaInicio = horaInicio;
	}
	public String getHoraFin() {
		return horaFin;
	}
	public void setHoraFin(String horaFin) {
		this.horaFin = horaFin;
	}
	
	
	public String getHoraInicioFin() {
		return horaInicioFin;
	}

	public void setHoraInicioFin(String horaInicioFin) {
		this.horaInicioFin = horaInicioFin;
	}

	public String getTurno() {
		return turno;
	}
	public void setTurno(String turno) {
		this.turno = turno;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	

}
