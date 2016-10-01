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
			String queryIdPersona="select max(p.id) as idPersonaMax from persona p";
			System.out.println("id : "+queryIdPersona);
		 
			ResultSet rs = stmt.executeQuery(queryIdPersona);	
		
		
			if(rs.next()){
				System.out.println("321123: ");
				int idPer=rs.getInt("idPersonaMax");
				//idPer=28;
				System.out.println("idepersona: "+idPer);
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

	@Override
	public PersonaBean buscarXIdUsuario(int idUsuario) throws Exception {
		PersonaBean persona = null;
		try {
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt = con.createStatement();
		System.out.println("usaurio id: "+idUsuario);
	
		String query = "select p.nom,p.ape_pat,p.ape_mat,c.cor,c.tel,u.usu,u.pas from persona p, contacto c ,usuario u where p.id='"+idUsuario+"' and p.id=c.per_id and u.per_id=p.id";
		
		
			ResultSet rs = stmt.executeQuery(query);
			System.out.println("se ejecuto query buscarXIdUsuario");
			if(rs.next()){
				System.out.println("accion : mysql empleado dao2");
				persona = new PersonaBean();
				
				persona.setNombre(rs.getString("nom"));
				persona.setApellidoPaterno(rs.getString("ape_pat"));
				persona.setApellidoMaterno(rs.getString("ape_mat"));
				persona.setCorreo(rs.getString("cor"));
				persona.setTelefono(rs.getString("tel"));
				persona.setPass(rs.getString("pas"));


			}	
			con.close();
		} catch (Exception e) {
			System.out.println("ERROR de BuscarPorIdUsuario en MysqlEmpleadoDao.java");
			System.out.println(e.getMessage());
		}
		
		return persona;
	}

	@Override
	public boolean actualizarCliente(PersonaBean persona) throws Exception {
		boolean flag = false;
		
		try {
		Connection con = MySqlDAOFactory.obtenerConexion();
		Statement stmt= con.createStatement();

		String queryPersona="UPDATE usuario u, contacto c "
				+ "set u.pas='"+persona.getPass()+"', c.tel='"+persona.getTelefono()+"' , c.cor='"+persona.getCorreo()+"'"
						+ "where u.per_id='"+persona.getId()+"' and"
								+ " c.per_id='"+persona.getId()+"' ";
	

		int filas = stmt.executeUpdate(queryPersona);
		System.out.println("444");
		System.out.println(persona.getId());
			if(filas==2){
				flag=true;
			}
			
	
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return flag;
	}


}
