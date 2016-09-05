package dao.interfaces;

import java.util.ArrayList;
import java.util.Vector;

import beans.CategoriaBean;
import beans.ProductoBean;

public interface ProductoDao {
	public ArrayList<ProductoBean> listarTodos()throws Exception; 
	public ArrayList<CategoriaBean> listarCategorias() throws Exception;
	public boolean agregarProducto(ProductoBean producto) throws Exception;
	public boolean actualizarProducto(ProductoBean producto) throws Exception;
	public ProductoBean buscar(int id) throws Exception;
	public String buscarUltimoCod(String categoria)throws Exception;
	public boolean habilitar(int id) throws Exception;
	public boolean desabilitar(int id) throws Exception;
	public boolean buscarCoincidencia(double peso, String nombre) throws Exception;
}
