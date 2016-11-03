package dao.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import dao.interfaces.EmpresaDao;
import daofactory.MySqlDAOFactory;
import beans.EmpresaBean;
import beans.PersonaBean;

public class MySQLEmpresaDao extends MySqlDAOFactory implements EmpresaDao {
	
	@Override
	public boolean registrarEmpresa(EmpresaBean empresa) throws Exception {
		System.out.println("metodo registrarEmpresa en msqlEmpresadao 0");
		boolean flag = false;
		
		try {
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt= con.createStatement();

			System.out.println("metodo registrarEmpresa en msqlEmpresadao 1");
			String queryEmpresa="insert into empresa (emp_id,ide, ruc, raz_soc, usu_crea_regi, fec_crea_regi, ult_usu_mod_regi, fec_ult_mod_regi) "
			+ " VALUES ('"+empresa.getEmp_ide()+"','"+empresa.getIde()+"','"+empresa.getRuc()+"','"+empresa.getRazonSocial()+"','USER',now(), 'USER',now())";
			System.out.println("metodo registrarEmpresa en msqlEmpresadao 2");
			System.out.println("queryEmpresa: "+queryEmpresa);
			int filas = stmt.executeUpdate(queryEmpresa);
			if(filas>0){
				System.out.println("metodo registrarEmpresa en msqlEmpresadao 3");
				flag=true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());

		}
			
			return flag;
	}

	
	@Override
	public EmpresaBean buscarEmpresa(int id) throws Exception {
		EmpresaBean empresa = null;
		try {
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt = con.createStatement();
		System.out.println("usaurio id: "+id);
	
		String query = "select e.ruc,e.raz_soc from empresa e where e.emp_id='"+id+"'";
			ResultSet rs = stmt.executeQuery(query);
		
			if(rs.next()){
				empresa = new EmpresaBean();
				empresa.setRuc(rs.getString("ruc"));
				empresa.setRazonSocial(rs.getString("raz_soc"));
			}	
			con.close();
		} catch (Exception e) {
			System.out.println("ERROR de BuscarEmpresa en MysqlEmpresa.java");
			System.out.println(e.getMessage());
		}
		return empresa;
	}

	


}
