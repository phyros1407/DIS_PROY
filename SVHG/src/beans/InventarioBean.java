package beans;

public class InventarioBean {
	
	int idInventario;
	String nombre;
	int CantidadSalida;
	int CantidadEntrada;
	int TotalRestante;
	public int getIdInventario() {
		return idInventario;
	}
	public void setIdInventario(int idInventario) {
		this.idInventario = idInventario;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getCantidadSalida() {
		return CantidadSalida;
	}
	public void setCantidadSalida(int cantidadSalida) {
		CantidadSalida = cantidadSalida;
	}
	public int getCantidadEntrada() {
		return CantidadEntrada;
	}
	public void setCantidadEntrada(int cantidadEntrada) {
		CantidadEntrada = cantidadEntrada;
	}
	public int getTotalRestante() {
		return TotalRestante;
	}
	public void setTotalRestante(int totalRestante) {
		TotalRestante = totalRestante;
	}
	
	
	
}
