package servlets;
import beans.ProductoBean;

import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ResponseObject;

import com.google.gson.Gson;
import com.mysql.fabric.xmlrpc.base.Array;

import dao.interfaces.ProductoDao;
import daofactory.DAOFactory;

/**
 * Servlet implementation class Carrito
 */
@WebServlet("/Carrito")
public class Carrito extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Carrito() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DAOFactory dao = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
		ProductoDao productodao = dao.getProductoDao();
		
		String accion=request.getParameter("accion");
		if(accion.equals("addCarrito")){
			
			try {
				ArrayList<ProductoBean> productos = new ArrayList<ProductoBean>();
				ResponseObject carrito=new ResponseObject();
				//carrito = new Gson().toJson(Integer.parseInt(request.getParameter("ide")));
				System.out.println(":OOOO "+carrito);
				for(int i=0;i<2;i++){
					// System.out.println("QUUUUUUUUUUUUUUUUUEEEE??  "+carrito[i]);
				}
				
			//	productos=productodao.traerProducto(carrito);
				
				 ResponseObject responseobj=null;
				if(productos!=null){
					responseobj=new ResponseObject();
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					responseobj.setSuccess(true);
					responseobj.setObject(productos);
				}
				response.getWriter().write(new Gson().toJson(responseobj));
				System.out.println("json" + new Gson().toJson(responseobj));
				
				
				System.out.println("preAgrega Carritoo :D");
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
