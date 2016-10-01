package dao.interfaces;

import beans.EmpresaBean;

public interface EmpresaDao {
	public boolean registrarEmpresa(EmpresaBean empresa) throws Exception;
	public EmpresaBean buscarEmpresa(int id) throws Exception;
	
}
