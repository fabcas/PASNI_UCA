package entidades;

public class Facultad {
	private String COFA;
	private String NOMBRE;
	
	public Facultad() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Facultad(String COFA, String NOMBRE) {
		super();
		this.COFA = COFA;
		this.NOMBRE = NOMBRE;
	}
	public String getCOFA() {
		return COFA;
	}
	public void setCOFA(String COFA) {
		this.COFA = COFA;
	}
	public String getNOMBRE() {
		return NOMBRE;
	}
	public void setNOMBRE(String NOMBRE) {
		this.NOMBRE = NOMBRE;
	}	
}
