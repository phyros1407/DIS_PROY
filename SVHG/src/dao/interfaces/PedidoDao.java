package dao.interfaces;

import java.util.ArrayList;

import beans.ComprobanteBean;
import beans.DetalleTransaccionBean;
import beans.EmpresaBean;
import beans.PedidoBean;
import beans.TransaccionBean;



public interface PedidoDao {
	
	//GENERAR PEDIDO
	public String generarNumeroTransaccion () throws Exception;
	public int guardarTransaccion(TransaccionBean transaccion) throws Exception;
	public boolean guardarPedido(PedidoBean pedido) throws Exception;
	public boolean guardarDetallePedido(DetalleTransaccionBean detalle) throws Exception;
	public String obtenerUltimoNumeroComprobantexTipo(String tipo) throws Exception;
	public boolean guardarComprobante(ComprobanteBean comprobante) throws Exception;
	public EmpresaBean buscarEmpresaXUsuario(int id)throws Exception;
	
	public boolean actualizarEstadoPedido(String id) throws Exception;

	public ArrayList<PedidoBean> buscarDetallePedido(String idPedido) throws Exception;
	
	public ArrayList<PedidoBean> listarPedidos(int idUsuario,String estado) throws Exception;
	
	public PedidoBean cambiarEstadoPedido(int id) throws Exception;
	
	public ArrayList<PedidoBean> listarProductosPedido() throws Exception;
}
