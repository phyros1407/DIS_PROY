package dao.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import beans.PersonaBean;
import dao.interfaces.ClienteDao;
import daofactory.MySqlDAOFactory;

public class MySql_ClienteDao extends MySqlDAOFactory implements ClienteDao {

	@Override
	public ArrayList<PersonaBean> buscarXcriterio(String dato ,int flag) {
		ArrayList<PersonaBean> personas = new ArrayList<PersonaBean>();
		try {
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			String query = "select usu.id,per.id,per.est,per.dni,per.nom,per.ape_pat,per.ape_mat, usu.car_id, per.dir, con.cor, con.tel "
					+ "from persona per "
					+ "inner join usuario usu on per.id= usu.per_id "
					+ "inner join contacto con on per.id=con.per_id "
					+ " where per.est='a' "
					+ "and usu.car_id=5 ";
			
			if(flag==1){
				query+="and per.dni like '%"+dato+"%'; ";
			}else if(flag==2){
				query+="and per.nom like '%"+dato+"%'; ";
			}else{
				query+="and per.ape_pat like '%"+dato+"%' or per.ape_mat like '%"+dato+"%' or"
						+ " concat(per.ape_pat,' ',per.ape_mat) like '%"+dato+"%'; ";
			}
			System.out.println("query: "+query);
			ResultSet rs = stmt.executeQuery(query);
			PersonaBean persona=null;
			while(rs.next()){
				persona=new PersonaBean();
				persona.setId( rs.getInt("per.id") );
				persona.setDni( rs.getString("per.dni") );
				persona.setNombre(rs.getString("per.nom"));
				persona.setApePat( rs.getString("per.ape_pat") );
				persona.setApeMat( rs.getString("per.ape_mat") );
				persona.setDireccion(rs.getString("per.dir"));
				persona.setCorreo(rs.getString("con.cor"));
				persona.setTelefono(rs.getString("con.tel"));
				persona.setIdusuario(rs.getInt("usu.id"));
				personas.add(persona);
				System.out.println(","+ rs.getInt("per.id"));
			}	
			con.close();
		} catch (Exception e) {
			System.out.print("error de buscarxcriterio en MysqlPeersonaDao.java");
		}
		System.out.println("qerasdadad"+ personas);
		return personas;
	}

	@Override
	public PersonaBean datosCliente(int id) throws Exception {
		PersonaBean persona = null;
		try {
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			String query = "select usu.id,per.id,per.est,per.dni,per.nom,per.ape_pat,per.ape_mat, usu.car_id, per.dir, con.cor, con.tel , em.ruc , em.raz_soc "
					+ "from persona per "
					+ "inner join usuario usu on per.id= usu.per_id "
					+ "inner join contacto con on per.id=con.per_id "
					+ "left join empresa em on per.id=em.emp_id "
					+ " where per.est='a' "
					+ "and usu.car_id=5 and per.id="+id+"";
			
			
			System.out.println("query: "+query);
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()){
				persona=new PersonaBean();
				persona.setId( rs.getInt("per.id") );
				persona.setDni( rs.getString("per.dni") );
				persona.setNombre(rs.getString("per.nom"));
				persona.setApePat( rs.getString("per.ape_pat") );
				persona.setApeMat( rs.getString("per.ape_mat") );
				persona.setDireccion(rs.getString("per.dir"));
				persona.setCorreo(rs.getString("con.cor"));
				persona.setTelefono(rs.getString("con.tel"));
				persona.setRuc(rs.getString("em.ruc"));
				persona.setRazonsocial(rs.getString("em.raz_soc"));
				persona.setIdusuario(rs.getInt("usu.id"));
				System.out.println(","+ rs.getInt("per.id"));
			}	
			con.close();
		} catch (Exception e) {
			System.out.print("error de datosCliente en MysqlPeersonaDao.java");
		}
		System.out.println("qerasdadad"+ persona);
		return persona;
	}


	@Override
	public boolean buscarDni(String dni) throws Exception {
		PersonaBean persona = null;
		boolean flag = false;
		try {
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt = con.createStatement();
			String query = "select usu.id,per.id,per.est,per.dni,per.nom,per.ape_pat,per.ape_mat, usu.car_id, per.dir, con.cor, con.tel , em.ruc , em.raz_soc "
					+ "from persona per "
					+ "inner join usuario usu on per.id= usu.per_id "
					+ "inner join contacto con on per.id=con.per_id "
					+ "left join empresa em on per.id=em.emp_id "
					+ " where per.est='a' "
					+ "and per.dni="+dni+"";
			
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next()){
				if(rs.getString("per.dni").equalsIgnoreCase(dni)){
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
