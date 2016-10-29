package dao.interfaces;

import beans.PersonaBean;

public interface PersonaDao {
	public String registrarCliente(PersonaBean persona) throws Exception;
	public PersonaBean buscarXCorreo(String correo, int dni)throws Exception;
	public boolean buscarCorreo(String correo)throws Exception;
	public PersonaBean buscarXIdUsuario(int idUsuario)throws Exception;
	public boolean actualizarCliente(PersonaBean persona) throws Exception;
}