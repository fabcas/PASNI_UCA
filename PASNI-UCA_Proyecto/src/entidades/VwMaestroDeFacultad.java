package entidades;

public class VwMaestroDeFacultad {
	
	private String COFA;
	private String NOMBRE;
	private String ACTI;
	private String Pregrado;
	
	public VwMaestroDeFacultad(String cOFA, String nOMBRE, String aCTI,
			String pregrado) {
		super();
		COFA = cOFA;
		NOMBRE = nOMBRE;
		ACTI = aCTI;
		Pregrado = pregrado;
	}
	
	public VwMaestroDeFacultad() {
		super();
	}

	//Setters and Getters
	
	public String getCOFA() {
		return COFA;
	}

	public void setCOFA(String cOFA) {
		COFA = cOFA;
	}

	public String getNOMBRE() {
		return NOMBRE;
	}

	public void setNOMBRE(String nOMBRE) {
		NOMBRE = nOMBRE;
	}

	public String getACTI() {
		return ACTI;
	}

	public void setACTI(String aCTI) {
		ACTI = aCTI;
	}

	public String getPregrado() {
		return Pregrado;
	}

	public void setPregrado(String pregrado) {
		Pregrado = pregrado;
	}
	
	
	
	

}
