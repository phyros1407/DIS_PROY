package dao.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import beans.BoletaBean;
import beans.ComprobanteBean;
import beans.TransaccionBean;
import dao.interfaces.VentaDao;
import daofactory.MySqlDAOFactory;

public class MySql_VentaDao extends MySqlDAOFactory implements VentaDao {

	@Override
	public boolean registrarVenta(int idUsuario, String numeroTran,
			String fechaEntrega, String[] productoId, int[] productoCantidad,
			double[] productoImporte, String tipoFac) throws Exception {
		/**/
		try {
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt= con.createStatement();
			Statement stmtS= con.createStatement();
			int maxId=1;
			
			String query="insert  into transaccion(id_usuario,ide,num,est,fec_ent,usu_crea_regi,fec_crea_regi,ult_usu_mod_regi,fec_ult_mod_regi) "
								 + "values('"+idUsuario+"','V','"+numeroTran+"','P','"+fechaEntrega+"','USER',now(),'USER',now());";
			
			System.out.println("query: "+query);
			int filas = stmt.executeUpdate(query);
			
			if(filas>0){
				String query2="select max(id) as maxid from transaccion;";
				ResultSet rs=stmtS.executeQuery(query2);
				while(rs.next()){
					maxId=Integer.parseInt(rs.getString("maxid"));
				}
				
			/*Statement stmt2= con.createStatement();
				String query3="(VEN_ID,TIPO,RUC,RAZ_SOC,NUM_COM,IGV,FEC_CAN,USU_CREA_REGI,FEC_CREA_REGI,ULT_USU_MOD_REGI,FEC_ULT_MOD_REGI)"
								+ "VALUES("+maxId+","+tipoFac+","+ruc+","+razon+","+numCom+","+igv+","+fechaEntrega+",'USER',now(),'USER',now());";
				stmt2.executeUpdate(query3);*/
				
				
				
				for(int i=0;i<productoId.length;i++){
					
					System.out.println("entra al for: "+productoId.length);
					Connection con1 = MySqlDAOFactory.obtenerConexion();
					Statement stmt1= con1.createStatement();
					//System.out.println(cantidad+" "+descuento);
					//double impAfe=(productoP[i-1])*cantidad*descuento/100;
					//System.out.println("importe afectado"+impAfe);
					System.out.println("llega al query 4");
					String query4="insert into detalle_transaccion(ven_id, pro_id, can, imp, usu_crea_regi, fec_crea_regi, ult_usu_mod_regi, fec_ult_mod_regi)"
														+"values("+maxId+","+productoId[i]+","+productoCantidad[i]+","+productoImporte[i]+",'USER',now(),'USER',now());";
					System.out.println("query4: "+query4);
					int filas1=stmt1.executeUpdate(query4);
					if(filas1>0){
						System.out.println("dio insert");
					}else{
						System.out.println("fallo un insert");
						return false;
					}
				}
				return true;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return false;
	}

	
	@Override
	public String generarNumeroTransaccion(String num) throws Exception {
		// TODO Auto-generated method stub
		
		
		
		try{
			Connection con=MySqlDAOFactory.obtenerConexion();
			
			Statement stmt=con.createStatement();
			
			String query = "select num from transaccion order by num desc limit 1";
			
			ResultSet rs = stmt.executeQuery(query);
			TransaccionBean trans=null;
			while(rs.next()){
				trans= new TransaccionBean();
				num = rs.getString("num");
				
				trans.setNum(num);
				
			}
			
			
		}catch(Exception e){
			e.getMessage();
		}
		
		return num;
	}
	
	
	@Override
	public boolean guardarComprobante(ComprobanteBean comprobante) throws Exception {
		// TODO Auto-generated method stub
		
		boolean flag = false;
		int maxId=1;
		try{
			
			Connection con=MySqlDAOFactory.obtenerConexion();
			Statement stmt=con.createStatement();
			/*Statement stmtS=con.createStatement();
			
				String query2="select max(id) from transaccion;";
				ResultSet rs=stmtS.executeQuery(query2);
				while(rs.next()){
					maxId=Integer.parseInt(rs.getString("maxid"));
				}*/
				
			String query = " insert into comprobante_pago (ven_id ,tipo ,ruc ,raz_soc ,num_com ,igv ,fec_emi ,fec_can ) "
					+ " values ( (select max(id) from transaccion) , '"+comprobante.getTipo()+"','"+comprobante.getRuc()+"','"+comprobante.getRaz_soc()+"','"+comprobante.getNum_com()+"',"+comprobante.getIgv()+","+comprobante.getFec_emi()+","+comprobante.getFec_can()+" )";
			
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
				 query = "select num_com from comprobante_pago where tipo = '"+tipo+"' and substr(num_com,1,2) = 'BV' order by num_com desc limit 1";
			}else{
				 query = "select num_com from comprobante_pago where tipo = '"+tipo+"' and substr(num_com,1,2) = 'FV' order by num_com desc limit 1";
			}
			
			System.out.println("QUERY PARA OBTENER EL ULTIMO NUMERO DE COMPROBANTE ---->"+query);
			ResultSet rs = stmt.executeQuery(query);
			
			if(rs.isBeforeFirst()){
				
				if(rs.next()){
					
					num_com = rs.getString("num_com");
					
				}
				
			}
			
			
		}catch(Exception e){
			System.out.println("ERROR :"+e.getMessage());
		}
		
		
		return num_com;
	}
	
	
	@Override
	public ArrayList<BoletaBean> buscarComprobanteGenerado(String numeroTransaccion) {
		// TODO Auto-generated method stub
		
		ArrayList<BoletaBean> boleta = new ArrayList<BoletaBean>();
		
		try{
			
			Connection con=MySqlDAOFactory.obtenerConexion();
			Statement stmt=con.createStatement();
			
			String query="select  tr.num as numero_transaccion,                            	"
					+ " concat(pe.ape_pat,' ',pe.ape_mat,' ',pe.nom) as nombre_cliente,      "
					+ "	cp.tipo as tipo_comprobante,								   "
					+ "   cp.ruc as ruc,                                                 "
					+ "   cp.raz_soc as razon_social,                                    "
					+ "   tr.ide as identificador,                                       "
					+ "date_format(cp.fec_emi,'%d-%m-%Y') as fecha_emision,       "
					+ "date_format(cp.fec_can,'%d-%m-%Y') as fecha_cancelacion,"
					+ "date_format(tr.fec_ent,'%d-%m-%Y') as fecha_entrega,"
					+ "pr.codpro as codigo_producto,     "
					+ "pr.nom as nombre_producto,                                   "
					+ "pr.pre as precio,                                        	"
					+ "dt.can as cantidad, "
					+ "round((dt.imp/1.19),2) as importe,                         "
					+ "of.dsc as descuento                                    "
					+ "from                                                   "
					+ "transaccion tr                                         "
					+ "inner join comprobante_pago cp on tr.id = cp.ven_id    "
					+ "inner join detalle_transaccion dt on tr.id = dt.ven_id "
					+ "inner join usuario us on tr.id_usuario = us.id           "
					+ "inner join persona pe on us.per_id = pe.id                "
					+ "inner join producto pr on dt.pro_id = pr.id             "
					+ "left join detalle_oferta df on pr.id = df.pro_id        "
					+ "left join ofertas of on of.id =df.ofe_id                "
					+ "where                                                   "
					+ "tr.num = '"+numeroTransaccion+"';";
							
			
			System.out.println("QUERY EN EJECUCION PARA BOLETA ----> " + query);
			
			ResultSet rs = stmt.executeQuery(query);
			
			BoletaBean detalleB = null;
			
			while(rs.next()){
				detalleB = new BoletaBean();
				detalleB.setNum_com(rs.getString("numero_transaccion"));
				detalleB.setIde(rs.getString("identificador"));
				detalleB.setNom_cli(rs.getString("nombre_cliente"));
				detalleB.setTip_com(rs.getString("tipo_comprobante"));
				detalleB.setFec_emi(rs.getString("fecha_emision"));
				detalleB.setFec_can(rs.getString("fecha_cancelacion"));
				detalleB.setFec_ent(rs.getString("fecha_entrega"));
				detalleB.setRuc_cli(rs.getString("ruc"));
				detalleB.setRaz_soc(rs.getString("razon_social"));
				//detalleB.setDir(rs.getString("DIRECCION"));
				detalleB.setCod_pro(rs.getString("codigo_producto"));
				detalleB.setNom_pro(rs.getString("nombre_producto"));
				detalleB.setPre(rs.getDouble("precio"));
				detalleB.setCan(rs.getInt("cantidad"));
				detalleB.setImporte(rs.getDouble("importe"));
				detalleB.setDescuento(rs.getDouble("descuento"));
				boleta.add(detalleB);
				
			}
			
			
		}catch(Exception e){
			
			System.out.println("ERROR -----> "+e.getMessage());
			
		}
		
		return boleta;
	}
	
	
	
}
