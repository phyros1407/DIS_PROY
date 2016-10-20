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
					"SELECT                                                                                                         "+
					"	tr.NUM AS NUMERO_TRANSACCION,																				"+
					"	CONCAT(pe.APE_PAT,' ',pe.APE_PAT,' ',pe.NOM) AS NOMBRE_CLIENTE,														"+
					" DATE_FORMAT(cp.FEC_EMI,'%d-%m-%Y') AS FECHA_EMISION,															"+
					"	CASE                                                                                                        "+
					"		WHEN p.TIP_ENT= 'EC' THEN 'DOMICILIO'                                                                   "+
					"		WHEN p.TIP_ENT= 'RL' THEN 'LOCAL'                                                                       "+
					"	END AS TIPO_ENTREGA,                                                                                        "+
					"	DATE_FORMAT(tr.FEC_ENT,'%d-%m-%Y') AS FECHA_ENTREGA,                                                        "+
					"	p.DEP_ENT AS DEPARTAMENTO,                                                                                  "+
					"	p.PRO_ENT AS PROVINCIA,                                                                                     "+
					"	REPLACE(p.DIS_ENT,'Ã','Ñ') AS DISTRITO,                                                                                 "+
					"	p.DIR_ENT AS DIRECCION,                                                                                     "+
					"	pr.CODPRO AS CODIGO_PRODUCTO,                                                                               "+
					"	pr.NOM AS NOMBRE_PRODUCTO,                                                                                           "+
					"	pr.PRE AS PRECIO,                                                                                           "+
					"	dt.CAN AS CANTIDAD,                                                                                         "+
					"	ROUND((dt.IMP/1.19),2) AS IMPORTE                                                                           "+
					"FROM                                                                                                           "+
					"	transaccion tr, comprobante_pago cp, detalle_transaccion dt, usuario us, persona pe, pedido p,producto pr   "+
					"WHERE                                                                                                          "+
					"	tr.ID = cp.VEN_ID AND                                                                                       "+
					"	tr.ID = dt.VEN_ID AND                                                                                       "+
					"	us.ID = tr.ID_USUARIO AND                                                                                   "+
					"	pe.ID = us.PER_ID AND                                                                                       "+
					"	p.PED_ID = tr.ID AND                                                                                        "+
					"	dt.VEN_ID=tr.ID AND                                                                                         "+
					"	dt.PRO_ID=pr.ID AND                                                                                         "+
					"	tr.NUM = '"+numeroTransaccion+"';                                                                           ";
			
			
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
				boleta.add(detalleB);
				
			}
			
			
		}catch(Exception e){
			
			System.out.println("ERROR -----> "+e.getMessage());
			
		}
		
		return boleta;
	}

}
