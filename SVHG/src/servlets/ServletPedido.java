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
			
			if(accion.equals("listarPedidos")){
			
				String estado=request.getParameter("estado");
				
				try {
					ArrayList<PedidoBean> pedidos=pedidoDao.listarPedidos(idUsuario,estado);
					
					if(pedidos!=null){
						ArrayList<PedidoBean> productos=pedidoDao.listarProductosPedido();
						if(productos!=null){
							request.setAttribute("pedidos", pedidos);
							request.setAttribute("productos", productos);
							if(estado.equalsIgnoreCase("P")){
								request.setAttribute("estado", "Pendientes");
							}else if(estado.equalsIgnoreCase("R")){
								request.setAttribute("estado", "Recibidos");
							}else if(estado.equalsIgnoreCase("C")){
								request.setAttribute("estado", "Cancelados");
							}
							
							request.getServletContext().getRequestDispatcher("/pedidos.jsp").forward(request, response);
						}
					}
					
					
				} catch (Exception e) {
					System.out.println("fallo listar pedidos: "+e.getMessage());
				}
			}
			if(accion.equals("cancelarPedido")){
				String id=request.getParameter("id");
				
				try {
					PedidoBean pedido=pedidoDao.cambiarEstadoPedido(Integer.parseInt(id));
					
					if(pedido!=null){//cambio estado
						request.getServletContext().getRequestDispatcher("/ServletPedido?accion=listarPedidos&estado=C").forward(request, response);
					}else{//no cambio estado
						
					}
					
					
				} catch (Exception e) {
					System.out.println("fallo cambiar estado pedido eliminado: "+e.getMessage());
				}
			}
			
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession misesion=request.getSession();
		String usuId=misesion.getAttribute("usuId")+"";
		
		
					DAOFactory dao = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
					PedidoDao pedidoDao = dao.getPedidoDAO();
					String accion=request.getParameter("accion");
					
					if(accion!=null){
							if(accion.equals("buscarPedido")){
								String id=request.getParameter("id");
								try {
									ArrayList<PedidoBean> pedidos=pedidoDao.buscarDetallePedido(id);
									
									
										 ResponseObject responseobj=null;
											if(pedidos!=null){
												responseobj=new ResponseObject();
												response.setContentType("application/json");
												response.setCharacterEncoding("UTF-8");
												responseobj.setSuccess(true);
												responseobj.setObject(pedidos);
												
											}
											response.getWriter().write(new Gson().toJson(responseobj));
											System.out.println("json " + new Gson().toJson(responseobj));
											
											
											System.out.println("Detalle del los PEDIDOS !!!");
											
									
									
							 		
								} catch (Exception e) {
									System.out.println("fallo listar pedidos: "+e.getMessage());
								}
							}else if(accion.equals("actualizarPedido")){
								String id=request.getParameter("id");
								try {
									boolean flag=pedidoDao.actualizarEstadoPedido(id);
									
									
										 ResponseObject responseobj=null;
											if(flag!=false){
												responseobj=new ResponseObject();
												response.setContentType("application/json");
												response.setCharacterEncoding("UTF-8");
												responseobj.setSuccess(true);
												responseobj.setObject(flag);
												
											}
											response.getWriter().write(new Gson().toJson(responseobj));
											System.out.println("VERDAD O FALSE? " + new Gson().toJson(responseobj));
	
								} catch (Exception e) {
									System.out.println("fallo listar pedidos: "+e.getMessage());
								}
								
							}
					}
	}

}
