package dao.interfaces;

import java.util.ArrayList;

import beans.DetalleTransaccionBean;



public interface DetalleTransaccionDao {

	public ArrayList<DetalleTransaccionBean> listarReporte1(String a�o,int productoId)throws Exception;
	
	public ArrayList<DetalleTransaccionBean> listarReporte2(String a�o,int productoId)throws Exception;
	
}
