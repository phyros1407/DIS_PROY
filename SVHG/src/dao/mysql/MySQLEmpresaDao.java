package dao.mysql;

import java.sql.Connection;
import java.sql.Statement;

import dao.interfaces.EmpresaDao;
import daofactory.MySqlDAOFactory;
import beans.EmpresaBean;

public class MySQLEmpresaDao extends MySqlDAOFactory implements EmpresaDao {
	
	@Override
	public boolean registrarEmpresa(EmpresaBean empresa) throws Exception {
		System.out.println("metodo registrarEmpresa en msqlEmpresadao 0");
		boolean flag = false;
		
		try {
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt= con.createStatement();

			System.out.println("metodo registrarEmpresa en msqlEmpresadao 1");
			String queryEmpresa="INSERT INTO empresa (EMP_ID,IDE, RUC, RAZ_SOC, USU_CREA_REGI, FEC_CREA_REGI, ULT_USU_MOD_REGI, FEC_ULT_MOD_REGI) "
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

}
