package dao.interfaces;

import beans.PersonaBean;

public interface PersonaDao {
	public boolean registrarCliente(PersonaBean persona) throws Exception;
	public PersonaBean buscarXCorreo(String correo, int dni)throws Exception;
	public boolean buscarCorreo(String correo)throws Exception;
	
}