package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.ProductoBean;
import dao.interfaces.OfertaDao;
import dao.interfaces.ProductoDao;
import daofactory.DAOFactory;

/**
 * Servlet implementation class ServletOferta
 */
@WebServlet("/ServletOferta")
public class ServletOferta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletOferta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		DAOFactory dao = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
		ProductoDao productodao = dao.getProductoDao();
		
		try {
			
			ArrayList<ProductoBean> productos = new ArrayList<ProductoBean>();
			productos = productodao.listarTodos();
			request.setAttribute("productos", productos);
			getServletContext().getRequestDispatcher("/AsignarOferDes.jsp").forward(request, response);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		
		PrintWriter out = response.getWriter();		
		System.out.println("Gurdar oferta");
		DAOFactory dao = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
		OfertaDao ofertadao = dao.getOfertaDAO();
		int descuento=Integer.parseInt(request.getParameter("oferta"));
		String fecIni=request.getParameter("dateD");
		String fecFin=request.getParameter("dateH");
		String horaFin=request.getParameter("horaOfer");
		int cantidad=Integer.parseInt(request.getParameter("txtCan"));
		String fotoOfer=request.getParameter("fotoOfer");
		
		
		System.out.println("agregar");
		int size=Integer.parseInt(request.getParameter("sizeP"));
		System.out.println(size);
		String[] idProducto=new String[size];
		double[] prProducto=new double[size];
		int llenos=0;
		for(int i=1;i<=size;i++){
			if(request.getParameter("ofertasAID"+i+"")!=null){
				
			System.out.println(request.getParameter("ofertasAID"+i+""));
			idProducto[llenos]=request.getParameter("ofertasAID"+i+"");
			prProducto[llenos]=Double.parseDouble(request.getParameter("ofertasAP"+i+""));
			llenos=llenos+1;
			System.out.println(llenos);
			}			
		}

		if(llenos==0){
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Seleccione al menos un producto.');");
			out.println("location='ServletOferta'");
			out.println("</script>");
		}
		String[] productoId=new String[llenos];
		double[] productoPr=new double[llenos];
		
		for(int j = 0; j < productoId.length; j++) {
			productoId[j] = idProducto[j];
			productoPr[j] = prProducto[j];
			System.out.println("llenando segundos vectores");
		}
		
		try {
			if(ofertadao.registrarOferta(productoId,productoPr,descuento,fecIni,fecFin,horaFin,cantidad,fotoOfer)){
				out.println("<script type=\"text/javascript\">");
				out.println("alert('La oferta se guardó satisfactoriamente');");
				out.println("location='ServletOferta'");
				out.println("</script>");
			System.out.println("dio");
			}else{
				System.out.println("no dio wey");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
