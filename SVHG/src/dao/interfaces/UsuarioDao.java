package dao.interfaces;

import java.util.ArrayList;

import beans.UsuarioBean;
import beans.emailBean;



public interface UsuarioDao {
	public ArrayList<UsuarioBean> listarTodos() throws Exception;
	public boolean eliminar(int id,String estado)throws Exception;
	public boolean agregar(int dni,String nombres,String apePat,String apeMat,String direccion,String contraseña1,
			String correo,int telefono,String fechaNac,int cargo,int ruc,String razsoc)throws Exception;
	public boolean validarDni(int id)throws Exception;
	public boolean actualizar(UsuarioBean usuario) throws Exception;
	public UsuarioBean seleccionarPorRuc(String ruc)throws Exception;
	public UsuarioBean detalle(int id,int cargo);
	public boolean modificar(String contraN,String correo1,int telefono1,int dnih);
	
public UsuarioBean agregarPersona(String dni, String nombre,String apellidoPaterno,String apellidoMaterno,String sexo );
	
	public UsuarioBean validarIngreso(String usuario,String contraseña);
	
	public emailBean buscarCorreo(String correo,String idUsu);
}
