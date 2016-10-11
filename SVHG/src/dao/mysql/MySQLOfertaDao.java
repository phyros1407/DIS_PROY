package dao.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import dao.interfaces.OfertaDao;
import dao.interfaces.PersonaDao;
import daofactory.MySqlDAOFactory;
import beans.PersonaBean;
import beans.UsuarioBean;

public class MySQLOfertaDao implements OfertaDao {

	@Override
	public boolean registrarOferta(String[] productoId, double[] productoP, int descuento, String fecIni, String fecFin,
			String horaFin, int cantidad, String fotoOfer) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("registrarOferta");
		try {
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt= con.createStatement();
			Statement stmtS= con.createStatement();
			int maxId=1;
			System.out.println(descuento/100.00);
			String query="insert into ofertas(dsc,fec_ini,fec_fin,hor_fin,can_afe,FOTO,USU_CREA_REGI,FEC_CREA_REGI,ULT_USU_MOD_REGI,FEC_ULT_MOD_REGI) "+
					"VALUES ("+(descuento/100.00)+",'"+fecIni+"','"+fecFin+"','"+horaFin+":00:00',"+cantidad+",'"+fotoOfer+"','USER','2016-09-29 11:01:16','USER','2016-09-29 11:01:16');";
			
			System.out.println(query);
			
			System.out.println("max id"+maxId);
			
			int filas = stmt.executeUpdate(query);
			if(filas>0){
				String queryS="SELECT max(id) as maxId FROM ofertas;";
				
				ResultSet rs=stmtS.executeQuery(queryS);
				while(rs.next()){
					maxId=Integer.parseInt(rs.getString("maxid"));
				}			
				System.out.println("dio primer insert");
				System.out.println("cantidad de productos "+productoId.length);
				
				for(int i=1;i<=productoId.length;i++){
					
					System.out.println("entra al for");
					Connection con1 = MySqlDAOFactory.obtenerConexion();
					Statement stmt1= con1.createStatement();
					System.out.println(cantidad+" "+descuento);
					double impAfe=(productoP[i-1])*cantidad*descuento/100;
					System.out.println("importe afectado"+impAfe);
					String query1="insert into detalle_oferta(OFE_ID,PRO_ID,IMP_AFE,USU_CREA_REGI,FEC_CREA_REGI,ULT_USU_MOD_REGI,FEC_ULT_MOD_REGI)"
							+"VALUES("+maxId+","+productoId[i-1]+",images/"+impAfe+",'USER','2016-09-29 11:01:16','USER','2016-09-29 11:01:16');";
					System.out.println(query1);
					int filas1=stmt1.executeUpdate(query1);
					if(filas1>0){
						System.out.println("dio insert");
					}else{
						System.out.println("fallo un insert");
						return false;
					}
				}
				return true;
			}
			}
			catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
				System.out.println("error");
			}
		
		return false;
	}




}
