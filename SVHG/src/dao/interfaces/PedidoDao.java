package dao.interfaces;

import java.util.ArrayList;

import beans.PedidoBean;
import beans.TransaccionBean;



public interface PedidoDao {
	
	//GENERAR PEDIDO
	public String generarNumeroTransaccion () throws Exception;
	public String guardarTransaccion(TransaccionBean transaccion) throws Exception;
	public String guardarPedido(PedidoBean pedido) throws Exception;
	public boolean guardarDetallePedido() throws Exception;
	public boolean guardarComprobante() throws Exception;
	
	public boolean actualizarEstadoPedido(String id) throws Exception;

	public ArrayList<PedidoBean> buscarDetallePedido(String idPedido) throws Exception;
	
	public ArrayList<PedidoBean> listarPedidos(int idUsuario,String estado) throws Exception;
	
	public PedidoBean cambiarEstadoPedido(int id) throws Exception;
	
	public ArrayList<PedidoBean> listarProductosPedido() throws Exception;
}
