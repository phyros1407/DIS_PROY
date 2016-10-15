package dao.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import beans.ComprobanteBean;
import beans.DetalleTransaccionBean;
import beans.EmpresaBean;
import beans.PedidoBean;
import beans.ProductoBean;
import beans.TransaccionBean;
import dao.interfaces.PedidoDao;

import daofactory.MySqlDAOFactory;

public class MySql_PedidoDao extends MySqlDAOFactory implements PedidoDao {

	@Override
	public ArrayList<PedidoBean> listarPedidos(int idUsuario,String estado) throws Exception {
		// TODO Auto-generated method stub
		ArrayList<PedidoBean> pedidos=new ArrayList<PedidoBean>();
		try {
			Connection con=MySqlDAOFactory.obtenerConexion();
			
			Statement stmt=con.createStatement();
			Statement stmt1=con.createStatement();
			String query="select *  from transaccion where id_usuario='"+idUsuario+"' and est='"+estado+"'";
			System.out.println("QUERY DE transacciones LISTADO transacciones---->"+query);
			ResultSet rs=stmt.executeQuery(query);
			PedidoBean pedido=null;
			while(rs.next()){
				pedido=new PedidoBean();
				pedido.setId(rs.getInt("id"));
				
				String[] parts = rs.getString("num").split("-");
				String numPedido = parts[1]; 
				
				pedido.setNumPedido(numPedido);
				pedido.setFechaEntrega(rs.getString("fec_ent"));
				
				
				if(rs.getString("est").equalsIgnoreCase("P")){
					pedido.setEstado("Pendiente");
				}else if(rs.getString("est").equalsIgnoreCase("R")){
					pedido.setEstado("Recibido");
				}else{
					pedido.setEstado("Cancelado");
				}
				
				
				String query1="select tip_ent, tipo_pag, dep_ent,pro_ent,dis_ent, dir_ent "
						+ " from pedido"
						+ " where ped_id='"+rs.getInt("id")+"' ";
				System.out.println("QUERY DE transacciones LISTADO1 transacciones---->"+query1);
				ResultSet rs1=stmt1.executeQuery(query1);
				while(rs1.next()){
					if(rs1.getString("tip_ent").equalsIgnoreCase("EC")){
					pedido.setTipoEntrega("Domicilio");
					}else {
						pedido.setTipoEntrega("Recojo Empresa");
					}
					
					if(rs1.getString("tipo_pag").equalsIgnoreCase("CE")){
						pedido.setTipoPago("Contra-Entrega");
					}else if(rs1.getString("tipo_pag").equalsIgnoreCase("TA")){
						pedido.setTipoPago("Tarjeta");
					}else{
						pedido.setTipoPago("Paypal");
					}
					
					pedido.setDireccion(rs1.getString("dir_ent"));
					pedido.setDistrto(rs1.getString("dis_ent"));
					pedido.setProvincia(rs1.getString("pro_ent"));
					pedido.setDepartamento(rs1.getString("dep_ent"));
				}
				
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
					+ " from detalle_transaccion det, producto pro , categoria cat "
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
	public PedidoBean cambiarEstadoPedido(int id) throws Exception {
		PedidoBean ped=null;
		Connection con=MySqlDAOFactory.obtenerConexion();
		
		Statement stmt=con.createStatement();
		String query="update transaccion set est='C' where id='"+id+"'";
		
		int filas = stmt.executeUpdate(query);
		
		if(filas == 1){
			ped= new PedidoBean();
		}
		
		return ped;
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


	@Override
	public String generarNumeroTransaccion() throws Exception {
		// TODO Auto-generated method stub
		
		String num = "";
		
		try{
			Connection con=MySqlDAOFactory.obtenerConexion();
			
			Statement stmt=con.createStatement();
			
			String query = "SELECT NUM FROM transaccion ORDER BY NUM DESC LIMIT 1";
			
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()){
				num = rs.getString("NUM");
			}
			
			
		}catch(Exception e){
			System.out.println("ERROR :"+e.getMessage());
		}
		
		return num;
	}

	
	
	//------------------------------------------------------------------BARBIERI----------------------------------------------------------------------------------------------
	@Override
	public int guardarTransaccion(TransaccionBean transaccion) throws Exception {
		// TODO Auto-generated method stub
		
		int  idGenerado = 0;
		
		try{
			Connection con=MySqlDAOFactory.obtenerConexion();
			Statement stmt=con.createStatement();
			
			String query = "INSERT INTO transaccion (ID_USUARIO,IDE,NUM,EST,FEC_ENT,USU_CREA_REGI,FEC_CREA_REGI,ULT_USU_MOD_REGI,FEC_ULT_MOD_REGI) "
					+ "VALUES ("+transaccion.getId_usuario()+",'"+transaccion.getIde()+"','"+transaccion.getNum()+"','"+transaccion.getEst()+"','"+transaccion.getFec_ent()+"','USER',now(),'USER',now()) ;";
			
			System.out.println("QUERY PARA GUARDAR TRANSACCION ----> "+query);
			
			int filas = stmt.executeUpdate(query);
			
			if(filas == 1){
				
				String query2 = "SELECT ID FROM transaccion ORDER BY ID DESC LIMIT 1";
				
				ResultSet rs = stmt.executeQuery(query2);
				
				while(rs.next()){
					
					idGenerado = rs.getInt("ID");	
					
				}
				
			}
			
		}catch(Exception e){
			
			System.out.println("ERROR :"+e.getMessage());
			
		}
		
		return idGenerado;
	}
	
	@Override
	public boolean guardarPedido(PedidoBean pedido) throws Exception {
		// TODO Auto-generated method stub

		boolean flag = false;
		
		try{
			
			Connection con=MySqlDAOFactory.obtenerConexion();
			Statement stmt=con.createStatement();
			
			
			String query = " INSERT INTO pedido (PED_ID,TIP_ENT,TIPO_PAG,DEP_ENT,PRO_ENT,DIS_ENT,DIR_ENT,REF,TEL_REF_1,TEL_REF_2,EST_ENT,CUO,CAR_ENT) "
					+ " VALUES("+pedido.getId()+",'"+pedido.getTipoEntrega()+"','"+pedido.getTipoPago()+"','"+pedido.getDepartamento()+"','"+pedido.getProvincia()+"','"+pedido.getDistrto().replace("Ã?", "Ñ")+"','"+pedido.getDireccion()+"','"+pedido.getReferencia()+"','"+pedido.getTelefono1()+"','"+pedido.getTelefono2()+"','P',"+pedido.getCuota()+","+pedido.getCargo_entrega()+");";
			
			System.out.println("QUERY PARA GUARDAR PEDIDO ----> "+query);
			
			int filas = stmt.executeUpdate(query);
			
			if(filas == 1){
				flag = true;
			}
			
		}catch(Exception e){
			System.out.println("ERROR :"+e.getMessage());
		}
		
		
		return flag;
	}

	@Override
	public boolean guardarDetallePedido(DetalleTransaccionBean detalle) throws Exception {
		// TODO Auto-generated method stub
		
		boolean flag  = false;
		
		try{
			
			Connection con=MySqlDAOFactory.obtenerConexion();
			Statement stmt=con.createStatement();
			
			String query = " INSERT INTO detalle_transaccion (VEN_ID,PRO_ID,CAN,IMP) "
					+ " VALUES ("+detalle.getVentaId()+","+detalle.getProductoId()+","+detalle.getCantidad()+","+detalle.getImporte()+")";
			
			System.out.println("QUERY PARA GUARDAR DETALLE ----> "+query);
			
			int filas = stmt.executeUpdate(query);
			
			if(filas == 1){
				flag = true;
			}
			
		}catch(Exception e){
			
			System.out.println("ERROR :"+e.getMessage());
			
		}
		
		return flag;
	}

	
	@Override
	public boolean guardarComprobante(ComprobanteBean comprobante) throws Exception {
		// TODO Auto-generated method stub
		
		boolean flag = false;
		
		try{
			
			Connection con=MySqlDAOFactory.obtenerConexion();
			Statement stmt=con.createStatement();
			
			String query = " INSERT INTO comprobante_pago (VEN_ID ,TIPO ,RUC ,RAZ_SOC ,NUM_COM ,IGV ,FEC_EMI ,FEC_CAN ) "
					+ " VALUES ( "+comprobante.getVen_id()+" , '"+comprobante.getTipo()+"','"+comprobante.getRuc()+"','"+comprobante.getRaz_soc()+"','"+comprobante.getNum_com()+"',"+comprobante.getIgv()+","+comprobante.getFec_emi()+","+comprobante.getFec_can()+" )";
			
			System.out.println("QUERY PARA GUARDAR COMPROBANTE ---> "+query);
			
			int filas = stmt.executeUpdate(query);
			
			if(filas == 1){
				System.out.println("SE GUARDO CON EXITO :DDDDD");
				flag = true;
			}
			
			
		}catch(Exception e){
			
			System.out.println("ERROR :"+e.getMessage());
			
		}
		
		return flag;
	}

	@Override
	public String obtenerUltimoNumeroComprobantexTipo(String tipo) throws Exception {
		// TODO Auto-generated method stub
		
		String num_com = "";
		
		try{
			Connection con=MySqlDAOFactory.obtenerConexion();
			Statement stmt=con.createStatement();
			String query = "";
			//String query = "SELECT NUM_COM FROM comprobante_pago WHERE TIPO = '"+tipo+"' ORDER BY NUM_COM DESC LIMIT 1";
			if(tipo.equalsIgnoreCase("boleta")){
				 query = "SELECT NUM_COM FROM comprobante_pago WHERE TIPO = '"+tipo+"' AND substr(NUM_COM,1,2) = 'BV' ORDER BY NUM_COM DESC LIMIT 1";
			}else{
				 query = "SELECT NUM_COM FROM comprobante_pago WHERE TIPO = '"+tipo+"' AND substr(NUM_COM,1,2) = 'FV' ORDER BY NUM_COM DESC LIMIT 1";
			}
			
			System.out.println("QUERY PARA OBTENER EL ULTIMO NUMERO DE COMPROBANTE ---->"+query);
			ResultSet rs = stmt.executeQuery(query);
			
			if(rs.isBeforeFirst()){
				
				if(rs.next()){
					
					num_com = rs.getString("NUM_COM");
					
				}
				
			}
			
			
		}catch(Exception e){
			System.out.println("ERROR :"+e.getMessage());
		}
		
		
		return num_com;
	}

	@Override
	public EmpresaBean buscarEmpresaXUsuario(int id) throws Exception {
		// TODO Auto-generated method stub
		
		EmpresaBean empresa = new EmpresaBean();
		
		try{
			Connection con=MySqlDAOFactory.obtenerConexion();
			Statement stmt=con.createStatement();
			
			String query = "SELECT * FROM empresa WHERE EMP_ID = "+ id;
			
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()){
				
				empresa.setRuc(rs.getString("RUC"));
				empresa.setRazonSocial(rs.getString("RAZ_SOC"));
				
			}
			
			
		}catch(Exception e){
			System.out.println("ERROR :"+e.getMessage());
		}
		
		
		return empresa;
	}

}
