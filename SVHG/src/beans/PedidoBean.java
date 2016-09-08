package beans;

public class PedidoBean {

	
	private int id;
	private String numPedido;
	private String estado;
	private String fechaEntrega;
	private String direccion;
	private String distrto;
	private String tipoPago;
	private String ProductoId;
	private String productoNombre;
	private double cantidad;
	private String categoriaProducto;
	private int categoriaProductoId;
	private String medidaProducto;
	private double precioUnidad;
	private double pesoUnidad;
	
	
	
	
	public String getProductoId() {
		return ProductoId;
	}
	public void setProductoId(String productoId) {
		ProductoId = productoId;
	}
	public String getProductoNombre() {
		return productoNombre;
	}
	public void setProductoNombre(String productoNombre) {
		this.productoNombre = productoNombre;
	}
	public double getCantidad() {
		return cantidad;
	}
	public void setCantidad(double cantidad) {
		this.cantidad = cantidad;
	}
	public String getCategoriaProducto() {
		return categoriaProducto;
	}
	public void setCategoriaProducto(String categoriaProducto) {
		this.categoriaProducto = categoriaProducto;
	}
	public int getCategoriaProductoId() {
		return categoriaProductoId;
	}
	public void setCategoriaProductoId(int categoriaProductoId) {
		this.categoriaProductoId = categoriaProductoId;
	}
	public String getMedidaProducto() {
		return medidaProducto;
	}
	public void setMedidaProducto(String medidaProducto) {
		this.medidaProducto = medidaProducto;
	}
	public double getPrecioUnidad() {
		return precioUnidad;
	}
	public void setPrecioUnidad(double precioUnidad) {
		this.precioUnidad = precioUnidad;
	}
	public double getPesoUnidad() {
		return pesoUnidad;
	}
	public void setPesoUnidad(double pesoUnidad) {
		this.pesoUnidad = pesoUnidad;
	}
	public String getTipoPago() {
		return tipoPago;
	}
	public void setTipoPago(String tipoPago) {
		this.tipoPago = tipoPago;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getNumPedido() {
		return numPedido;
	}
	public void setNumPedido(String numPedido) {
		this.numPedido = numPedido;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getFechaEntrega() {
		return fechaEntrega;
	}
	public void setFechaEntrega(String fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getDistrto() {
		return distrto;
	}
	public void setDistrto(String distrto) {
		this.distrto = distrto;
	}
	
	
}
