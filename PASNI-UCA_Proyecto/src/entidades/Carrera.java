package entidades;

public class Carrera {

	private String CARR;
	private int COFA;
	private String NOMBRE;
	
	public String getCARR() {
		return CARR;
	}
	public void setCARR(String cARR) {
		CARR = cARR;
	}
	public int getCOFA() {
		return COFA;
	}
	public void setCOFA(int cOFA) {
		COFA = cOFA;
	}
	public String getNOMBRE() {
		return NOMBRE;
	}
	public void setNOMBRE(String nOMBRE) {
		NOMBRE = nOMBRE;
	}
	public Carrera(String cARR, int cOFA, String nOMBRE) {
		super();
		CARR = cARR;
		COFA = cOFA;
		NOMBRE = nOMBRE;
	}
	public Carrera() {
		super();
	}
}
