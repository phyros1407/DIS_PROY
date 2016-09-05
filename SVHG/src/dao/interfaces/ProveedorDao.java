package dao.interfaces;

import java.util.ArrayList;
import java.util.Vector;

import beans.ProveedorBean;



public interface ProveedorDao {
	public ArrayList<ProveedorBean> listarTodos() throws Exception;
	public boolean eliminar(int id)throws Exception;
	public boolean agregar(ProveedorBean proveedor)throws Exception;
	public ProveedorBean seleccionarPorId(int id)throws Exception;
	public boolean actualizar(ProveedorBean proveedor) throws Exception;
	public ProveedorBean seleccionarPorRuc(String ruc)throws Exception;
}
