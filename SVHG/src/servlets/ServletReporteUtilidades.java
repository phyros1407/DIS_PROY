package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.DetalleTransaccionBean;
import beans.ProductoBean;
import dao.interfaces.DetalleTransaccionDao;
import dao.interfaces.ProductoDao;
import daofactory.DAOFactory;

/**
 * Servlet implementation class ServletReporteVentas
 */
@WebServlet("/ServletReporteUtilidades")
public class ServletReporteUtilidades extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletReporteUtilidades() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("ServletServletReporteVentas get");
		DAOFactory dao = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
		ProductoDao productodao = dao.getProductoDao();

			try {
				
				ArrayList<ProductoBean> productos = new ArrayList<ProductoBean>();
				productos = productodao.listarTodos();
				request.setAttribute("productos", productos);
				getServletContext().getRequestDispatcher("/reportarUtilidades.jsp").forward(request, response);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ServletReporteUtilidades");
		String accion=request.getParameter("accion");
		System.out.println("accion: "+accion);
		if(accion.equals("reporte1")){		
			try {
				DetalleTransaccionBean detalleTransaccion = new DetalleTransaccionBean();
				DAOFactory dao= DAOFactory.getDaoFactory(DAOFactory.MYSQL);
				DetalleTransaccionDao idetalleTransacciondao = dao.geDetalleTransaccionDao();
				String anio=request.getParameter("anio");
				System.out.println("Anio: "+anio);
				int idProducto=Integer.parseInt(request.getParameter("producto"));
				System.out.println("Producto: "+idProducto);
			
				ArrayList<DetalleTransaccionBean> listaDetalleTransaccion = idetalleTransacciondao.listarReporte2(anio, idProducto) ;
				request.setAttribute("listaDetalle", listaDetalleTransaccion);
				  
		
				
				
				/*	ResponseObject responseobj=null;
				if(listaDetalleTransaccion!=null){
					responseobj=new ResponseObject();
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					responseobj.setSuccess(true);
					responseobj.setObject(listaDetalleTransaccion);
				}
				response.getWriter().write(new Gson().toJson(responseobj));
				System.out.println("json" + new Gson().toJson(responseobj));*/
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			getServletContext().getRequestDispatcher("/reporteUtilidades.jsp").forward(request, response);
		}
		
		
		
	}

}
