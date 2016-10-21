package dao.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import beans.BoletaBean;
import dao.interfaces.ComprobanteDao;
import daofactory.MySqlDAOFactory;

public class MySql_ComprobanteDao extends MySqlDAOFactory implements ComprobanteDao{

	@Override
	public ArrayList<BoletaBean> buscarComprobanteGenerado(String numeroTransaccion) {
		// TODO Auto-generated method stub
		
		ArrayList<BoletaBean> boleta = new ArrayList<BoletaBean>();
		
		try{
			
			Connection con=MySqlDAOFactory.obtenerConexion();
			Statement stmt=con.createStatement();
			
			String query =
							"SELECT                                                      "+
							"	tr.NUM AS NUMERO_TRANSACCION,                            "+
							"	CONCAT(pe.APE_PAT,' ',pe.APE_PAT,' ',pe.NOM) AS NOMBRE_CLIENTE,  "+
							"    DATE_FORMAT(cp.FEC_EMI,'%d-%m-%Y') AS FECHA_EMISION,    "+
							"    DATE_FORMAT(cp.FEC_CAN,'%d-%m-%Y') AS FECHA_CANCELACION,"+
							"	CASE                                                     "+
							"		WHEN p.TIP_ENT= 'EC' THEN 'DOMICILIO'                "+
							"		WHEN p.TIP_ENT= 'RL' THEN 'LOCAL'                    "+
							"	END AS TIPO_ENTREGA,                                     "+
							"    p.TIPO_PAG AS TIPO_PAGO,                                "+
							"	DATE_FORMAT(tr.FEC_ENT,'%d-%m-%Y') AS FECHA_ENTREGA,     "+
							"	p.DEP_ENT AS DEPARTAMENTO,                               "+
							"	p.PRO_ENT AS PROVINCIA,                                  "+
							"	REPLACE(p.DIS_ENT,'Ã','Ñ') AS DISTRITO,                  "+
							"	p.DIR_ENT AS DIRECCION,                                  "+
							"	pr.CODPRO AS CODIGO_PRODUCTO,                            "+
							"	pr.NOM AS NOMBRE_PRODUCTO,                                        "+
							"	pr.PRE AS PRECIO,                                        "+
							"	dt.CAN AS CANTIDAD,                                      "+
							"	ROUND((dt.IMP/1.19),2) AS IMPORTE,                       "+
							"   of.DSC AS DESCUENTO                                      "+
							"FROM                                                        "+
							"	transaccion tr                                           "+
							"    INNER JOIN comprobante_pago cp ON tr.ID = cp.VEN_ID     "+
							"    INNER JOIN detalle_transaccion dt ON tr.ID = dt.VEN_ID  "+
							"	INNER JOIN usuario us ON tr.ID_USUARIO = us.ID           "+
							"	INNER JOIN persona pe ON us.PER_ID = pe.ID               "+
							"    INNER JOIN pedido p ON tr.ID = p.PED_ID                 "+
							"	INNER JOIN producto pr ON dt.PRO_ID = pr.ID              "+
							"	LEFT JOIN detalle_oferta df ON pr.ID = df.PRO_ID         "+
							"    LEFT JOIN ofertas of ON of.ID =df.OFE_ID                "+
							"                                                            "+
							"WHERE                                                       "+
							"	tr.NUM = '"+numeroTransaccion+"';                            ";
			
			
			System.out.println("QUERY EN EJECUCION PARA BOLETA ----> " + query);
			
			ResultSet rs = stmt.executeQuery(query);
			
			BoletaBean detalleB = null;
			
			while(rs.next()){
				detalleB = new BoletaBean();
				detalleB.setNum_com(rs.getString("NUMERO_TRANSACCION"));
				detalleB.setNom_cli(rs.getString("NOMBRE_CLIENTE"));
				detalleB.setFec_emi(rs.getString("FECHA_EMISION"));
				detalleB.setTip_ent(rs.getString("TIPO_ENTREGA"));
				detalleB.setFec_ent(rs.getString("FECHA_ENTREGA"));
				detalleB.setDep(rs.getString("DEPARTAMENTO"));
				detalleB.setPro(rs.getString("PROVINCIA"));
				detalleB.setDis(rs.getString("DISTRITO"));
				detalleB.setDir(rs.getString("DIRECCION"));
				detalleB.setCod_pro(rs.getString("CODIGO_PRODUCTO"));
				detalleB.setNom_pro(rs.getString("NOMBRE_PRODUCTO"));
				detalleB.setPre(rs.getDouble("PRECIO"));
				detalleB.setCan(rs.getInt("CANTIDAD"));
				detalleB.setImporte(rs.getDouble("IMPORTE"));
				detalleB.setDescuento(rs.getDouble("DESCUENTO"));
				boleta.add(detalleB);
				
			}
			
			
		}catch(Exception e){
			
			System.out.println("ERROR -----> "+e.getMessage());
			
		}
		
		return boleta;
	}

	@Override
	public String obtenerCorreo(int id) {
		// TODO Auto-generated method stub
		
		String correo = "";
		
		try{
			
			Connection con=MySqlDAOFactory.obtenerConexion();
			Statement stmt=con.createStatement();
			
			String query = 
					"SELECT                                     "+
							"	COR AS CORREO                           "+
							"FROM                                       "+
							"	contacto c                              "+
							"	INNER JOIN persona p ON p.ID = c.PER_ID "+
							"    INNER JOIN usuario u ON p.ID = u.PER_ID"+
							"WHERE                                      "+
							"	u.ID="+id+";                              ";
			
			ResultSet rs = stmt.executeQuery(query);
			
			if(rs.next()){
				correo = rs.getString("CORREO");
			}
			
		}catch(Exception e){
			
			System.out.println("ERROR ----> "+e.getMessage());
			
		}
		
		
		return correo;
	}

}
