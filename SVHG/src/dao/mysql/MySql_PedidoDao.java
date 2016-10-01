package dao.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import beans.PedidoBean;
import beans.ProductoBean;
import dao.interfaces.PedidoDao;

import daofactory.MySqlDAOFactory;

public class MySql_PedidoDao extends MySqlDAOFactory implements PedidoDao {

	@Override
	public ArrayList<PedidoBean> listarPedidosPendientes(int idUsuario) throws Exception {
		// TODO Auto-generated method stub
		ArrayList<PedidoBean> pedidos=new ArrayList<PedidoBean>();
		try {
			Connection con=MySqlDAOFactory.obtenerConexion();
			
			Statement stmt=con.createStatement();
			
			String query="select *  from venta where id_usuario='"+idUsuario+"' and est='PENDIENTE'";
			System.out.println("QUERY DE VENTAS LISTADO ---->"+query);
			ResultSet rs=stmt.executeQuery(query);
			PedidoBean pedido=null;
			while(rs.next()){
				pedido=new PedidoBean();
				pedido.setId(rs.getInt("id"));
				pedido.setNumPedido(rs.getString("num_ped"));
				pedido.setFechaEntrega(rs.getString("fec_ent"));
				pedido.setDireccion("direc");
				pedido.setDistrto("dis");
				pedido.setEstado(rs.getString("est"));
				pedido.setTipoPago(rs.getString("for_pag"));
				
				pedidos.add(pedido);
				
			}
			con.close();
		} catch (Exception e) {
			System.out.println("fallo en el metodo listartodos de MySqlPedidoDao: "+e.getMessage());
		}
		return pedidos;
	}
	@Override
	public ArrayList<PedidoBean> listarPedidosEntregados(int idUsuario) throws Exception {
		// TODO Auto-generated method stub
		ArrayList<PedidoBean> pedidos=new ArrayList<PedidoBean>();
		try {
			Connection con=MySqlDAOFactory.obtenerConexion();
			
			Statement stmt=con.createStatement();
			
			String query="select *  from venta where id_usuario='"+idUsuario+"' and est='ENTREGADO'";
			System.out.println("QUERY DE VENTAS LISTADO ---->"+query);
			ResultSet rs=stmt.executeQuery(query);
			PedidoBean pedido=null;
			while(rs.next()){
				pedido=new PedidoBean();
				pedido.setId(rs.getInt("id"));
				pedido.setNumPedido(rs.getString("num_ped"));
				pedido.setFechaEntrega(rs.getString("fec_ent"));
				pedido.setDireccion("direc");
				pedido.setDistrto("dis");
				pedido.setEstado(rs.getString("est"));
				pedido.setTipoPago(rs.getString("for_pag"));
				
				pedidos.add(pedido);
			}
			con.close();
		} catch (Exception e) {
			System.out.println("fallo en el metodo listartodos de MySqlPedidoDao: "+e.getMessage());
		}
		return pedidos;
	}
	@Override
	public ArrayList<PedidoBean> listarProductosPedido() throws Exception {
		// TODO Auto-generated method stub
		ArrayList<PedidoBean> productos=new ArrayList<PedidoBean>();
		try {
			Connection con=MySqlDAOFactory.obtenerConexion();
			
			Statement stmt=con.createStatement();
			
			String query="select det.ven_id as venta_producto, pro.id as producto_id, pro.nom as producto_nombre, cat.tipo as tipo_categoria, pro.med as producto_medida, det.can as venta_cantidad, pro.peso as producto_peso,pro.pre as producto_precio "
					+ " from detalle_venta det, producto pro , categoria cat "
					+ " where  det.pro_id=pro.id "
					+ " and pro.cat_id=cat.id";
			System.out.println("QUERY DE PRODUCTOS POR VENTA LISTADO ---->"+query);
			ResultSet rs=stmt.executeQuery(query);
			PedidoBean producto=null;
			while(rs.next()){
				producto=new PedidoBean();
				producto.setId(rs.getInt("venta_producto"));
				producto.setProductoId(Integer.toString(rs.getInt("producto_id")));
				producto.setProductoNombre(rs.getString("producto_nombre"));
				producto.setCategoriaProducto(rs.getString("tipo_categoria"));
				producto.setMedidaProducto(rs.getString("producto_medida"));
				producto.setCantidad(rs.getDouble("venta_cantidad"));
				producto.setPesoUnidad(rs.getDouble("producto_peso"));
				producto.setPrecioUnidad(rs.getDouble("producto_precio"));
				
				
				productos.add(producto);
			}
			con.close();
		} catch (Exception e) {
			System.out.println("fallo en el metodo listar productos venta de MySqlPedidoDao: "+e.getMessage());
		}
		return productos;
	}
	
	@Override
	public ArrayList<PedidoBean> buscarDetallePedido(String idPedido){
	// TODO Auto-generated method stub
			ArrayList<PedidoBean> pedidos=new ArrayList<PedidoBean>();
			try {
				Connection con=MySqlDAOFactory.obtenerConexion();
				
				Statement stmt=con.createStatement();
				//pe.EST_ENT ,pe.TIP_ENT , pe.FEC_CREA_REGI,p.DNI,p.NOM,p.DIR,pr.ID,pr.NOM ,pr.PESO,dt.CAN,pr.PRE,dt.IMP
				String query="Select * from persona p  INNER JOIN usuario u ON p.id=u.id INNER JOIN transaccion t ON u.id=t.ID_USUARIO  INNER JOIN pedido pe ON pe.PED_ID=t.ID INNER JOIN detalle_transaccion dt ON t.ID =dt.VEN_ID  INNER JOIN producto pr ON dt.PRO_ID=pr.ID and pe.EST_ENT='P' and pe.PED_ID ='"+idPedido+"'";
				System.out.println("QUERY DE VENTAS LISTADO ---->"+query);
				ResultSet rs=stmt.executeQuery(query);
				PedidoBean pedido=null;
				while(rs.next()){
					pedido=new PedidoBean();
					pedido.setEstado(rs.getString("pe.EST_ENT"));
					pedido.setTipoPedido(rs.getString("pe.TIPO_PAG"));
					pedido.setFechaCreacion(rs.getString("pe.FEC_CREA_REGI"));
					pedido.setDni(rs.getInt("p.DNI"));
					pedido.setDireccion(rs.getString("p.DIR"));
					pedido.setNombrePersona(rs.getString("p.NOM"));
					pedido.setProductoId(rs.getString("pr.CODPRO"));
					pedido.setProductoNombre(rs.getString("pr.NOM"));
					pedido.setPesoUnidad(rs.getDouble("pr.PESO"));
					pedido.setCantidad(rs.getInt("dt.CAN"));
					pedido.setPrecioUnidad(rs.getDouble("pr.PRE"));
					pedido.setImpProd(rs.getDouble("dt.IMP")); 

					pedidos.add(pedido);

				}
				con.close();
			} catch (Exception e) {
				System.out.println("fallo en el metodo listartodos de MySqlPedidoDao: "+e.getMessage());
			}
			return pedidos;
	}
	@Override
	public boolean actualizarEstadoPedido(String idTransaccion) throws Exception {
		// TODO Auto-generated method stub
				boolean flag=false;
				try {
					Connection con=MySqlDAOFactory.obtenerConexion();
					
					Statement stmt=con.createStatement();
					
					String query="UPDATE pedido set EST_ENT='E' where PED_ID='"+idTransaccion+"'";
					
					int filas=stmt.executeUpdate(query);
					if(filas==1){
						flag=true;
					}
					
					con.close();
				} catch (Exception e) {
					System.out.println("fallo en el metodo actualizar de MySqlPedidoDao: "+e.getMessage());
				}
				return flag;
	}
}
