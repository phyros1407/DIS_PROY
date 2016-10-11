package dao.mysql;

import java.sql.Connection;


import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

import beans.CategoriaBean;
import beans.ProductoBean;
import dao.interfaces.ProductoDao;
import daofactory.MySqlDAOFactory;

public class MySql_ProductoDao  extends MySqlDAOFactory implements ProductoDao {

	@Override
	public ArrayList<ProductoBean> listarTodos() throws Exception {
		ArrayList<ProductoBean> productos=new ArrayList<ProductoBean>();
		try {
			Connection con=MySqlDAOFactory.obtenerConexion();
			
			Statement stmt=con.createStatement();
			
			String query="select *  from producto a INNER JOIN categoria b ON a.cat_id=b.id ORDER BY a.pre";
			System.out.println("QUERY DE PRODUCTOS LISTADO ---->"+query);
			ResultSet rs=stmt.executeQuery(query);
			ProductoBean producto=null;
			CategoriaBean categoria=null;
			while(rs.next()){
				categoria= new CategoriaBean();
				categoria.setTipo(rs.getString("b.tipo"));
				
				producto=new ProductoBean();
				
				producto.setIdProducto(rs.getInt("id"));
				producto.setIdCategoria(rs.getInt("cat_id"));
				producto.setCodPro(rs.getString("codpro"));
				producto.setNombre(rs.getString("nom"));
				producto.setDescripcion(rs.getString("des"));
				producto.setFoto(rs.getString("foto"));
				producto.setEstado(rs.getString("est"));
				producto.setPrecio(rs.getDouble("pre"));
				producto.setMedida(rs.getString("med"));
				producto.setCantidad(rs.getInt("can"));
				producto.setDescuento(rs.getString("est_dsc"));;
				producto.setPeso(rs.getDouble("peso"));
				producto.setCategoriaBean(categoria);
				productos.add(producto);
			}
			con.close();
		} catch (Exception e) {
			System.out.println("fallo en el metodo listartodos de MySqlProductoDao");
		}
		return productos;
	}
	@Override
	public ArrayList<CategoriaBean> listarCategorias() throws Exception {
		// TODO Auto-generated method stub
		ArrayList<CategoriaBean> categorias = new ArrayList<CategoriaBean>();
		try{
			Connection con=MySqlDAOFactory.obtenerConexion();
			
			Statement stmt=con.createStatement();
			
			String query ="select * from categoria";
			ResultSet rs = stmt.executeQuery(query);
			System.out.println("QUERY DE CATEGORIAS LISTADO ---->"+query);
			CategoriaBean categoria = null;
			
			while(rs.next()){
				categoria = new CategoriaBean();
				categoria.setIdCategoria(rs.getInt("id"));
				categoria.setTipo(rs.getString("tipo"));
				categoria.setDescripcion(rs.getString("des"));
				categorias.add(categoria);
			}
			
			
		}catch(Exception e){
			System.out.println("---->Fallo en el listado de las categorias");
		}
		
		return categorias;
	}

	@Override
	public boolean agregarProducto(ProductoBean producto) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		
		try{
			Connection con=MySqlDAOFactory.obtenerConexion();
			
			Statement stmt=con.createStatement();
			
			String query = "insert into producto (cat_id,codpro,nom,des,foto,est,med,can,pre,est_dsc,peso,usu_crea_regi,fec_crea_regi,ult_usu_mod_regi,fec_ult_mod_regi)  "
						 + " values ("+producto.getIdCategoria()+",'"+producto.getCodPro().toUpperCase()+"','"+producto.getNombre().toUpperCase()+"','"+producto.getDescripcion().toUpperCase()+"','"+producto.getFoto()+"','A','"+producto.getMedida()+"',0,"+producto.getPrecio()+",0,"+producto.getPeso()+",'USU',now(),'USU',now())";
			
			int filas = stmt.executeUpdate(query);
			
			if(filas == 1){
				flag = true;
			}
			
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		return flag;
	}

	@Override
	public String buscarUltimoCod(String categoria) throws Exception {
		// TODO Auto-generated method stub
		int cantidad = 0;
		try{
			Connection con=MySqlDAOFactory.obtenerConexion();
			
			Statement stmt=con.createStatement();	
			
			String query = "select MAX(substring(CODPRO,5)) as ultimo from producto where CAT_ID = "+categoria+";";
			
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()){
				cantidad = rs.getInt("ultimo");
			}

			if(cantidad==0){
				return  "001";
			}else{ 
				if(String.valueOf(cantidad+1).length()==2){
					cantidad = cantidad+1;
					System.out.println("0"+cantidad);
					return "0"+cantidad;
				}else if(String.valueOf(cantidad+1).length()==1){
					cantidad = cantidad+1;
					System.out.println("00"+cantidad);
					return  "00"+cantidad;
				}else{
					cantidad = cantidad + 1;
					return String.valueOf(cantidad);
				}
			}
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		return null;
	}

	@Override
	public boolean actualizarProducto(ProductoBean producto) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		
		try{
			Connection con=MySqlDAOFactory.obtenerConexion();
			
			Statement stmt=con.createStatement();
			
			String query = "";
			
			if(producto.getFoto().trim().equalsIgnoreCase("images/")) {
				
				query = " update producto "
						+  " set cat_id = "+producto.getIdCategoria()+", codpro = '"+producto.getCodPro()+"', nom = '"+producto.getNombre().trim().toUpperCase()+"', "
						+  " des = '"+producto.getDescripcion().trim().toUpperCase()+"', med = '"+producto.getMedida().toUpperCase()+"', "
						+  " pre = "+producto.getPrecio()+", peso ="+producto.getPeso()+", ult_usu_mod_regi = 'USU', fec_ult_mod_regi = now()"
						+  " where id = "+ producto.getIdProducto();
				
			}else{
				query = " update producto "
						+  " set cat_id = "+producto.getIdCategoria()+", codpro = '"+producto.getCodPro()+"', nom = '"+producto.getNombre().trim().toUpperCase()+"', "
						+  " des = '"+producto.getDescripcion().trim().toUpperCase()+"', foto = '"+producto.getFoto()+"', med = '"+producto.getMedida().toUpperCase()+"', "
						+  " pre = "+producto.getPrecio()+", peso ="+producto.getPeso()+", ult_usu_mod_regi = 'USU', fec_ult_mod_regi = now()"
						+  " where id = "+ producto.getIdProducto();
			}
			
			
			System.out.println("QUERY PARA LA ACTUALIZACION --->" + query);
			int filas = stmt.executeUpdate(query);
			
			if(filas == 1){
				flag = true;
			}
			
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		return flag;
	}

	@Override
	public ProductoBean buscar(int id) throws Exception {
		// TODO Auto-generated method stub
		
		ProductoBean producto = new ProductoBean();
		
		try{
			Connection con=MySqlDAOFactory.obtenerConexion();
			
			Statement stmt=con.createStatement();
			
			String query = "select * from producto p,categoria c where p.id ="+id+" and  p.cat_id = c.id ";
			
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()){
				producto.setIdProducto(rs.getInt("id"));
				producto.setIdCategoria(rs.getInt("cat_id"));
				producto.setCategoria(rs.getString("tipo"));
				producto.setCodPro(rs.getString("codpro"));
				producto.setNombre(rs.getString("nom"));
				producto.setDescripcion(rs.getString("des"));
				producto.setFoto(rs.getString("foto"));
				producto.setEstado(rs.getString("est"));
				producto.setPrecio(rs.getDouble("pre"));
				producto.setMedida(rs.getString("med"));
				producto.setCantidad(rs.getInt("can"));
				producto.setDescuento(rs.getString("est_dsc"));;
				producto.setPeso(rs.getDouble("peso"));
			}
			
			
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		return producto;
	}

	@Override
	public boolean habilitar(int id) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		
		try{
			Connection con=MySqlDAOFactory.obtenerConexion();
			
			Statement stmt=con.createStatement();
			
			String query  = "update producto set est = 'A' where id="+id;
			System.out.println("para habilitarlo-->"+query);
			stmt.executeUpdate(query);
			
			
				flag=true;
		
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		
		return flag;
	}

	@Override
	public boolean desabilitar(int id) throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		
		try{
			Connection con=MySqlDAOFactory.obtenerConexion();
			
			Statement stmt=con.createStatement();
			
			String query  = "update producto set est = 'I' where id="+id;
			System.out.println("para desabilitarlo-->"+query);
			stmt.executeUpdate(query);
			
			flag = true;
			
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		
		
		return flag;
	}

	@Override
	public boolean buscarCoincidencia(int id,double peso, String nombre) throws Exception {
		// TODO Auto-generated method stub
		
		boolean flag = false;
		
		try{
			Connection con=MySqlDAOFactory.obtenerConexion();
			
			Statement stmt=con.createStatement();
			
			
			
			String query2 = "select nom from producto where id = "+ id;
			
			ResultSet rs2 = stmt.executeQuery(query2);
			String nombreprueba = "";
			if(rs2.next()){
				nombreprueba = rs2.getString("nom");
			}
			
			if(!(nombreprueba.equalsIgnoreCase(nombre))){
				
				String query = "select * from producto where NOM like '%"+nombre.trim().toUpperCase()+"%' and peso = "+peso;
				
				
				ResultSet rs = stmt.executeQuery(query);
				
				
				
				if(!(rs.first())){
					flag = true;
				}
			}else{
				flag=true;
			}
			
			
			
			
			
		}catch(Exception e){
			e.getMessage();
		}
		
		
		
		return flag;
	}
	
	
	
	@Override
	public ArrayList<ProductoBean> traerProducto(String id) throws Exception {
		ArrayList<ProductoBean> productos=new ArrayList<ProductoBean>();
		try {
			Connection con=MySqlDAOFactory.obtenerConexion();
			Statement stmt=con.createStatement();
			String query="select *  from producto a INNER JOIN categoria b ON a.cat_id=b.id  where a.id="+id;
			System.out.println("PROUCTO PARA EL CARRITO ---->"+query);
			ResultSet rs=stmt.executeQuery(query);
			ProductoBean producto=null;
			CategoriaBean categoria=null;
			while(rs.next()){
				categoria= new CategoriaBean();
				categoria.setTipo(rs.getString("b.tipo"));
				
				producto=new ProductoBean();
				
				producto.setIdProducto(rs.getInt("id"));
				producto.setIdCategoria(rs.getInt("cat_id"));
				producto.setCodPro(rs.getString("codpro"));
				producto.setNombre(rs.getString("nom"));
				producto.setDescripcion(rs.getString("des"));
				producto.setFoto(rs.getString("foto"));
				producto.setEstado(rs.getString("est"));
				producto.setPrecio(rs.getDouble("pre"));
				producto.setMedida(rs.getString("med"));
				producto.setCantidad(rs.getInt("can"));
				producto.setDescuento(rs.getString("est_dsc"));;
				producto.setPeso(rs.getDouble("peso"));
				producto.setCategoriaBean(categoria);
				
				productos.add(producto);
			}
			con.close();
		} catch (Exception e) {
			System.out.println("fallo en el metodo listartodos de MySqlProductoDao"+e.getMessage());
		}
		return productos;
	}
	

	/*-------------------rhonnald-----------------------------------*/
	@Override
	public ArrayList<ProductoBean> buscarXcriterio(String dato, int flag,
			int flagC) throws Exception {
		ArrayList<ProductoBean> productos = new ArrayList<ProductoBean>();
		try {
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			String query="select prod.id,prod.codpro,prod.nom,prod.des,prod.pre,prod.cat_id,prod.can,ca.tipo "
					+ "from producto prod inner join  categoria ca on prod.cat_id=ca.id where ";
			
			if(flag==1){
				query+="prod.codpro like '%"+dato+"%';";				
			}else if(flag==2){
				query+="prod.nom like '%"+dato+"%';";
			}else{
				query+="prod.nom like '%"+dato+"%' and prod.codpro like '%"+dato+"%' and prod.cat_id='"+flagC+"';";
			
			}
			System.out.println("query: "+query);
			ResultSet rs = stmt.executeQuery(query);
			ProductoBean producto=null;
			while(rs.next()){
				producto=new ProductoBean();
				producto.setIdProducto(rs.getInt("prod.id"));
				producto.setIdCategoria(rs.getInt("prod.cat_id"));
				producto.setCodPro(rs.getString("prod.codpro"));
				producto.setNombre(rs.getString("prod.nom"));
				producto.setDescripcion(rs.getString("prod.des"));
				producto.setPrecio(rs.getDouble("prod.pre"));
				producto.setCategoria(rs.getString("ca.tipo"));
				producto.setCantidad(rs.getInt("prod.can"));
			
				productos.add(producto);
			}
			
			con.close();
		} catch (Exception e) {
			System.out.print("error de buscarxcriterio en MysqlProductoDao.java");
		}
		System.out.println("qerasdadad"+ productos);
		return productos;
	}

	@Override
	public ProductoBean datosProducto(int id) throws Exception {
		ProductoBean producto = null;
		try {
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			String query = "select prod.id,prod.codpro,prod.nom,prod.des,prod.pre,prod.cat_id,prod.can,ca.tipo "
					+ "from producto prod inner join  categoria ca on prod.cat_id=ca.id where prod.id="+id+"";
			
			
			System.out.println("query: "+query);
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()){
				producto=new ProductoBean();
				producto.setIdProducto(rs.getInt("prod.id"));
				producto.setCodPro(rs.getString("prod.codpro"));
				producto.setNombre(rs.getString("prod.nom"));
				producto.setDescripcion(rs.getString("prod.des"));
				producto.setPrecio(rs.getDouble("prod.pre"));
				producto.setCategoria(rs.getString("ca.tipo"));
				producto.setCantidad(rs.getInt("prod.can"));
				producto.setIdCategoria(rs.getInt("prod.cat_id"));
				
			}	
			con.close();
		} catch (Exception e) {
			System.out.print("error de datosCliente en MysqlProductoDao.java");
		}
		System.out.println("qerasdadad"+ producto);
		return producto;
	}
	
	

	
}
