package util;

import java.io.File;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Part;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;


import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;

import javax.mail.internet.MimeMultipart;

public class EnviarBoleta extends Object {


	final String username ="nano_sport_test@hotmail.com";
	final String password ="nanosport1234";
	
	
 
    MimeMultipart multiParte = new MimeMultipart("related");
	Properties props = new Properties();
	
	private void init() {
 
		props = new Properties();
		 
		props.put("mail.smtp.host", "smtp-mail.outlook.com");
		props.put("mail.smtp.starttls.enable", "true");
		//props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.port","587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.mail.sender", username);
		props.put("mail.smtp,password",password);
		props.put("mail.smtp.user", username);
		
        
	}
 
	public void sendEmail() throws Exception{
 
		init();
		
            String formulario =armarEmail();
     
            addContent(formulario);
     
            /*
            //añadir imagenes
            addCID("cidqr", "images_email/qr_paypal.png");
            
           
            addAttach(""); //ruta donde se encuentra el fichero que queremos adjuntar.
             */
            
            // enviar el correo MULTIPART
            sendMultipart();
        
		
	}

	public void addContent(String htmlText) throws Exception
    {
        // first part (the html)
        BodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setContent(htmlText, "text/html");
        // add it
        this.multiParte.addBodyPart(messageBodyPart);
    }
	
	public void addCID(String cidname,String pathname) throws Exception
    {
        DataSource fds = new FileDataSource(pathname);
        BodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setDataHandler(new DataHandler(fds));
        messageBodyPart.setHeader("Content-ID","<"+cidname+">");
        this.multiParte.addBodyPart(messageBodyPart);
    }
	
	public void addAttach(String pathname) throws Exception
    {
        File file = new File(pathname);
        BodyPart messageBodyPart = new MimeBodyPart();
        DataSource ds = new FileDataSource(file);
        messageBodyPart.setDataHandler(new DataHandler(ds));
        messageBodyPart.setFileName(file.getName());
        messageBodyPart.setDisposition(Part.ATTACHMENT);
        this.multiParte.addBodyPart(messageBodyPart);
    }
	
	public void sendMultipart() throws Exception
    {
        Session mailSession = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username,password);
                    }
                });
        mailSession.setDebug(true);
        Transport transport = mailSession.getTransport("smtp");
        MimeMessage message = new MimeMessage(mailSession);
        message.setSubject("Nano-Sport-Shop ()");
        message.setFrom(new InternetAddress((String)props.get("mail.smtp.mail.sender")));
        message.addRecipient(Message.RecipientType.TO,
                new InternetAddress("jean_barbieri@usmp.pe"));
        // put everything together
        message.setContent(multiParte);
        
        transport.connect(username, password);
        transport.sendMessage(message,
                message.getRecipients(Message.RecipientType.TO));
        transport.close();
    }
	
	public  String armarEmail(){
		
		
	
						
						
						
						
		String cuerpo ="<div class='col-xs-12'>"
				+"<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>"
				+ "<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js'></script>"
				+ "<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js'></script>"
				+ "<div class='col-xs-6'><fieldset><legend>Datos del Cliente</legend></fieldset></div>"
				+ "<div class='col-xs-6'><fieldset><legend>Direccion de Envio</legend></fieldset></div>"
				+ "</div>";
    
       

        
        String formulario = cuerpo;
 
		
		
		return formulario;
		

	}
	
}
