package dao.interfaces;

import java.util.ArrayList;

import beans.PedidoBean;



public interface PedidoDao {


	
	public boolean actualizarEstadoPedido(String id) throws Exception;

	public ArrayList<PedidoBean> buscarDetallePedido(String idPedido) throws Exception;
	
	public ArrayList<PedidoBean> listarPedidos(int idUsuario,String estado) throws Exception;
	
	public PedidoBean cambiarEstadoPedido(int id) throws Exception;
	
	public ArrayList<PedidoBean> listarProductosPedido() throws Exception;
}
