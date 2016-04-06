package entidades;

public class Facilitador {
	
	private int idFacilitador;
	private String primerNombre;
	private String segundoNombre;
	private String primerApellido;
	private String segundoApellido;
	
	public Facilitador(int idFacilitador, String primerNombre,
			String segundoNombre, String primerApellido, String segundoApellido) {
		super();
		this.idFacilitador = idFacilitador;
		this.primerNombre = primerNombre;
		this.segundoNombre = segundoNombre;
		this.primerApellido = primerApellido;
		this.segundoApellido = segundoApellido;
	}
	
	
	public Facilitador() {
		super();
	}



	public int getIdFacilitador() {
		return idFacilitador;
	}
	public void setIdFacilitador(int idFacilitador) {
		this.idFacilitador = idFacilitador;
	}
	public String getPrimerNombre() {
		return primerNombre;
	}
	public void setPrimerNombre(String primerNombre) {
		this.primerNombre = primerNombre;
	}
	public String getSegundoNombre() {
		return segundoNombre;
	}
	public void setSegundoNombre(String segundoNombre) {
		this.segundoNombre = segundoNombre;
	}
	public String getPrimerApellido() {
		return primerApellido;
	}
	public void setPrimerApellido(String primerApellido) {
		this.primerApellido = primerApellido;
	}
	public String getSegundoApellido() {
		return segundoApellido;
	}
	public void setSegundoApellido(String segundoApellido) {
		this.segundoApellido = segundoApellido;
	}
	
	

}
