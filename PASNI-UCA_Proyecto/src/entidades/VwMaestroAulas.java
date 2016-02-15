package entidades;

public class VwMaestroAulas {
	
	private String CODIAULA;
	private int CAPA;
	private String AP;
	
	public VwMaestroAulas(String cODIAULA, int cAPA, String aP) {
		super();
		CODIAULA = cODIAULA;
		CAPA = cAPA;
		AP = aP;
	}
	
	public VwMaestroAulas() {
		super();
	}
	
	public String getCODIAULA() {
		return CODIAULA;
	}
	public void setCODIAULA(String cODIAULA) {
		CODIAULA = cODIAULA;
	}
	public int getCAPA() {
		return CAPA;
	}
	public void setCAPA(int cAPA) {
		CAPA = cAPA;
	}
	public String getAP() {
		return AP;
	}
	public void setAP(String aP) {
		AP = aP;
	}
	
	

}
