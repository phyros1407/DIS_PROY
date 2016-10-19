package servlets;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.EnviarArchivos;
/**
 * Servlet implementation class recibe
 */
@WebServlet("/recibe")
public class recibe extends HttpServlet {
	
	private String host;
	private String port;
	private String user;
	private String pass;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public recibe() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() {
 		// reads SMTP server setting from web.xml file
 		ServletContext context = getServletContext();
 		host = context.getInitParameter("host");
 		port = context.getInitParameter("port");
 		user = context.getInitParameter("user");
 		pass = context.getInitParameter("pass");
 	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			try {
				String img=request.getParameter("nombreImg");
				System.out.println("asdasdasd "+img);
				EnviarArchivos.sendEmailWithAttachment(host, port, user, pass, "efrain_alvarez@usmp.pe", "Factura - NanoSports", "prubeba",img);
			} catch (MessagingException e) {
				System.out.println("ERROR AL ENVIAR "+e.getMessage());
				e.printStackTrace();
			}
	}

}
