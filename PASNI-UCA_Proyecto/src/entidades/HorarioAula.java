package entidades;

public class HorarioAula {
	
	private int idHorario;
	private String CODIAULA;
	private String dia;
	private String horaInicio;
	private String horaFin;
	private int idGestionHorario;
	private String GRUP;
	public int getIdHorario() {
		return idHorario;
	}
	public void setIdHorario(int idHorario) {
		this.idHorario = idHorario;
	}
	public String getCODIAULA() {
		return CODIAULA;
	}
	public void setCODIAULA(String CODIAULA) {
		this.CODIAULA = CODIAULA;
	}
	public String getDia() {
		return dia;
	}
	public void setDia(String dia) {
		this.dia = dia;
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
	public int getIdGestionHorario() {
		return idGestionHorario;
	}
	public void setIdGestionHorario(int idGestionHorario) {
		this.idGestionHorario = idGestionHorario;
	}
	public String getGRUP() {
		return GRUP;
	}
	public void setGRUP(String gRUP) {
		GRUP = gRUP;
	}
	public HorarioAula() {
		super();
	}
	public HorarioAula(int idHorario, String CODIAULA, String dia,
			String horaInicio, String horaFin, int idGestionHorario, String GRUP) {
		super();
		this.idHorario = idHorario;
		this.CODIAULA = CODIAULA;
		this.dia = dia;
		this.horaInicio = horaInicio;
		this.horaFin = horaFin;
		this.idGestionHorario = idGestionHorario;
		this.GRUP = GRUP;
	}
}
