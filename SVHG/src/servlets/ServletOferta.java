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
		
		/*PrintWriter out = response.getWriter();
		String action=request.getParameter("action");
				
		System.out.println("Disponibilidad");
		DAOFactory dao = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
		ProductoDao productodao = dao.getProductoDao();
		
		if(action.equalsIgnoreCase("Agregar")){
		System.out.println("agregar");
		int size=Integer.parseInt(request.getParameter("size"));
		String[] idCursos=new String[size];
		int llenos=0;
		for(int i=0;i<=size;i++){
			
			if(request.getParameter("check"+i+"")!=null){
			System.out.println(request.getParameter("check"+i+""));
			idCursos[llenos]=request.getParameter("check"+i+"");
			llenos++;
			}
			
			if(llenos==0){
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Seleccione al menos un curso.');");
				out.println("location='Gestionar_Docente?f=SeleccionarDocente'");
				out.println("</script>");
			}
			
		}
		String[] cursos=new String[llenos];
		
		for(int j = 0; j < cursos.length; j++) {
		      cursos[j] = idCursos[j];
		}
		
		try {
			if(.regDocente().guardarCursosAptos(cursos, idPer)){
			response.sendRedirect("Gestionar_Docente?f=SeleccionarDocente");
			System.out.println("dio");
			}else{
				System.out.println("no dio wey");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		
		
		if(action.equalsIgnoreCase("Eliminar")){
			System.out.println("Eliminar");
			int size=Integer.parseInt(request.getParameter("sizeE"));
			String[] idCursos=new String[size];
			int llenos=0;
			for(int i=0;i<=size;i++){
				
				if(request.getParameter("checkE"+i+"")!=null){
				System.out.println(request.getParameter("checkE"+i+""));
				idCursos[llenos]=request.getParameter("checkE"+i+"");
				llenos++;
				}
				
				if(llenos==0){
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Seleccione al menos un curso.');");
					out.println("location='Gestionar_Docente?f=SeleccionarDocente'");
					out.println("</script>");
				}
				
			}
			String[] cursos=new String[llenos];
			
			for(int j = 0; j < cursos.length; j++) {
			      cursos[j] = idCursos[j];
			}
			*/
			/*try {
				if(regdoce.regDocente().eliminarCursosAptos(cursos, idPer)){
				response.sendRedirect("Gestionar_Docente?f=SeleccionarDocente");
				System.out.println("dio");
				}else{
					System.out.println("no dio wey");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
			
		}
		

}
