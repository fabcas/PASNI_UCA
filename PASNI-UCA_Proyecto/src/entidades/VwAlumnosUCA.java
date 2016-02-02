package entidades;

public class VwAlumnosUCA {
	
	private String NCAR;
	private String NOMB;
	private String SEXO;
	private String DIREC;
	private String TELEFRESI;
	private String CARR;
	private String FACU;
	private String Fechanac;
	private String Cedula;
	private String S_Primer_nombre;
	private String S_Segundo_nombre;
	private String S_Primer_apellido;
	private String S_Segundo_apellido;
	
	
	public VwAlumnosUCA(String nCAR, String nOMB, String sEXO, String dIREC,
			String tELEFRESI, String cARR, String fACU, String fechanac,
			String cedula, String s_Primer_nombre, String s_Segundo_nombre,
			String s_Primer_apellido, String s_Segundo_apellido) {
		super();
		NCAR = nCAR;
		NOMB = nOMB;
		SEXO = sEXO;
		DIREC = dIREC;
		TELEFRESI = tELEFRESI;
		CARR = cARR;
		FACU = fACU;
		Fechanac = fechanac;
		Cedula = cedula;
		S_Primer_nombre = s_Primer_nombre;
		S_Segundo_nombre = s_Segundo_nombre;
		S_Primer_apellido = s_Primer_apellido;
		S_Segundo_apellido = s_Segundo_apellido;
	}


	public VwAlumnosUCA() {
		super();
	}


	public String getNCAR() {
		return NCAR;
	}


	public void setNCAR(String nCAR) {
		NCAR = nCAR;
	}


	public String getNOMB() {
		return NOMB;
	}


	public void setNOMB(String nOMB) {
		NOMB = nOMB;
	}


	public String getSEXO() {
		return SEXO;
	}


	public void setSEXO(String sEXO) {
		SEXO = sEXO;
	}


	public String getDIREC() {
		return DIREC;
	}


	public void setDIREC(String dIREC) {
		DIREC = dIREC;
	}


	public String getTELEFRESI() {
		return TELEFRESI;
	}


	public void setTELEFRESI(String tELEFRESI) {
		TELEFRESI = tELEFRESI;
	}


	public String getCARR() {
		return CARR;
	}


	public void setCARR(String cARR) {
		CARR = cARR;
	}


	public String getFACU() {
		return FACU;
	}


	public void setFACU(String fACU) {
		FACU = fACU;
	}


	public String getFechanac() {
		return Fechanac;
	}


	public void setFechanac(String fechanac) {
		Fechanac = fechanac;
	}


	public String getCedula() {
		return Cedula;
	}


	public void setCedula(String cedula) {
		Cedula = cedula;
	}


	public String getS_Primer_nombre() {
		return S_Primer_nombre;
	}


	public void setS_Primer_nombre(String s_Primer_nombre) {
		S_Primer_nombre = s_Primer_nombre;
	}


	public String getS_Segundo_nombre() {
		return S_Segundo_nombre;
	}


	public void setS_Segundo_nombre(String s_Segundo_nombre) {
		S_Segundo_nombre = s_Segundo_nombre;
	}


	public String getS_Primer_apellido() {
		return S_Primer_apellido;
	}


	public void setS_Primer_apellido(String s_Primer_apellido) {
		S_Primer_apellido = s_Primer_apellido;
	}


	public String getS_Segundo_apellido() {
		return S_Segundo_apellido;
	}


	public void setS_Segundo_apellido(String s_Segundo_apellido) {
		S_Segundo_apellido = s_Segundo_apellido;
	}
	
	
	
	
	
	

}
