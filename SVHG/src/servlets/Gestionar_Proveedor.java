package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import util.ResponseObject;
import beans.ProveedorBean;
import dao.interfaces.ProveedorDao;
import daofactory.DAOFactory;

/**
 * Servlet implementation class Gestionar_Proveedor
 */
@WebServlet("/Gestionar_Proveedor")
public class Gestionar_Proveedor extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Gestionar_Proveedor() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion = request.getParameter("accion");
		
		if(accion.equals("listar")){
			try {
				
			
			DAOFactory dao = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
			ProveedorDao iproveedordao= dao.getProveedorDao();
			ArrayList<ProveedorBean> proveedores = iproveedordao.listarTodos();
			request.setAttribute("proveedores", proveedores);
			request.getRequestDispatcher("/GestionarProveedor.jsp").forward(request, response);	
			} catch (Exception e) {
				// TODO: handle exception
			}
		}else if(accion.equals("eliminar")){
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
