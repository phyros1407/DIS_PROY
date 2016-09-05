package dao.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import dao.interfaces.PersonaDao;
import daofactory.MySqlDAOFactory;
import beans.PersonaBean;

public class MySQLEmpleadoDao implements PersonaDao {


	@Override
	public boolean registrarCliente(PersonaBean persona) throws Exception {
		boolean flag = false;
		
		try {
		Connection con = MySqlDAOFactory.obtenerConexion();
		Statement stmt= con.createStatement();

	
		String queryPersona="INSERT INTO persona (DNI,NOM, APE_PAT, APE_MAT, FEC_NAC, DIR, USU_CREA_REGI, FEC_CREA_REGI, ULT_USU_MOD_REGI, FEC_ULT_MOD_REGI,EST) "
		+ " VALUES ('"+persona.getDni()+"','"+persona.getNombre()+"','"+persona.getApellidoPaterno()+"','"+persona.getApellidoMaterno()+"',"
				+ "  '1994-05-23', 'aerawerwre', 'USER',now(), 'USER',now(),'A')";
		
		int filas = stmt.executeUpdate(queryPersona);
		System.out.println("444");
		if(filas==1){
			String queryIdPersona="select id from persona where DNI='"+persona.getDni()+"'";
			ResultSet rs = stmt.executeQuery(queryIdPersona);
			if(rs.next()){
				int idPer=rs.getInt("id");
				String queryUsuario="insert into usuario (CAR_ID,PER_ID,USU,PAS,EST_ACT,USU_CREA_REGI,FEC_CREA_REGI,ULT_USU_MOD_REGI,FEC_ULT_MOD_REGI)"
						+ "  values ('5','"+idPer+"','"+persona.getNombre().charAt(0)+persona.getApellidoPaterno()+persona.getApellidoMaterno().charAt(0)+"','"+persona.getPass()+"','A', 'USER',now(), 'USER',now())";
				int filas1 = stmt.executeUpdate(queryUsuario);
				if(filas1==1){
					String queryContacto="insert into contacto (PER_ID,COR,TEL) values ('"+idPer+"','"+persona.getCorreo()+"','"+persona.getTelefono()+"')";
					int filas2 = stmt.executeUpdate(queryContacto);
					if(filas2==1){

						flag=true;
					}
					
				}
				
			}
			
		}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return flag;
	}

	@Override
	public PersonaBean buscarXCorreo(String correo, int dni) throws Exception {
		PersonaBean persona = null;
		try {
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			String query = "select p.ID from persona p, contacto c where p.DNI='" +dni+"' and p.ID=c.PER_ID and c.COR='" +correo+"'";
			ResultSet rs = stmt.executeQuery(query);
			
			if(rs.next()){
				persona = new PersonaBean();
				persona.setId(rs.getInt("id") );

			}	
			con.close();
		} catch (Exception e) {
			System.out.print("ERROR de BuscarPorCorreo en MysqlEmpleadoDao.java");
		}
		
		return persona;
	}

	
	@Override
	public boolean buscarCorreo(String correo) throws Exception {
		PersonaBean persona = null;
		boolean flag = false;
		try {
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			String query = "select COR from contacto where COR='"+correo+"'";
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next()){
				if(rs.getString("COR").equalsIgnoreCase(correo)){
					flag = true;
				}
			}
			con.close();
		} catch (Exception e) {
			System.out.println("ERROR de Buscar Correo en MysqlEmpleadoDao.java");
		}
		
		return flag;
	}


}
