package util;

import java.io.File;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 * A utility class for sending e-mail message with attachment.
 * @author www.codejava.net
 *
 */
public class EnviarArchivos {
	
		public static void main(String args[]) throws UnknownHostException,AddressException, MessagingException{
			
			//Obtener nombre y direccion IP del equipo local juntos
		       InetAddress direccion = InetAddress.getLocalHost();
		       String user=direccion.getHostName();

			//Probando...
			
			String directorio  ="C:/Users/"+user+"/Downloads";
			
			File f= new File(directorio);
			if(f.exists()){
				File[] ficheros = f.listFiles();
				for (int x=0;x<ficheros.length;x++){
				  System.out.println(ficheros[x].getName());
				}
				
			}
		} 
	/**
	 * Sends an e-mail message from a SMTP host with a list of attached files. 
	 * @throws UnknownHostException 
	 * 
	 */
	public static void sendEmailWithAttachment(String host, String port,
			final String userName, final String password, String toAddress,
			String subject, String message,String ruta)
					throws AddressException, MessagingException, UnknownHostException {
		// sets SMTP server properties
		Properties properties = new Properties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", port);
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.user", userName);
		properties.put("mail.password", password);

		// creates a new session with an authenticator
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(userName, password);
			}
		};
		Session session = Session.getInstance(properties, auth);

		// creates a new e-mail message
		Message msg = new MimeMessage(session);

		msg.setFrom(new InternetAddress(userName));
		InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
		msg.setRecipients(Message.RecipientType.TO, toAddresses);
		msg.setSubject(subject);
		msg.setSentDate(new Date());

		// creates message part
		MimeBodyPart messageBodyPart = new MimeBodyPart();
		messageBodyPart.setContent(message, "text/html");
		
		
		  InetAddress direccion = InetAddress.getLocalHost();
	       String user=direccion.getHostName();

		
		
		String directorio  ="C:/Users/"+user+"/Downloads/";
		
		System.out.println("LA RUTAAAAAAAAA "+directorio+ruta);
		
		//archivo
		BodyPart adjunto = new MimeBodyPart();												
		adjunto.setDataHandler(new DataHandler(new FileDataSource(directorio+ruta)));
		adjunto.setFileName(ruta);

		// creates multi-part
		Multipart multipart = new MimeMultipart();
		multipart.addBodyPart(messageBodyPart);
		
		multipart.addBodyPart(adjunto);// Agregue esto
		

		// adds attachments
		

		// sets the multi-part as e-mail's content
		msg.setContent(multipart);

		// sends the e-mail
		Transport.send(msg);
		System.out.println("envio");
	}
	
}