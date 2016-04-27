package entidades;

public class DetalleSolicitudTaller {
	
	private int idDetalleSolicitudTaller;
	private int idSolicitudTaller;
	private int idTaller1;
	private int idTaller2;
	private int idTaller3;
	
	
	public DetalleSolicitudTaller() {
		super();
	}
	
	public DetalleSolicitudTaller(int idDetalleSolicitudTaller,
			int idSolicitudTaller, int idTaller1, int idTaller2, int idTaller3) {
		super();
		this.idDetalleSolicitudTaller = idDetalleSolicitudTaller;
		this.idSolicitudTaller = idSolicitudTaller;
		this.idTaller1 = idTaller1;
		this.idTaller2 = idTaller2;
		this.idTaller3 = idTaller3;
	}
	
	public int getIdDetalleSolicitudTaller() {
		return idDetalleSolicitudTaller;
	}
	public void setIdDetalleSolicitudTaller(int idDetalleSolicitudTaller) {
		this.idDetalleSolicitudTaller = idDetalleSolicitudTaller;
	}
	public int getIdSolicitudTaller() {
		return idSolicitudTaller;
	}
	public void setIdSolicitudTaller(int idSolicitudTaller) {
		this.idSolicitudTaller = idSolicitudTaller;
	}
	public int getIdTaller1() {
		return idTaller1;
	}
	public void setIdTaller1(int idTaller1) {
		this.idTaller1 = idTaller1;
	}
	public int getIdTaller2() {
		return idTaller2;
	}
	public void setIdTaller2(int idTaller2) {
		this.idTaller2 = idTaller2;
	}
	public int getIdTaller3() {
		return idTaller3;
	}
	public void setIdTaller3(int idTaller3) {
		this.idTaller3 = idTaller3;
	}
	
	

}
