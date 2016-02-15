package entidades;

public class VwCatalogoTurno {
	
	private String CodCurso;
	private String Descripcion;
	
	public VwCatalogoTurno(String codCurso, String descripcion) {
		super();
		CodCurso = codCurso;
		Descripcion = descripcion;
	}
	
	public VwCatalogoTurno() {
		super();
	}

	public String getCodCurso() {
		return CodCurso;
	}

	public void setCodCurso(String codCurso) {
		CodCurso = codCurso;
	}

	public String getDescripcion() {
		return Descripcion;
	}

	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}
	
	
	
	

}
