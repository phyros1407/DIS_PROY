package dao.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;



import beans.ProveedorBean;
import dao.interfaces.ProveedorDao;
import daofactory.MySqlDAOFactory;

public class MySql_ProveedorDao extends MySqlDAOFactory implements ProveedorDao {

	@Override
	public ArrayList<ProveedorBean> listarTodos() throws Exception {
		ArrayList<ProveedorBean> proveedores=new ArrayList<ProveedorBean>();
		try {
			Connection con=MySqlDAOFactory.obtenerConexion();
			Statement stmt=con.createStatement();
			String query="select id,inventario_id,ruc,razon_social,direccion,telefono from proveedor";
			ResultSet rs=stmt.executeQuery(query);
			ProveedorBean proveedor=null;
			while(rs.next()){
				proveedor=new ProveedorBean();
				
				proveedor.setIdProveedor(Integer.parseInt(rs.getString("id")));
				proveedor.setRuc(rs.getString("ruc"));
				proveedor.setRazonSocial("razon_social");
				proveedor.setDireccion(rs.getString("direccion"));
				proveedor.setTelefono(rs.getString("telefono"));
				proveedores.add(proveedor);
			}
			System.out.println(query);
			con.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("fallo en el metodo listartodos de MySqlPersonaDao");
		}
		return proveedores;
	}

	@Override
	public boolean eliminar(int id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean agregar(ProveedorBean proveedor) throws Exception {
		boolean flag = false;
		try {
		Connection con = MySqlDAOFactory.obtenerConexion();
		Statement stmt= con.createStatement();
		
		String query="insert into proveedor (inventario_id,ruc,razon_social,direccion,telefono,usu_crea_regi,fec_crea_regi,ult_usu_mod_regi,fec_ult_mod_regi)values"
				+ " ('1','"+proveedor.getRuc()+"','"+proveedor.getRazonSocial()+"','"+proveedor.getDireccion()+"',"
						+ "'"+proveedor.getTelefono()+"','LGUERRA',now(),'LGUERRA',now())";
		
		int filas = stmt.executeUpdate(query,stmt.RETURN_GENERATED_KEYS);
		
		if(filas==1 ){
			ResultSet rs = stmt.getGeneratedKeys();
			flag = true;
		}
		con.close();
		} catch (Exception e) {
			System.out.println("fallo el agregar Proveedor");
		}
		
		return flag;
	}

	@Override
	public ProveedorBean seleccionarPorId(int id) throws Exception {
		ProveedorBean proveedor = null;
		try {
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			String query = "select id,inventario_id,ruc,razon_social,direccion,telefono from proveedor where id=" + id;
			
			ResultSet rs = stmt.executeQuery(query);
			
			if(rs.next()){
				proveedor = new ProveedorBean();
				proveedor.setIdProveedor(Integer.parseInt(rs.getString("id")));
				proveedor.setRuc(rs.getString("ruc"));
				proveedor.setRazonSocial(rs.getString("razon_social"));
				proveedor.setDireccion(rs.getString("direccion"));
				proveedor.setTelefono(rs.getString("telefono"));
				
				
			}	
			con.close();
		} catch (Exception e) {
			System.out.print("error de buscar en MysqlProveedorDao.java");
		}
		
		return proveedor;
	}

	@Override
	public boolean actualizar(ProveedorBean proveedor) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ProveedorBean seleccionarPorRuc(String ruc) throws Exception {
		ProveedorBean proveedor = null;
		try {
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			String query = "select id,inventario_id,ruc,razon_social,direccion,telefono from proveedor where ruc=" + ruc;
			
			ResultSet rs = stmt.executeQuery(query);
			
			if(rs.next()){
				proveedor = new ProveedorBean();
				proveedor.setIdProveedor(Integer.parseInt(rs.getString("id")));
				proveedor.setRuc(rs.getString("ruc"));
				proveedor.setRazonSocial(rs.getString("razon_social"));
				proveedor.setDireccion(rs.getString("direccion"));
				proveedor.setTelefono(rs.getString("telefono"));
				
				
			}	
			con.close();
		} catch (Exception e) {
			System.out.print("error de BUSCAR en MysqlProveedorDao.java");
		}
		
		return proveedor;
	}	

	
	
	
}
