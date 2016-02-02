package entidades;

public class Error {
	
	private String codError;
	private String mensajeError;
	
	public Error(String cod, String Mensaje){
		setCodError(cod);
		setMensajeError(Mensaje);
	}
	
	public String getCodError() {
		return codError;
	}
	public void setCodError(String codError) {
		this.codError = codError;
	}
	public String getMensajeError() {
		return mensajeError;
	}
	public void setMensajeError(String mensajeError) {
		this.mensajeError = mensajeError;
	}
}
