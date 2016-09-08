package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import beans.PedidoBean;
import beans.UsuarioBean;
import dao.interfaces.PedidoDao;
import dao.interfaces.ProductoDao;
import dao.interfaces.UsuarioDao;
import dao.mysql.MySql_PedidoDao;
import dao.mysql.MySql_UsuarioDao;
import daofactory.DAOFactory;
import util.ResponseObject;

/**
 * Servlet implementation class ServletPedido
 */
@WebServlet("/ServletPedido")
public class ServletPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPedido() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession misesion=request.getSession();
		String usuId=misesion.getAttribute("usuId")+"";
		int idUsuario=Integer.parseInt(usuId);
		
		DAOFactory dao = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
		PedidoDao pedidoDao = dao.getPedidoDAO();
		if(request.getParameter("accion")!=null){
			String accion=request.getParameter("accion");
			
			if(accion.equals("listarPedidosPendientes")){
				
				try {
					ArrayList<PedidoBean> pedidos=pedidoDao.listarPedidosPendientes(idUsuario);
					
					if(pedidos!=null){
						ArrayList<PedidoBean> productos=pedidoDao.listarProductosPedido();
						if(productos!=null){
							request.setAttribute("pedidos", pedidos);
							request.setAttribute("productos", productos);
							request.setAttribute("estado", "Pendientes");
							request.getServletContext().getRequestDispatcher("/pedidos.jsp").forward(request, response);
						}
					}
					
					
				} catch (Exception e) {
					System.out.println("fallo listar pedidos: "+e.getMessage());
				}
			}
			if(accion.equals("listarPedidosEntregados")){
				
				try {
					ArrayList<PedidoBean> pedidos=pedidoDao.listarPedidosEntregados(idUsuario);
					
					if(pedidos!=null){
						ArrayList<PedidoBean> productos=pedidoDao.listarProductosPedido();
						if(productos!=null){
							request.setAttribute("pedidos", pedidos);
							request.setAttribute("productos", productos);
							request.setAttribute("estado", "Entregados");
							request.getServletContext().getRequestDispatcher("/pedidos.jsp").forward(request, response);
						}
					}
					
					
				} catch (Exception e) {
					System.out.println("fallo listar pedidos: "+e.getMessage());
				}
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
