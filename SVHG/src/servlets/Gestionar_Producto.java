package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;

import beans.CategoriaBean;
import beans.ProductoBean;
import dao.interfaces.ProductoDao;
import daofactory.DAOFactory;
import util.ResponseObject;
import util.guardarFoto;

/**
 * Servlet implementation class Gestionar_Producto
 */
@MultipartConfig
@WebServlet("/Gestionar_Producto")
public class Gestionar_Producto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Gestionar_Producto() {
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
				
				if(request.getParameter("accion")!=null){
					String accion=request.getParameter("accion");
					if(accion.equalsIgnoreCase("listarCat")){
						try{
							
							ArrayList<CategoriaBean> categorias = productodao.listarCategorias();
							
							ResponseObject responseobj=null;
							if(categorias!=null){
								responseobj=new ResponseObject();
								response.setContentType("application/json");
								response.setCharacterEncoding("UTF-8");
								responseobj.setSuccess(true);
								responseobj.setObject(categorias);
							}
							response.getWriter().write(new Gson().toJson(responseobj));
							System.out.println("json" + new Gson().toJson(responseobj));
							
							
						}catch(Exception e){
							System.out.println(e.getMessage());
						}
					}else if(accion.equalsIgnoreCase("catalogo")){
						try {
							
							ArrayList<ProductoBean> productos = new ArrayList<ProductoBean>();
							productos = productodao.listarTodos();
							
							
							ResponseObject responseobj=null;
							if(productos!=null){
								responseobj=new ResponseObject();
								response.setContentType("application/json");
								response.setCharacterEncoding("UTF-8");
								responseobj.setSuccess(true);
								responseobj.setObject(productos);
							}
							response.getWriter().write(new Gson().toJson(responseobj));
							System.out.println("json" + new Gson().toJson(responseobj));
							
							
							System.out.println("funciona el ajax");
							
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					
				}else{
					try {
						
						ArrayList<ProductoBean> productos = new ArrayList<ProductoBean>();
						productos = productodao.listarTodos();
						request.setAttribute("productos", productos);
						getServletContext().getRequestDispatcher("/GestionarProducto/GestionarProducto.jsp").forward(request, response);
						
						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					
					
					
					
				}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String accion = request.getParameter("accion");
		System.out.println(accion);
		
		DAOFactory dao = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
		ProductoDao productodao = dao.getProductoDao();
		
		if(accion.equalsIgnoreCase("habi")){
			
			int id = Integer.parseInt(request.getParameter("idA"));

			try{
				
				
		
				if(productodao.habilitar(id)){
					System.out.println("habilita");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('el producto ha sido habilitado');");
					out.println("location='Gestionar_Producto'");
					out.println("</script>");
					
				}else{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Error, el producto no ha sido habilitado');");
					out.println("location='Gestionar_Producto'");
					out.println("</script>");
				}
				
				
				
				
				
			
				
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
			
			
		}
		
		
		
		if(accion.equalsIgnoreCase("desa")){
			
			int id = Integer.parseInt(request.getParameter("idI"));
			
			try{
				
				
				
				if(productodao.desabilitar(id)){
		
					System.out.println("deshabilitar");
					out.println("<script type=\"text/javascript\">");
					out.println("alert('el producto ha sido deshabilitado');");
					out.println("location='Gestionar_Producto'");
					out.println("</script>");
					
				}else{
					
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Error, el producto no ha sido deshabilitado');");
					out.println("location='Gestionar_Producto'");
					out.println("</script>");
				}
				
				
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
			
			
		}
		
		
		if(accion.equalsIgnoreCase("buscar")){
			int id = Integer.parseInt(request.getParameter("id"));
		
			
			try{
				ProductoBean producto = productodao.buscar(id);
				
				ResponseObject responseobj=null;
				if(producto!=null){
					responseobj=new ResponseObject();
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					responseobj.setSuccess(true);
					responseobj.setObject(producto);
				}
				response.getWriter().write(new Gson().toJson(responseobj));
				System.out.println("json" + new Gson().toJson(responseobj));
			
			
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
		}
		
		
		
		if(accion.equalsIgnoreCase("grabar")){
			
			String nompro = request.getParameter("nompro");
			
			double peso = Double.parseDouble(request.getParameter("pespro"));
			
			
				
			try{
				System.out.println(nompro);
				String categoria = request.getParameter("cate");
				String descripcion = request.getParameter("descripcion");
				String medida = request.getParameter("medida");
				double precio = Double.parseDouble(request.getParameter("prepro"));
				
				
				Part foto = request.getPart("foto");
				
				String nombreFoto = guardarFoto.obtenerNombreFoto(foto);
				
				String rutaGuardarFot = getServletContext().getRealPath("/") ;
				String[] parts = rutaGuardarFot.split(".metadata");
				
				String rutaPathCortada = parts[0];
				String nombreProyecto=getServletContext().getServletContextName();
				
				String rutaGuardarFoto=rutaPathCortada+ nombreProyecto+"/WebContent/images/";
				String rutaBaseDatos=rutaPathCortada+ nombreProyecto+"/images/";
				
				String rutaProyecto = "images/"+nombreFoto;
				
				System.out.println("RUTA PROYECTO PARA DIS --->"+rutaProyecto);
				System.out.println("RUTA BASE DE DATOS --->"+rutaBaseDatos);
				System.out.println("RUTA DEL PROYECTO -->"+rutaGuardarFoto);
				
				
				ProductoBean producto = new ProductoBean();	
				
				if(productodao.buscarCoincidencia(0,peso, nompro)){
					
					
					System.out.println("hasta aca llegola webada");
					producto.setCodPro(categoria.substring(0,3)+"-"+productodao.buscarUltimoCod(categoria.substring(categoria.length()-1)));
					producto.setNombre(nompro.trim());
					producto.setDescripcion(descripcion.trim());
					System.out.println(Integer.parseInt(categoria.substring(categoria.length()-1)));
					producto.setIdCategoria(Integer.parseInt(categoria.substring(categoria.length()-1)));
					guardarFoto.guardar( (rutaGuardarFoto + nombreFoto), foto );//GUARDAR FOTO EN CARPETA
					if(rutaProyecto.equalsIgnoreCase("images/")){
						producto.setFoto("images/default.jpg");
					}else{
						producto.setFoto(rutaProyecto);
					}
					
					
					producto.setMedida(medida);
					producto.setPrecio(precio);
					producto.setPeso(peso);
					
					
					
					if(productodao.agregarProducto(producto)){

						out.println("<script type=\"text/javascript\">");
						out.println("alert('Producto agregado correctamente');");
						out.println("location='Gestionar_Producto'");
						out.println("</script>");
					}else{
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Error, ocurrio algo al momento de querer agregar el producto.');");
						out.println("location='Gestionar_Producto'");
						out.println("</script>");
					}
					
					
				}else{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('El Producto que desea ingresar ya existe');");
					out.println("location='Gestionar_Producto'");
					out.println("</script>");
				}
				
				
				
				
				
			}catch(Exception e){
				System.out.println("todo culpa de claudio");
				System.out.println(e.getMessage());
			}
		}
		
		
		if(accion.equalsIgnoreCase("actualizar")){
			
			int id = Integer.parseInt(request.getParameter("AidPro"));
			String nompro = request.getParameter("Anompro");
			System.out.println(nompro);
			double peso = Double.parseDouble(request.getParameter("Apespro"));
		
			
			try {
				
				if(productodao.buscarCoincidencia(id,peso, nompro)){
					
					
					String codpro = request.getParameter("AcodPro");
					String categoria = request.getParameter("Acate");
					String descripcion = request.getParameter("Adescripcion");
					String medida = request.getParameter("Amedida");
					double precio = Double.parseDouble(request.getParameter("Aprepro"));
					
					
					//FPROCESO DE LA FOTO
					Part foto = request.getPart("Afoto");
					
					String rutaProyecto = "";
					
					
					if(foto!=null){
						String nombreFoto = guardarFoto.obtenerNombreFoto(foto);
						
						String rutaGuardarFot = getServletContext().getRealPath("/") ;
						String[] parts = rutaGuardarFot.split(".metadata");
						
						String rutaPathCortada = parts[0];
						String nombreProyecto=getServletContext().getServletContextName();
						
						String rutaGuardarFoto=rutaPathCortada+ nombreProyecto+"/WebContent/images/";
						String rutaBaseDatos=rutaPathCortada+ nombreProyecto+"/images/";
						rutaProyecto = "images/"+nombreFoto;
						System.out.println("RUTA BASE DE DATOS --->"+rutaBaseDatos);
						System.out.println("RUTA DEL PROYECTO -->"+rutaGuardarFoto);
						guardarFoto.guardar( (rutaGuardarFoto + nombreFoto), foto );
					
					}
					
						
						ProductoBean producto = new ProductoBean();	
						System.out.println("hasta aca llegola webada");
						System.out.println(categoria.substring(0,3));
						if(categoria.substring(0,3).equalsIgnoreCase(codpro.substring(0,3))){
							producto.setCodPro(codpro);
						}else{
							producto.setCodPro(categoria.substring(0,3)+"-"+productodao.buscarUltimoCod(categoria.substring(categoria.length()-1)));
						}
						producto.setIdProducto(id);
						producto.setNombre(nompro.trim());
						producto.setDescripcion(descripcion.trim());
						System.out.println("CODIGO DE LA CATEGORIA --->"+Integer.parseInt(categoria.substring(categoria.length()-1)));
						producto.setIdCategoria(Integer.parseInt(categoria.substring(categoria.length()-1)));
						producto.setFoto(rutaProyecto);
						producto.setMedida(medida);
						producto.setPrecio(precio);
						producto.setPeso(peso);
						
						
						
						if(productodao.actualizarProducto(producto)){
							out.println("<script type=\"text/javascript\">");
							out.println("alert('El producto ha sido modificado');");
							out.println("location='Gestionar_Producto'");
							out.println("</script>");
						}else{
							out.println("<script type=\"text/javascript\">");
							out.println("alert('Error al modificar el producto');");
							out.println("location='Gestionar_Producto'");
							out.println("</script>");
						}
						
				}else{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('El producto que desea ingresar ya existe');");
					out.println("location='Gestionar_Producto'");
					out.println("</script>");
				}
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			
			
		}

/*----------------------------rhonnald------------------------------------*/
		
		if(accion.equals("buscarCriterio")){
			ArrayList<ProductoBean> producto =null;
			try {
				
				System.out.println("entro buscar Criterio");
				String dato= request.getParameter("dato");
				
				int flag= Integer.parseInt(request.getParameter("flag"));
				int flagC=Integer.parseInt(request.getParameter("flagC"));;
				producto = productodao.buscarXcriterio(dato, flag, flagC);
				System.out.println("asdas"+producto);
				if(producto.size()!=0 || producto!=null || !producto.isEmpty()){		
					
				    ResponseObject responseobj=null;
					responseobj=new ResponseObject();
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					responseobj.setSuccess(true);
					responseobj.setObject(producto);
					response.getWriter().write(new Gson().toJson(responseobj));
					System.out.println("json" + new Gson().toJson(responseobj));
			}	
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
if(accion.equals("seleccionProductoId")){
			
			ProductoBean producto = new ProductoBean();
			try {
				System.out.println("Entro al triii");
				
				
				int id =Integer.parseInt(request.getParameter("id"));
			
				producto=productodao.datosProducto(id);
			ResponseObject responseobj=null;
			if (producto!=null) {
				responseobj=new ResponseObject();
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				responseobj.setSuccess(true);
				responseobj.setObject(producto);
				
			}
			response.getWriter().write(new Gson().toJson(responseobj));
			System.out.println("json" + new Gson().toJson(responseobj));
			} catch (Exception e) {
				// TODO: handle exception
			}
			}
	}

	

}
