package dao.interfaces;

import java.util.ArrayList;

import beans.PedidoBean;



public interface PedidoDao {

	
	public ArrayList<PedidoBean> listarPedidosPendientes(int idUsuario) throws Exception;
	
	public ArrayList<PedidoBean> listarPedidosEntregados(int idUsuario) throws Exception;
	
	public ArrayList<PedidoBean> listarProductosPedido() throws Exception;
	
	public ArrayList<PedidoBean> buscarDetallePedido(String idPedido) throws Exception;
	
	public boolean actualizarEstadoPedido(String idTransaccion) throws Exception;
}
