package entidades;

public class Usuario {
	
	private String usuario;
	private String password;
	private boolean estado;
	
	
	
	public Usuario() {
		
	}

	public Usuario(String usuario, String password, boolean estado) {
		super();
		this.usuario = usuario;
		this.password = password;
		this.estado = estado;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	
	
	

}
