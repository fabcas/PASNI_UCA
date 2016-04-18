package entidades;

import java.io.InputStream;
import java.sql.Date;

public class PerfilMonitor {
	
	private int idDocumento;
	private Date fecha;
	private int idMonitor;
	private InputStream imagen;
	
	public int getIdDocumento() {
		return idDocumento;
	}
	public void setIdDocumento(int idDocumento) {
		this.idDocumento = idDocumento;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public int getIdMonitor() {
		return idMonitor;
	}
	public void setIdMonitor(int idMonitor) {
		this.idMonitor = idMonitor;
	}
	public InputStream getImagen() {
		return imagen;
	}
	public void setImagen(InputStream inputStream) {
		this.imagen = inputStream;
	}
	public PerfilMonitor() {
		super();
	}
	public PerfilMonitor(int idDocumento, Date fecha,
			int idMonitor, InputStream imagen) {
		super();
		this.idDocumento = idDocumento;
		this.fecha = fecha;
		this.idMonitor = idMonitor;
		this.imagen = imagen;
	}
	
	
}
