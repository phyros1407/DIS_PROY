package dao.interfaces;

import java.util.ArrayList;

import beans.BoletaBean;
import beans.ComprobanteBean;

public interface VentaDao {
	public boolean registrarVenta(int idUsuario,String numeroTran,String fechaEntrega,
			String[] productoId,int[] productoCantidad,double[] productoImporte,
			String tipoFac) throws Exception;	
	
	public String generarNumeroTransaccion (String num) throws Exception;
	public boolean guardarComprobante(ComprobanteBean comprobante) throws Exception;
	public String obtenerUltimoNumeroComprobantexTipo(String tipo) throws Exception;
	public ArrayList<BoletaBean> buscarComprobanteGenerado(String numeroTransaccion); 
}
