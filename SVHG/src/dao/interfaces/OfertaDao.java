package dao.interfaces;


public interface OfertaDao {
	public boolean registrarOferta(String[] productoId,double[] productoP,int descuento,String fecIni,String fecFin,String horaFin,int cantidad) throws Exception;
}
