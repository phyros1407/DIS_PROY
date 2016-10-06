package dao.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import beans.CategoriaBean;
import beans.DetalleTransaccionBean;
import beans.ProductoBean;
import dao.interfaces.DetalleTransaccionDao;
import daofactory.MySqlDAOFactory;

public class MySql_DetalleTransaccionDao implements DetalleTransaccionDao {

	@Override
	public ArrayList<DetalleTransaccionBean> listarReporte1(String año, int productoId) throws Exception {
		
		ArrayList<DetalleTransaccionBean> listaReporte=new ArrayList<DetalleTransaccionBean>();
		
		try {
			Connection con=MySqlDAOFactory.obtenerConexion();
			Statement stmt=con.createStatement();
			
			String query="select cp.fec_can,dt.can as producto "
					+ "from comprobante_pago cp, detalle_transaccion dt "
					+ "where cp.fec_can like '"+año+"'% and cp.ven_id=dt.ven_id and dt.pro_id='"+productoId+"' ";
		
			ResultSet rs=stmt.executeQuery(query);
			DetalleTransaccionBean dTransaccion=null;

			while(rs.next()){
				dTransaccion=new DetalleTransaccionBean();
				dTransaccion.setFc(rs.getString("fc"));
				dTransaccion.setCantidad(rs.getInt("cantidad"));
				listaReporte.add(dTransaccion);
			}
			con.close();
		} catch (Exception e) {
			System.out.println("fallo en el metodo listartodos de MySqlProductoDao");
		}
		return listaReporte;
	}

}
