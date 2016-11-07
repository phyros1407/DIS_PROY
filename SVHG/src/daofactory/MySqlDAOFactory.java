package daofactory;

import java.sql.Connection;
import java.sql.DriverManager;

import dao.interfaces.ClienteDao;
import dao.interfaces.ComprobanteDao;
import dao.interfaces.DetalleTransaccionDao;
import dao.interfaces.EmpresaDao;
import dao.interfaces.OfertaDao;
import dao.interfaces.PedidoDao;
import dao.interfaces.PersonaDao;
import dao.interfaces.ProductoDao;
import dao.interfaces.ProveedorDao;
import dao.interfaces.UsuarioDao;
import dao.interfaces.VentaDao;
import dao.mysql.MySQLEmpleadoDao;
import dao.mysql.MySQLEmpresaDao;
import dao.mysql.MySQLOfertaDao;
import dao.mysql.MySql_ClienteDao;
import dao.mysql.MySql_ComprobanteDao;
import dao.mysql.MySql_DetalleTransaccionDao;
import dao.mysql.MySql_PedidoDao;
import dao.mysql.MySql_ProductoDao;
import dao.mysql.MySql_ProveedorDao;
import dao.mysql.MySql_UsuarioDao;
import dao.mysql.MySql_VentaDao;

public class MySqlDAOFactory extends DAOFactory {
	
	public static Connection obtenerConexion(){
		Connection conexion=null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://mysql110519-dis-pruebas.jelasticlw.com.br/bd_dis";
			conexion = DriverManager.getConnection(url,"root","PLMoev75621");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		/*
		 try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/bd_gym_4.6.7_data";
			conexion = DriverManager.getConnection(url,"root","root");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		 
		 */
		
		return conexion;
	}

	@Override
	public ProveedorDao getProveedorDao() {
		// TODO Auto-generated method stub
		return new MySql_ProveedorDao();
	}
	

	@Override
	public ProductoDao getProductoDao() {
		// TODO Auto-generated method stub
		return new MySql_ProductoDao();
	}
	
	public UsuarioDao getUsuarioDao() {
		// TODO Auto-generated method stub
		return new MySql_UsuarioDao();
	}

	@Override
	public PersonaDao getPersonaDAO() {
		// TODO Auto-generated method stub
		return new MySQLEmpleadoDao();
	}

	@Override
	public EmpresaDao getEmpresaDAO() {
		// TODO Auto-generated method stub
		return new MySQLEmpresaDao();
	}
	@Override
	public PedidoDao getPedidoDAO() {
		// TODO Auto-generated method stub
		return new MySql_PedidoDao();
	}

	@Override
	public OfertaDao getOfertaDAO() {
		// TODO Auto-generated method stub
		return new MySQLOfertaDao();
	}

	@Override
	public ClienteDao getClienteDao() {
		// TODO Auto-generated method stub
		return new MySql_ClienteDao();
	}

	@Override
	public DetalleTransaccionDao geDetalleTransaccionDao() {
		// TODO Auto-generated method stub
		return new MySql_DetalleTransaccionDao();
	}
	
	@Override
	public VentaDao getVentaDao() {
		// TODO Auto-generated method stub
		return new MySql_VentaDao();
	}

	@Override
	public ComprobanteDao getComprobanteDao() {
		// TODO Auto-generated method stub
		return new MySql_ComprobanteDao();
	}
}
