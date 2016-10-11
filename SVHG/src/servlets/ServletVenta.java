package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ResponseObject;
import beans.EmpresaBean;
import beans.PersonaBean;

import com.google.gson.Gson;

import dao.interfaces.EmpresaDao;
import dao.interfaces.OfertaDao;
import dao.interfaces.PedidoDao;
import dao.interfaces.PersonaDao;
import dao.interfaces.VentaDao;
import daofactory.DAOFactory;

/**
 * Servlet implementation class ServletVenta
 */
@WebServlet("/ServletVenta")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, 	// 2MB
maxFileSize = 1024 * 1024 * 10, 		// 10MB
maxRequestSize = 1024 * 1024 * 50)		// 50MB
public class ServletVenta extends HttpServlet {
	private String host;
	private String port;
	private String user;
	private String pass;	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletVenta() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String accion=request.getParameter("accion");

	DAOFactory dao = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
	VentaDao ventadao = dao.getVentaDao();
	String num= request.getParameter("num");
	System.out.println("numero"+num);
	if(accion.equals("numeroTransaccion")){	
		try {
	

	String codigoAntiguo = ventadao.generarNumeroTransaccion(num);

ResponseObject responseobj=null;
if (codigoAntiguo!=null) {
	responseobj=new ResponseObject();
	response.setContentType("application/json");
	response.setCharacterEncoding("UTF-8");
	responseobj.setSuccess(true);
	responseobj.setObject(codigoAntiguo);
	response.getWriter().write(new Gson().toJson(responseobj));
	System.out.println("json numero" + new Gson().toJson(responseobj));
}
//System.out.println("NUEVO CODIGO DE TRANSACCION --->"+codigoNuevo+"\n Y SU MEDIDA ES ---->"+codigoNuevo.length());
} catch (Exception e) {
	// TODO: handle exception
}
}






		boolean flag=false;
		boolean flagEmpresa=false;
		if(accion.equals("registrarClientes")){		
			try {
				
				String tipo=request.getParameter("optradio");
				
				PersonaBean persona = new PersonaBean();
				
				PersonaDao ipersonadao = dao.getPersonaDAO();
				
				persona.setDni(request.getParameter("txt_dni"));
				persona.setNombre( request.getParameter("txt_nombre") );
				persona.setApellidoPaterno(request.getParameter("txt_apepat"));
				persona.setApellidoMaterno(request.getParameter("txt_apemat"));
				persona.setPass(request.getParameter("txtClave"));
				persona.setCorreo(request.getParameter("txtCorreo"));
				persona.setTelefono(request.getParameter("txtCelular"));
				
				flag = ipersonadao.registrarCliente(persona);
				System.out.print("xxxxxxxxxxxTIPO: "+tipo);
				if(tipo.equalsIgnoreCase("empresa")){
					//---------------BUSCAR POR CORREO Y DNI---------------------------------
					System.out.println("asdada2");
					DAOFactory daoID = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
					PersonaDao iidpersonadao= daoID.getPersonaDAO() ;
					PersonaBean id = iidpersonadao.buscarXCorreo(request.getParameter("txtCorreo"), Integer.parseInt(request.getParameter("txt_dni")));
					//------------------------------------------------------------------------
					EmpresaBean empresa = new EmpresaBean();
					DAOFactory daoEmpresa= DAOFactory.getDaoFactory(DAOFactory.MYSQL);
					EmpresaDao iempresadao = daoEmpresa.getEmpresaDAO();
					
					
					empresa.setEmp_ide(String.valueOf(id.getId()));
					empresa.setIde("C");
					empresa.setRazonSocial(request.getParameter("txtRazon"));
					empresa.setRuc(request.getParameter("txtRuc"));
					empresa.setPais("PERU");
				
					System.out.println("asd"+request.getParameter("txtRuc")+":asdas:"+request.getParameter("txtRazon"));
					flagEmpresa=iempresadao.registrarEmpresa(empresa);
				}
				System.out.println("Flag persona :"+flag);
				System.out.println("Flag empresa :"+flagEmpresa);
				String a= persona.getCorreo();
				//EmailUtility.sendEmailWithAttachment(host, port, user, pass,a.getRecipient(), usuRes.getSubject(), usuRes.getContent());
				if(flag){		
					System.out.println("7");
					    ResponseObject responseobj=null;
						responseobj=new ResponseObject();
						response.setContentType("application/json");
						response.setCharacterEncoding("UTF-8");
						responseobj.setSuccess(true);
						responseobj.setObject(persona);
						response.getWriter().write(new Gson().toJson(responseobj));
						System.out.println("json" + new Gson().toJson(responseobj));
				}		
			} catch (Exception e) {
				// TODO: handle exception
			}
		}	
		
		if(accion.equals("registrarVenta1")){
			
			
			
			PrintWriter out = response.getWriter();		
			System.out.println("Gurdar venta");
		
			
			int idusuario=Integer.parseInt(request.getParameter("txtusuario"));
			String fecIni=request.getParameter("txt_fechaactual");
			String numeroTransaccion=request.getParameter("txt_numeroVenta");
			String tipoFac="BOLETA";
			System.out.println("agregar");
			
			int size=Integer.parseInt(request.getParameter("txtsize"));
			System.out.println("tamaññooooooo:  "+size);
			
			String[] idProducto=new String[size];
			int[] productoCantidad= new int[size];
			double[] ProductoImporte=new double[size];
			int llenos=0;
			System.out.println("asda"+idProducto);
			for(int i=0;i<size;i++){
				System.out.println("entro a for servlet");
				System.out.println("idproducto: "+request.getParameter("txtidPro"));
				if(request.getParameter("txtidPro"+i+"")!=null){
				System.out.println("tamaño: "+size);	
				System.out.println(request.getParameter("txtidPro"+i+""));
				idProducto[llenos]=request.getParameter("txtidPro"+i+"");
				ProductoImporte[llenos]=Double.parseDouble(request.getParameter("importePro"+i+""));
				productoCantidad[llenos]=Integer.parseInt(request.getParameter("cantidadPro"+i+""));
				llenos=llenos+1;
				System.out.println(llenos);
				}			
			}

		/*	if(llenos==0){
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Seleccione al menos un producto.');");
				out.println("location='ServletVenta'");
				out.println("</script>");
			}*/
			String[] productoId=new String[llenos];
			double[] ImporteProducto=new double[llenos];
			int[] cantidadPro = new int[llenos];
			for(int j = 0; j < productoId.length; j++) {
				productoId[j] = idProducto[j];
				ImporteProducto[j] = ProductoImporte[j];
				cantidadPro[j]=productoCantidad[j];
				System.out.println("tamaño22222:   "+productoId.length);
				System.out.println("llenando segundos vectores");
			}
			
			try {
				System.out.println(idusuario+numeroTransaccion+fecIni+"asdasdadsadas"+productoId+cantidadPro+ImporteProducto+tipoFac);
				if(ventadao.registrarOferta(idusuario, numeroTransaccion, fecIni, productoId, cantidadPro, ImporteProducto, tipoFac)){
					out.println("<script type=\"text/javascript\">");
					out.println("alert('La venta se guardó satisfactoriamente');");
					out.println("location='RegistrarVenta/RegistrarVentaHerramientas.jsp'");
					out.println("</script>");
				System.out.println("guardooo");
				}else{
					System.out.println("fallooooo");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			
		}
		
		
		
	}

}
