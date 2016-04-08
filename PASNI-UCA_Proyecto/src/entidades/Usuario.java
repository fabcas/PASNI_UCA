package entidades;

public class Usuario {
	
	private int idUsuario;
	private String usuario;
	private String password;
	private boolean estado;
	private int IdRol;
	private String nombreRol;
	private String nombreMonitor;
	private Monitor m;
	private Profesor pg;
	
	public Usuario() {
		
	}

	public Usuario(int idUsuario, String usuario, String password,
			boolean estado, int idRol, String nombreRol, String nombreMonitor) {
		super();
		this.idUsuario = idUsuario;
		this.usuario = usuario;
		this.password = password;
		this.estado = estado;
		this.IdRol = idRol;
		this.nombreRol = nombreRol;
		this.nombreMonitor = nombreMonitor;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
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

	public int getIdRol() {
		return IdRol;
	}

	public void setIdRol(int idRol) {
		IdRol = idRol;
	}

	public String getNombreRol() {
		return nombreRol;
	}

	public void setNombreRol(String nombreRol) {
		this.nombreRol = nombreRol;
	}

	public String getNombreMonitor() {
		return nombreMonitor;
	}

	public void setNombreMonitor(String nombreMonitor) {
		this.nombreMonitor = nombreMonitor;
	}

	public Monitor getM() {
		return m;
	}

	public void setM(Monitor m) {
		this.m = m;
	}

	public Profesor getPg() {
		return pg;
	}

	public void setPg(Profesor pg) {
		this.pg = pg;
	}
	
	
	
	
	
	
	

}
