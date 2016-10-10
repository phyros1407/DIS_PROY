package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.PedidoBean;
import beans.TransaccionBean;
import dao.interfaces.PedidoDao;
import daofactory.DAOFactory;

/**
 * Servlet implementation class ServletGenerarPedido
 */
@WebServlet("/ServletGenerarPedido")
public class ServletGenerarPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletGenerarPedido() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//USUARIO
		int id_usuario = Integer.parseInt(request.getParameter("usuario_generar_pedido"));

		//ARRAYS DE LOS PRODUCTOS SELECCIONADOS
		String ids [] = request.getParameterValues("productosIds");
		String cantidades [] = request.getParameterValues("productosCantidad");
		String importes [] = request.getParameterValues("productosImporte");
		
		
		String tipo_entrega = request.getParameter("tipo_entrega_pedido");
		String fecha = request.getParameter("fecha_generar_pedido");
		
		
		String facturacion = request.getParameter("facturacion_generar_pedido");
		
		if(facturacion.equalsIgnoreCase("factura")){
			String ruc = request.getParameter("ruc_entrega_pedido");
			String rus = request.getParameter("rs_entrega_pedido");
		}
		
		
		String departamento = request.getParameter("departamento_entrega_pedido");
		String provincia = request.getParameter("provincia_entrega_pedido");
		String distrito = request.getParameter("distrito_entrega_pedido");
		String direccion = request.getParameter("distrito_entrega_pedido");
		String referencia = request.getParameter("referencia_entrega_pedido");
		String telefono = request.getParameter("telefono_entrega_pedido");
		String telefono2 = request.getParameter("telefono_entrega_pedido2");
		
		int cuotas = Integer.parseInt(request.getParameter("cuotas_entrega_pedido"));
		
		
		DAOFactory dao = DAOFactory.getDaoFactory(DAOFactory.MYSQL);
		PedidoDao pedidodao = dao.getPedidoDAO();
		
		try{
			
			//GENERAR NUEVO CODIGO PARA TRANSACCION
			String codigoAntiguo = pedidodao.generarNumeroTransaccion();
			System.out.println("CODIGO ANTIGUO -->"+codigoAntiguo);
			String premisa = codigoAntiguo.substring(0,5);
			int numero = Integer.parseInt(codigoAntiguo.substring(6));
			System.out.println("NUMERO A SUMAR --->"+numero);
			int nuevoNumero = numero+1;
			System.out.println("NUEVO NUMERO --->"+nuevoNumero);
			String cadena =(String.valueOf(nuevoNumero));
			for(int i = 0;i<11;i++){
				
				if(cadena.length()<12){
					
					cadena = "0"+cadena;
					
				}else{
					
					break;
					
				}
				
			}
			String codigoNuevo = premisa+cadena;
			System.out.println("NUEVO CODIGO DE TRANSACCION --->"+codigoNuevo+"\n Y SU MEDIDA ES ---->"+codigoNuevo.length());
			
			//GRABAR TRANSACCION
			TransaccionBean transaccion = new TransaccionBean();
			transaccion.setId_usuario(id_usuario);
			transaccion.setIde("P");//IDENTIFICADOR PEDIDO
			transaccion.setNum(codigoNuevo);
			transaccion.setEst("P");//ESTADO PENDIENTE
			transaccion.setFec_ent(fecha);
			
			int idGenerado = pedidodao.guardarTransaccion(transaccion);
			if(idGenerado!=0){
				
				//GRABAR PEDIDO
				PedidoBean pedido = new PedidoBean();
				pedido.setId(idGenerado);
				if(tipo_entrega.equalsIgnoreCase("local")){
					
					pedido.setTipoEntrega("RL");
					
				}
				if(tipo_entrega.equalsIgnoreCase("casa")){
				
					pedido.setTipoEntrega("EC");
					
				}
		
				
			}else{
				
				
				
			}
			
		}catch(Exception e){
			
			e.getMessage();
			
		}
		
		
	}

}
