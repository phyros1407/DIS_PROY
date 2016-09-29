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

import sun.security.util.Length;
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
				ArrayList Productos = new ArrayList();
				
				String arreglo[]={"10","60","90","45"};
				//ESTO resquiest.getParamteer("ide"); , recibe el arreglo de los productos añadidos al carrito.
				//Problema : recorrerlos
				//String arreglo[]=request.getParameter("ide");
				//System.out.println(":OOOOOO "+arreglo.length +"que estoy recibiendo? "+arregl);
				for(int i=0;i<arreglo.length;i++){
					System.out.println("Producto del carrito :  "+arreglo[i]);
					Productos.add(productodao.traerProducto(arreglo[i]));
					
			};
				//System.out.println("TAMAÑOOOO "+Productos.size());
				 ResponseObject responseobj=null;
				if(Productos!=null){
					responseobj=new ResponseObject();
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					responseobj.setSuccess(true);
					responseobj.setObject(Productos);
					
				}
				response.getWriter().write(new Gson().toJson(responseobj));
				System.out.println("json " + new Gson().toJson(responseobj));
				
				
				System.out.println("preAgrega Carritoo :D");
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.print("ERROOOR ??"+e.getMessage());
			}
		}
	}

}
