package entidades;

import java.util.Date;


public class Informe {
	
	private int idInforme;
	private int idMonitor;
	private int idCuatrimestre;
	private String semana;
	private Date fecha;
	private String pregunta1;
	private String pregunta2;
	private String pregunta3;
	private String pregunta4;
	private String pregunta5;
	public int getIdInforme() {
		return idInforme;
	}
	public void setIdInforme(int idInforme) {
		this.idInforme = idInforme;
	}
	public int getIdMonitor() {
		return idMonitor;
	}
	public void setIdMonitor(int idMonitor) {
		this.idMonitor = idMonitor;
	}
	public int getIdCuatrimestre() {
		return idCuatrimestre;
	}
	public void setIdCuatrimestre(int idCuatrimestre) {
		this.idCuatrimestre = idCuatrimestre;
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
	public Informe() {
		super();
	}
	public Informe(int idInforme, int idMonitor, int idCuatrimestre,
			String semana, Date fecha, String pregunta1, String pregunta2,
			String pregunta3, String pregunta4, String pregunta5) {
		super();
		this.idInforme = idInforme;
		this.idMonitor = idMonitor;
		this.idCuatrimestre = idCuatrimestre;
		this.semana = semana;
		this.fecha = fecha;
		this.pregunta1 = pregunta1;
		this.pregunta2 = pregunta2;
		this.pregunta3 = pregunta3;
		this.pregunta4 = pregunta4;
		this.pregunta5 = pregunta5;
	}
}
