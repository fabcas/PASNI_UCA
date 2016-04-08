package entidades;

public class InstanciasUCA {
	
	private int idInstancia;
	private String nombre;
	private String descripcion;
	private boolean estado;
	
	
	
	public InstanciasUCA() {
		super();
	}
	public InstanciasUCA(int idInstancia, String nombre, String descripcion,
			boolean estado) {
		super();
		this.idInstancia = idInstancia;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.estado = estado;
	}
	public int getIdInstancia() {
		return idInstancia;
	}
	public void setIdInstancia(int idInstancia) {
		this.idInstancia = idInstancia;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	

}
