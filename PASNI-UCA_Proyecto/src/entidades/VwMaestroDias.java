package entidades;

public class VwMaestroDias {
	
	private int CODIA;
	private String NOMBRE;
	
	public VwMaestroDias(int cODIA, String nOMBRE) {
		super();
		CODIA = cODIA;
		NOMBRE = nOMBRE;
	}
	
	public VwMaestroDias() {
		super();
	}
	
	public int getCODIA() {
		return CODIA;
	}
	public void setCODIA(int cODIA) {
		CODIA = cODIA;
	}
	public String getNOMBRE() {
		return NOMBRE;
	}
	public void setNOMBRE(String nOMBRE) {
		NOMBRE = nOMBRE;
	}
	
	

}
