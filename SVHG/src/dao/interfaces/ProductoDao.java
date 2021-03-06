package dao.interfaces;

import java.util.ArrayList;

import beans.CategoriaBean;
import beans.ProductoBean;

public interface ProductoDao {
	public ArrayList<ProductoBean> traerProducto(String id)throws Exception; 
	public ArrayList<ProductoBean> listarTodos()throws Exception; 
	public ArrayList<CategoriaBean> listarCategorias() throws Exception;
	public boolean agregarProducto(ProductoBean producto) throws Exception;
	public boolean actualizarProducto(ProductoBean producto) throws Exception;
	public ProductoBean buscar(int id) throws Exception;
	public String buscarUltimoCod(String categoria)throws Exception;
	public boolean habilitar(int id) throws Exception;
	public boolean desabilitar(int id) throws Exception;
	public boolean buscarCoincidencia(int id,double peso, String nombre) throws Exception;
	public ArrayList<ProductoBean>  buscarXcriterio(String dato,int flag,int flagC) throws Exception;
	public ProductoBean datosProducto(int id) throws Exception;
}
