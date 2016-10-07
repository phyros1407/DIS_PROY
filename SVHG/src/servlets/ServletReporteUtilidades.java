package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ProductoBean;
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

		
		
		
	}

}
