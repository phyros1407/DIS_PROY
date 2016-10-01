package dao.mysql;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.sun.media.sound.SimpleSoundbank;

import beans.UsuarioBean;
import beans.PersonaBean;
import beans.ProveedorBean;
import dao.interfaces.UsuarioDao;
import daofactory.MySqlDAOFactory;
import beans.emailBean;

public class MySql_UsuarioDao extends MySqlDAOFactory implements UsuarioDao {

	@Override
	public ArrayList<UsuarioBean> listarTodos() throws Exception {
		
		ArrayList<UsuarioBean> usuarios=new ArrayList<UsuarioBean>();
		try {
			Connection con=MySqlDAOFactory.obtenerConexion();
			Statement stmt=con.createStatement();
			String query="select u.id as u_id,p.id as p_id,u.est_act,p.DNI, p.nom, p.ape_Pat, p.ape_Mat,r.car from Rol r,Persona p"+
					" inner join Usuario u on u.per_id=p.id where u.car_id=r.ID;";
			ResultSet rs=stmt.executeQuery(query);
			UsuarioBean usuario=null;
			while(rs.next()){
				usuario=new UsuarioBean();
				usuario.setId_usuario(Integer.parseInt(rs.getString("u_id")));
				usuario.setId_persona(Integer.parseInt(rs.getString("p_id")));
				usuario.setDni(rs.getString("p.DNI"));
				usuario.setNombre(rs.getString("p.nom"));
				usuario.setApePat(rs.getString("p.ape_Pat"));
				usuario.setApeMat(rs.getString("p.ape_Mat"));
				usuario.setRol(rs.getString("r.car"));
				usuario.setEstado(rs.getString("u.est_act"));
				usuarios.add(usuario);
			}
			System.out.println(query);
			con.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("fallo en el metodo listartodos de MySqlPersonaDao");
		}
		return usuarios;
	}

	@Override
	public boolean eliminar(int id,String estado) throws Exception {
		// TODO Auto-generated method stub
		try {
			Connection con=MySqlDAOFactory.obtenerConexion();
			Statement stmt=con.createStatement();
			String query="update usuario set est_act='"+estado+"' where id='"+id+"';";
			int filas=stmt.executeUpdate(query);
			if(filas==1){
				return true;
			}
		}catch (Exception e) {
			// TODO: handle exception
		
		}
		
		return false;
	}

	@Override
	public boolean agregar(int dni,String nombres,String apePat,String apeMat,String direccion,String contraseña1,
			String correo,int telefono,String fechaNac,int cargo,int ruc,String razsoc) throws Exception {
		// TODO Auto-generated method stub
		
		try {
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt= con.createStatement();
			Statement stmt1= con.createStatement();
			Statement stmt2= con.createStatement();
			Statement stmt3= con.createStatement();
			String carL="";
			
			switch(cargo){
			case 1: carL="adm"; break;
			case 2: carL="alm"; break;
			case 3: carL="ven"; break;
			case 4: carL="pro"; break;
			}
			
			String query="insert into persona(dni,nom,ape_pat,ape_mat,fec_nac,est,dir,USU_CREA_REGI,FEC_CREA_REGI,ULT_USU_MOD_REGI,FEC_ULT_MOD_REGI)"+ 
                    "values('"+dni+"','"+nombres+"','"+apePat+"','"+apeMat+"','"+fechaNac+"','A','"+direccion+"','Cristhian','2016-08-31','Cristhian','2016-08-31');";
			String query1="insert into contacto(per_id,cor,tel)"+
					"values((select id from persona where dni='"+dni+"'),'"+correo+"',"+telefono+");";
			
			String query2="insert into empresa(emp_id,ide,ruc,raz_soc,USU_CREA_REGI,FEC_CREA_REGI,ULT_USU_MOD_REGI,FEC_ULT_MOD_REGI)"+
					"values ((select id from persona where dni='"+dni+"'),'P',"+ruc+",'"+razsoc+"','Cristhian','2016-08-31','Cristhian','2016-08-31');";
			
			String query3="insert into usuario(car_id,per_id,usu,pas,est_act,USU_CREA_REGI,FEC_CREA_REGI,ULT_USU_MOD_REGI,FEC_ULT_MOD_REGI) "+
					"values("+cargo+",(select id from persona where dni='"+dni+"'),'"+carL+""+nombres.charAt(0)+""+apePat+""+apeMat.charAt(0)+"','"+contraseña1+"','A','Cristhian','2016-08-26','Cristhian','2016-08-26');";
			
			int filas = stmt.executeUpdate(query);
			if(filas>0){
				int filas1=stmt1.executeUpdate(query1);
				System.out.println(cargo+"cargo");
				System.out.println("contacto agregado...filas1 "+filas1);
				if (filas1>0){
					System.out.println("Entro filas 1");
					int filas3=stmt3.executeUpdate(query3);
					System.out.println("usuario agregado...filas3"+filas3);
					if(cargo==4){
						int filas2=stmt2.executeUpdate(query2);
						if(filas2>0){
						System.out.println("empresa guardada...filas2"+filas2);
					}
					}
					
					if(filas3>0){
						return true;
					}
				}
			}}
			catch (Exception e) {
				// TODO: handle exception
			}
		
		return false;
	}

	@Override
	public boolean validarDni(int id) throws Exception {
		// TODO Auto-generated method stub
		
		try {
			Connection con=MySqlDAOFactory.obtenerConexion();
			Statement stmt=con.createStatement();
			String query="select dni from persona where dni="+id+";";
			ResultSet rs=stmt.executeQuery(query);
			System.out.println("validando");
			UsuarioBean usuario=new UsuarioBean();
			
			while(rs.next()){
				usuario.setDni(rs.getString("dni"));
				System.out.println(usuario.getDni());
				if(usuario!=null){
					System.out.println("no es null");
				return true;
				}
			}
			
			con.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("fallo en el metodo validarDni de MySqlUsuarioDao");
		}
		
		return false;
	}

	@Override
	public boolean actualizar(UsuarioBean usuario) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public UsuarioBean seleccionarPorRuc(String ruc) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UsuarioDao getUsuarioDao() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UsuarioBean detalle(int id,int cargo) {
		// TODO Auto-generated method stub
		UsuarioBean usuario=new UsuarioBean();
		try {
			Connection con=MySqlDAOFactory.obtenerConexion();
			Statement stmt=con.createStatement();
			String query;
			
			if(cargo==4){
			query="select p.DNI,u.USU,r.car,e.raz_soc,e.ruc,c.COR,c.TEL,p.FEC_NAC, p.id as 'P_ID',u.id as 'U_ID',u.PAS "+
						"from Rol r,Persona p,contacto c,usuario u,empresa e where u.car_id=r.ID and c.per_id=p.ID and p.id="+id+" and e.emp_id=p.id and p.id=u.per_id;";
						
			}else{
				query="select p.DNI,u.USU,r.car,c.COR,c.TEL,p.FEC_NAC, p.id as 'P_ID',u.id as 'U_ID',u.PAS " 
						+"from Rol r,Persona p,contacto c,usuario u where u.car_id=r.ID and c.per_id=p.ID and p.id="+id+" and p.id=u.per_id;";
				}
			
			
			ResultSet rs=stmt.executeQuery(query);
			while(rs.next()){
				if(cargo==4){
				usuario.setRuc(Long.parseLong(rs.getString("e.ruc")));
				usuario.setRazSoc(rs.getString("e.raz_soc"));
				}
				usuario.setDni(rs.getString("p.DNI"));
				usuario.setUsuario(rs.getString("u.USU"));				
				usuario.setRol(rs.getString("r.car"));
				usuario.setCorreo(rs.getString("c.COR"));
				usuario.setTelefono(Integer.parseInt(rs.getString("c.TEL")));
				usuario.setFecNac(rs.getString("p.FEC_NAC"));
				usuario.setId_persona(Integer.parseInt(rs.getString("P_ID")));
				usuario.setId_usuario(Integer.parseInt(rs.getString("U_ID")));
				usuario.setContraseña(rs.getString("u.PAS"));
			}
			System.out.println(query);
			con.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("fallo en el metodo detalle de MySqlPersonaDao");
		}
		return usuario;
	}

	@Override
	public boolean modificar(String contraN, String correo1, int telefono1, int dnih) {
		// TODO Auto-generated method stub
		
		try {
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt= con.createStatement();
			Statement stmt1= con.createStatement();
		
		String query="update contacto c,persona p set c.cor='"+correo1+"' ,c.tel="+telefono1+" where p.dni="+dnih+" and p.id=c.per_id;";
		
		String query1="update usuario u,persona p set u.pas='"+contraN+"' where p.dni="+dnih+" and p.id=u.per_id;";           
		int filas = stmt.executeUpdate(query);
		int filas1 = stmt1.executeUpdate(query1);
		
		if(filas>0&&filas1>0){
			return true;
		}
		
		}catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	@Override
	public UsuarioBean agregarPersona(String dni, String nombre,String apellidoPaterno,String apellidoMaterno,String sexo ){
		UsuarioBean usuario=null;

		try {
			//int codigoPersona=generarCodigoPersona()+1;
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt= con.createStatement();
			String  consulta ="INSERT INTO persona (codper,nombres,apellido_paterno,apellido_materno,sexo) "
					+ " VALUES ('"+dni+"','"+nombre+"','"+apellidoPaterno+"', '"+apellidoMaterno+"', '"+sexo+"');";
			int filas = stmt.executeUpdate(consulta);
			if(filas==1){
				usuario=new UsuarioBean();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		return usuario;
	}

	public UsuarioBean validarIngreso(String usuario, String contraseña) {
		// TODO Auto-generated method stub
		UsuarioBean usu=null;
		try {
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt= con.createStatement();
			String  consulta ="select usu.id as idUsu,usu.CAR_ID as ROL_ID ,usu.*,pe.NOM,pe.APE_PAT,co.COR  from usuario usu, persona pe, contacto co "
					+ " where usu='"+usuario+"'  and pe.id=usu.PER_ID and usu.PER_ID=co.PER_ID";
			ResultSet rs = stmt.executeQuery(consulta);
			int idUsu;
			int intento;
			String insertIntento="";
			String validacion="";
			if(rs.next()){
				idUsu=rs.getInt("idUsu");
				intento=rs.getInt("INTENTO");
				
				usu= new UsuarioBean();
				usu.setNombreUsu(rs.getString("usu"));
				usu.setEstado("");
				usu.setCorreo(rs.getString("COR"));
				if(rs.getString("PAS").equalsIgnoreCase(contraseña)){
						insertIntento="UPDATE usuario SET INTENTO='0' , EST_ACT='A' WHERE ID='"+idUsu+"'";
						
						
						usu.setPersonaId(rs.getInt("PER_ID"));
						usu.setUsuId(rs.getInt("idUsu"));
						usu.setRolId(rs.getInt("ROL_ID"));
						usu.setEstado(rs.getString("EST_ACT"));
						usu.setNombreUsu(rs.getString("usu"));
						usu.setIntento("validado");
						usu.setNombre(rs.getString("NOM"));
						usu.setApellidoPaterno(rs.getString("APE_PAT"));
						
				}else{
					System.out.println("no es contrasena");
					
					if(intento==1){
						 insertIntento="UPDATE usuario SET INTENTO='2' WHERE ID='"+idUsu+"'";
						 validacion="2";
						 usu.setIntento(validacion);
					}else if(intento==2){
						 insertIntento="UPDATE usuario SET INTENTO='3' WHERE ID='"+idUsu+"'";
						 validacion="3";
						 usu.setIntento(validacion);
					}else if(intento==3){
						 insertIntento="UPDATE usuario SET INTENTO='0' WHERE ID='"+idUsu+"'";
						validacion="resetearPass";
						usu.setIntento(validacion);
					}else{
						 insertIntento="UPDATE usuario SET INTENTO='1' WHERE ID='"+idUsu+"'";
						 validacion="1";
						 usu.setIntento(validacion);
					}
					
				}
				stmt.executeUpdate(insertIntento);
				
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return usu;
	}

	
	@Override
	public emailBean buscarCorreo(String correo, String idUsu) {
		// TODO Auto-generated method stub
		emailBean usu=null;
	
		try{
			Connection con = MySqlDAOFactory.obtenerConexion();
			Statement stmt= con.createStatement();
			int numAleatorio=(int)Math.floor(Math.random()*(999999-100000)+100000);
			
			String consulta = "select * from contacto where COR='"+correo+"'" ;
			ResultSet rs = stmt.executeQuery(consulta);
			if(rs.next()){
				String contra="update usuario set PAS='"+numAleatorio+"' where id='"+rs.getString("PER_ID")+"'   ";
				int filasP=stmt.executeUpdate(contra);
				if(filasP==1){
					usu=new emailBean();
					String recipient =correo ;
					String subject = "Reseteo de contraseña - NanoSport";
					String content = "Se ha reseteado su contraseña: " +numAleatorio+" .";
					usu.setRecipient(recipient);
					usu.setContent(content);
					usu.setSubject(subject);
				}
				
			}
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return usu;
	}

	@Override
	public String obtenerUsuarioC(int dni) {
		// TODO Auto-generated method stub
		try {
		Connection con=MySqlDAOFactory.obtenerConexion();
		Statement stmt=con.createStatement();
		String query="select u.usu from usuario u,persona p where u.per_id=p.id and p.dni='71020745' and u.car_id<>5;";
		ResultSet rs=stmt.executeQuery(query);
		String usuario="";
		
		while(rs.next()){
			usuario=rs.getString("u.usu");
		}
		return usuario;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return "";
	}
}