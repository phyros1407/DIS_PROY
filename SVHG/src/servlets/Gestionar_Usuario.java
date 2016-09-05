package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import util.ResponseObject;
import beans.UsuarioBean;
import dao.interfaces.UsuarioDao;
import daofactory.DAOFactory;

/**
 * Servlet implementation class Gestionar_Proveedor
 */
@WebServlet("/Gestionar_Usuario")
public class Gestionar_Usuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Gestionar_Usuario() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		if(request.getParameter("accion")!=null){
			String accion=request.getParameter("accion");
			if(accion.equalsIgnoreCase("detalle")){
				int id = Integer.parseInt(request.getParameter("id"));
				int cargo=Integer.parseInt(request.getParameter("cargo"));
				System.out.println(cargo);
				DAOFactory dao = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
				UsuarioDao usuariodao = dao.getUsuarioDao();
				
				try{
					UsuarioBean usuario = usuariodao.detalle(id,cargo);
					
					ResponseObject responseobj=null;
					if(usuario!=null){
						responseobj=new ResponseObject();
						response.setContentType("application/json");
						response.setCharacterEncoding("UTF-8");
						responseobj.setSuccess(true);
						responseobj.setObject(usuario);
					}
					response.getWriter().write(new Gson().toJson(responseobj));
					System.out.println("json" + new Gson().toJson(responseobj));
					
				
				}catch(Exception e){
					System.out.println(e.getMessage());
				}
			}
		}else{
		try {	
			
			DAOFactory dao = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
			UsuarioDao usuariodao= dao.getUsuarioDao();
			ArrayList<UsuarioBean> usuarios = usuariodao.listarTodos();
			request.setAttribute("usuarios", usuarios);
			
			getServletContext().getRequestDispatcher("/GestionarUsuario.jsp").forward(request, response);	
			
			} catch (Exception e) {
				out.print(e.getMessage());
				// TODO: handle exception
			}
	}
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("llega servlet");
		PrintWriter out = response.getWriter();
		int id_usuario=Integer.parseInt(request.getParameter("idU"));
		String estado=request.getParameter("estado");
		DAOFactory dao = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
		UsuarioDao usuariodao= dao.getUsuarioDao();
		int action=Integer.parseInt(request.getParameter("action"));
		switch(action){
		case 1:
		if(id_usuario>0){
			System.out.println("o: "+estado);
			try {
				if(estado.equalsIgnoreCase("A")){
				if(usuariodao.eliminar(id_usuario,"I")){
					System.out.println("si da eliminar");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Usuario deshabilitado.');");
					out.println("location='Gestionar_Usuario'");
					out.println("</script>");
				}}else{
					if(usuariodao.eliminar(id_usuario,"A")){
						System.out.println("si da eliminar");
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Usuario habilitado.');");
						out.println("location='Gestionar_Usuario'");
						out.println("</script>");
					}	
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}break;
		
		case 2:

		int dni=Integer.parseInt(request.getParameter("txtDNI"));
		try {
			
		
		if(usuariodao.validarDni(dni)){
			out.println("<script type=\"text/javascript\">");
			out.println("alert('El empleado ya está registrado.');");
			out.println("location='Gestionar_Usuario'");
			out.println("</script>");		
		}else{	
		System.out.println("si llega");		
		String contraseña1=request.getParameter("txtContraseña1");
		String contraseña2=request.getParameter("txtContraseña2");				
		try {
					
		if(contraseña1.equals(contraseña2)){
			String nombres=request.getParameter("txtNombres");
			String apePat=request.getParameter("txtApePat");
			String apeMat=request.getParameter("txtApeMat");
			String direccion=request.getParameter("txtDireccion");
			String fechaNac=request.getParameter("dateFecNac");
			int cargo=Integer.parseInt(request.getParameter("selCar"));
			String fechaLab=request.getParameter("dateFecLab");
			String correo=request.getParameter("txtCorreo");
			int telefono=Integer.parseInt(request.getParameter("txtTel"));
			int ruc;String razsoc;
			if(cargo==4){
			ruc=Integer.parseInt(request.getParameter("txtTel"));
			razsoc=request.getParameter("txtRazSoc");
			}else{
			ruc=0;
			razsoc="";
			}
			if(usuariodao.agregar(dni, nombres, apePat, apeMat, direccion, contraseña1,correo,telefono,fechaNac, cargo,ruc,razsoc)){
				System.out.println("Guardó");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Operación realizada correctamente.');");
				out.println("location='Gestionar_Usuario'");
				out.println("</script>");
			};
		}else{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Las contraseñas no coinciden');");
			out.println("location='Gestionar_Usuario'");
			out.println("</script>");
		}
		
		} catch (Exception e) {
			// TODO: handle exception
		}}
		} catch (Exception e) {
			// TODO: handle exception
		}
		break;
		
		case 3:
			String contraN=request.getParameter("txtConN");
			String contraR=request.getParameter("txtConR");
			String correo1=request.getParameter("txtCorreo1");
			int telefono1=Integer.parseInt(request.getParameter("txtTel1"));
			int dnih=Integer.parseInt(request.getParameter("txtDNIH"));
			if(contraN.equals(contraR)){
				if(usuariodao.modificar(contraN,correo1,telefono1,dnih)){
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Cambios realizados correctamente');");
					out.println("location='Gestionar_Usuario'");
					out.println("</script>");
				}
			}else{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Las contraseñas no coinciden');");
				out.println("location='Gestionar_Usuario'");
				out.println("</script>");
			}
			break;
		default: break;
		
		
		
		}
	}
		
	

}
