package servlets;

import dao.interfaces.UsuarioDao;

import java.io.IOException;

import beans.UsuarioBean;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import beans.emailBean;
import javax.servlet.ServletContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.mysql.MySql_ProductoDao;
import dao.mysql.MySql_UsuarioDao;

/**
 * Servlet implementation class ServletLogin
 */
@WebServlet("/ServletLogin")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, 	// 2MB
maxFileSize = 1024 * 1024 * 10, 		// 10MB
maxRequestSize = 1024 * 1024 * 50)		// 50MB
public class ServletLogin extends HttpServlet {
	private String host;
	private String port;
	private String user;
	private String pass;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLogin() {
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
		HttpSession misesion=request.getSession();
		String accion=request.getParameter("accion");
		if(accion.equals("cerrarSesion")){
			
			misesion.removeAttribute("usuId");
			misesion.setAttribute("mostrarLogin", "");
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion=request.getParameter("accion");
		if(accion.equals("validarDato")){// validar dato de ingreso al sistema
			String usuario=request.getParameter("usuario");
			String contraseña=request.getParameter("contraseña");
			
			UsuarioDao usuarioDao= new MySql_UsuarioDao();
			UsuarioBean usu=usuarioDao.validarIngreso(usuario, contraseña);

			
			if(usu!=null && usu.getEstado().equals("A") &&  usu.getIntento().equals("validado")){
				
				HttpSession misesion=request.getSession();
				misesion.setAttribute("usuId",usu.getUsuId());
				misesion.setAttribute("mostrarLogin", "no");
				misesion.setAttribute("nombreApellidoPersona", usu.getNombre()+" "+usu.getApellidoPaterno());
				System.out.println("rolllll "+usu.getRolId());
				if(usu.getRolId()==1 ){//rol administrador
					System.out.println("entro 1 rol");
					misesion.setAttribute("nombreApellidoPersonaAdmi", usu.getNombre()+" "+usu.getApellidoPaterno());
					request.getRequestDispatcher("inicio.jsp").forward(request, response);
				}else if(usu.getRolId()==2 ){//rol almacenero
					
				}else if(usu.getRolId()==3 ){//rol carguero
					
				}else if(usu.getRolId()==4 ){//rol proovedor
					
				}else if(usu.getRolId()==5 ){//rol cliente
					request.getRequestDispatcher("home.jsp").forward(request, response);
				}else{
					
				}
			}else if( usu!=null &&  usu.getIntento().equals("1")){
				request.setAttribute("msjError", "Le queda 3 Intentos para iniciar sessión con el usuario: "+usu.getNombreUsu());
				request.getRequestDispatcher("home.jsp").forward(request, response);
			}else if(usu!=null &&  usu.getIntento().equals("2")){
				request.setAttribute("msjError", "Le queda 2 Intentos para iniciar sessión con el usuario: "+usu.getNombreUsu());
				request.getRequestDispatcher("home.jsp").forward(request, response);
			}else if(usu!=null &&  usu.getIntento().equals("3")){
				request.setAttribute("msjError", "Le queda 1 Intento para iniciar sessión con el usuario: "+usu.getNombreUsu());
				request.getRequestDispatcher("home.jsp").forward(request, response);
			}else if(usu!=null &&  usu.getIntento().equals("resetearPass")){
				
				try {
					
					HttpSession misesion=request.getSession();
					String idUsu=misesion.getAttribute("usuId")+"";
					emailBean  usuRes=usuarioDao.buscarCorreo(usu.getCorreo(),idUsu);
				
					if(usuRes!=null ){
						
						EmailUtility.sendEmailWithAttachment(host, port, user, pass,usuRes.getRecipient(), usuRes.getSubject(), usuRes.getContent());
						request.setAttribute("msjError", "Se ha reseteado su contraseña por exceder el maximo de intentos, usuario: "+usu.getNombreUsu());
						request.getRequestDispatcher("home.jsp").forward(request, response);
					}else{
						
						request.setAttribute("msjError", "Hubo un error al resetear contraseña");
						request.getRequestDispatcher("home.jsp").forward(request, response);
					}
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					System.out.println(e.getMessage());
				}

			}else{
				request.setAttribute("msjError", "usuario no encontrado");
				request.getRequestDispatcher("home.jsp").forward(request, response);
			}
			
		}
		if(accion.equals("recuperarCorreo")){
			String correo = request.getParameter("correo");
			try {
				HttpSession misesion=request.getSession();
				String idUsu=misesion.getAttribute("usuId")+"";
				UsuarioDao usuarioDao= new MySql_UsuarioDao();
				emailBean  usu=usuarioDao.buscarCorreo(correo,idUsu);
			
				if(usu!=null ){
					
					EmailUtility.sendEmailWithAttachment(host, port, user, pass,usu.getRecipient(), usu.getSubject(), usu.getContent());
					request.setAttribute("msjError", "Se envió correctamente la nueva contraseña a su correo");
					request.getRequestDispatcher("home.jsp").forward(request, response);
				}else{
					
					request.setAttribute("msjError", "Correo incorrecto o no registrado");
					request.getRequestDispatcher("home.jsp").forward(request, response);
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println(e.getMessage());
			}
		}
		
		
		
	}

}
