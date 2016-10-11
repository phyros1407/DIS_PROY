package dao.interfaces;

public interface VentaDao {
	public boolean registrarOferta(int idUsuario,String numeroTran,String fechaEntrega,
			String[] productoId,int[] productoCantidad,double[] productoImporte,
			String tipoFac) throws Exception;	
	
	public String generarNumeroTransaccion (String num) throws Exception;
}
