package dao.interfaces;

import java.util.ArrayList;

import beans.PersonaBean;

public interface ClienteDao {
 ArrayList<PersonaBean>  buscarXcriterio(String dato,int flag) throws Exception;
 PersonaBean datosCliente(int id)throws Exception;//
 
 public boolean buscarDni(String dni) throws Exception;
}
