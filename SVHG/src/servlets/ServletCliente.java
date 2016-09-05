package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.interfaces.EmpresaDao;
import dao.interfaces.PersonaDao;
import dao.mysql.MySQLEmpleadoDao;
import daofactory.DAOFactory;
import beans.EmpresaBean;
import beans.PersonaBean;

import util.ResponseObject;


/**
 * Servlet implementation class ServletCliente
 */
@WebServlet("/ServletCliente")
public class ServletCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCliente() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String accion=request.getParameter("accion");
		
		boolean flag=false;
		boolean flagEmpresa=false;
		if(accion.equals("registrarCliente")){		
			try {
				
				String tipo=request.getParameter("optradio");
				PersonaBean persona = new PersonaBean();
				DAOFactory dao= DAOFactory.getDaoFactory(DAOFactory.MYSQL);
				PersonaDao ipersonadao = dao.getPersonaDAO();
				
				persona.setDni(request.getParameter("txt_dni"));
				persona.setNombre( request.getParameter("txt_nombre") );
				persona.setApellidoPaterno(request.getParameter("txt_apepat"));
				persona.setApellidoMaterno(request.getParameter("txt_apemat"));
				persona.setPass(request.getParameter("txtClave"));
				persona.setCorreo(request.getParameter("txtCorreo"));
				persona.setTelefono(request.getParameter("txtCelular"));
				
				flag = ipersonadao.registrarCliente(persona);
				
				if(tipo.equalsIgnoreCase("empresa")){
					//---------------BUSCAR POR CORREO Y DNI---------------------------------
					System.out.println("asdada2");
					DAOFactory daoID = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
					PersonaDao iidpersonadao= daoID.getPersonaDAO() ;
					PersonaBean id = iidpersonadao.buscarXCorreo(request.getParameter("txtCorreo"), Integer.parseInt(request.getParameter("txt_dni")));
					//------------------------------------------------------------------------
					EmpresaBean empresa = new EmpresaBean();
					DAOFactory daoEmpresa= DAOFactory.getDaoFactory(DAOFactory.MYSQL);
					EmpresaDao iempresadao = daoEmpresa.getEmpresaDAO();
					
					empresa.setEmp_ide(String.valueOf(id.getId()));
					empresa.setIde("C");
					empresa.setRazonSocial(request.getParameter("txtRazon"));
					empresa.setRuc(request.getParameter("txtRuc"));
					empresa.setPais("PERU");
				
					System.out.println("asd"+request.getParameter("txtRuc")+":asdas:"+request.getParameter("txtRazon"));
					flagEmpresa=iempresadao.registrarEmpresa(empresa);
				}
				System.out.println("Flag persona :"+flag);
				System.out.println("Flag empresa :"+flagEmpresa);
				
				if(flag){		
					System.out.println("7");
					    ResponseObject responseobj=null;
						responseobj=new ResponseObject();
						response.setContentType("application/json");
						response.setCharacterEncoding("UTF-8");
						responseobj.setSuccess(true);
						responseobj.setObject(persona);
						response.getWriter().write(new Gson().toJson(responseobj));
						System.out.println("json" + new Gson().toJson(responseobj));
				}		
			} catch (Exception e) {
				// TODO: handle exception
			}
		}	
		
		if(accion.equals("buscarCorreo")){		
			try {
				PersonaBean persona = new PersonaBean();
				DAOFactory dao= DAOFactory.getDaoFactory(DAOFactory.MYSQL);
				PersonaDao ipersonadao = dao.getPersonaDAO();
				System.out.println("entro buscar correo");
				persona.setCorreo(request.getParameter("txtCorreo"));
				flag = ipersonadao.buscarCorreo(request.getParameter("txtCorreo"));
				System.out.println(request.getParameter("txtCorreo"));
				System.out.println("Flag buscar correo :"+flag);
				if(flag){		
				
					    ResponseObject responseobj=null;
						responseobj=new ResponseObject();
						response.setContentType("application/json");
						response.setCharacterEncoding("UTF-8");
						responseobj.setSuccess(true);
						responseobj.setObject(persona);
						response.getWriter().write(new Gson().toJson(responseobj));
						System.out.println("json" + new Gson().toJson(responseobj));
				}		
			} catch (Exception e) {
				// TODO: handle exception
			}
		}	
	}

}
