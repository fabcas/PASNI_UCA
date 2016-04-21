package entidades;

import java.util.Date;


public class Informe {
	
	private int idInforme;
	private int idGrupo;
	private String GRUP;
	private String semana;
	private Date fecha;
	private String pregunta1;
	private String pregunta2;
	private String pregunta3;
	private String pregunta4;
	private String pregunta5;
	private String monitor;
	private String observacionP;
	private String observacionA;
	
	public int getIdInforme() {
		return idInforme;
	}
	public void setIdInforme(int idInforme) {
		this.idInforme = idInforme;
	}
	public int getIdGrupo() {
		return idGrupo;
	}
	public void setIdGrupo(int idGrupo) {
		this.idGrupo = idGrupo;
	}
	public String getGRUP() {
		return GRUP;
	}
	public void setGRUP(String GRUP) {
		this.GRUP = GRUP;
	}
	public String getSemana() {
		return semana;
	}
	public void setSemana(String semana) {
		this.semana = semana;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public String getPregunta1() {
		return pregunta1;
	}
	public void setPregunta1(String pregunta1) {
		this.pregunta1 = pregunta1;
	}
	public String getPregunta2() {
		return pregunta2;
	}
	public void setPregunta2(String pregunta2) {
		this.pregunta2 = pregunta2;
	}
	public String getPregunta3() {
		return pregunta3;
	}
	public void setPregunta3(String pregunta3) {
		this.pregunta3 = pregunta3;
	}
	public String getPregunta4() {
		return pregunta4;
	}
	public void setPregunta4(String pregunta4) {
		this.pregunta4 = pregunta4;
	}
	public String getPregunta5() {
		return pregunta5;
	}
	public void setPregunta5(String pregunta5) {
		this.pregunta5 = pregunta5;
	}
	public String getMonitor() {
		return monitor;
	}
	public void setMonitor(String monitor) {
		this.monitor = monitor;
	}
	public String getObservacionP() {
		return observacionP;
	}
	public void setObservacionP(String observacionP) {
		this.observacionP = observacionP;
	}
	public String getObservacionA() {
		return observacionA;
	}
	public void setObservacionA(String observacionA) {
		this.observacionA = observacionA;
	}
	public Informe() {
		super();
	}
	public Informe(int idInforme, int idGrupo, String gRUP, String semana,
			Date fecha, String pregunta1, String pregunta2, String pregunta3,
			String pregunta4, String pregunta5, String monitor,
			String observacionP, String observacionA) {
		super();
		this.idInforme = idInforme;
		this.idGrupo = idGrupo;
		this.GRUP = gRUP;
		this.semana = semana;
		this.fecha = fecha;
		this.pregunta1 = pregunta1;
		this.pregunta2 = pregunta2;
		this.pregunta3 = pregunta3;
		this.pregunta4 = pregunta4;
		this.pregunta5 = pregunta5;
		this.monitor = monitor;
		this.observacionP = observacionP;
		this.observacionA = observacionA;
	}
}
