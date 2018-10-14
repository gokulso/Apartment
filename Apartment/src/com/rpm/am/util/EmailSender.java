package com.rpm.am.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;

/**
  * A simple email sender class.
  */
public class EmailSender
{

	final static Logger logger = Logger.getLogger(EmailSender.class);
	
  /**
    * Main method to send a message given on the command line.
    */
  public static void main(String args[])
  {
    try
    {
      String smtpServer=args[0];
      String to=args[1];
      String from=args[2];
      String subject=args[3];
      String body="Test Message";
      send(smtpServer, to, from, subject, body);
    }
    catch (Exception ex)
    {
      System.out.println("Usage: java com.lotontech.mail.SimpleSender"
       +" smtpServer toAddress fromAddress subjectText bodyText");
    }
    System.exit(0);
  }
  
  /**
   * "send" method to send the message.
   */
 public static void send(String smtpServer, String to, String from
  , String subject, String body)
 {
   try
   {
     Properties props = System.getProperties();
     // -- Attaching to default Session, or we could start a new one --
     props.put("mail.smtp.host", "localhost");
     Session session = Session.getDefaultInstance(props, null);
     // -- Create a new message --
     Message msg = new MimeMessage(session);
     // -- Set the FROM and TO fields --
     msg.setFrom(new InternetAddress("admin@portalseven.com"));
     msg.setRecipients(Message.RecipientType.TO,
       InternetAddress.parse("pravin404@yahoo.com", false));
     // -- We could include CC recipients too --
     // if (cc != null)
     // msg.setRecipients(Message.RecipientType.CC
     // ,InternetAddress.parse(cc, false));
     // -- Set the subject and body text --
     msg.setSubject("Hi...Test Mail");
     msg.setText("Test Message");
     // -- Set some other header information --
     msg.setHeader("X-Mailer", "PortalSevenEmailTest");
     msg.setSentDate(new Date());
     // -- Send the message --
     Transport.send(msg);
     System.out.println("Message sent OK.");
   }
   catch (Exception ex)
   {
     ex.printStackTrace();
   }
 }
 
 
 /**
  * "send" method to send the message.
  */
public static void sendRegistrationEmail(String to,String subject, String body)
{
  try
  {
    Properties props = System.getProperties();
    // -- Attaching to default Session, or we could start a new one --
    props.put("mail.smtp.host", "localhost");
    Session session = Session.getDefaultInstance(props, null);
    // -- Create a new message --
    Message msg = new MimeMessage(session);
    // -- Set the FROM and TO fields --
    msg.setFrom(new InternetAddress("admin@portalseven.com"));
    msg.setRecipients(Message.RecipientType.TO,
      InternetAddress.parse(to, false));
    // -- We could include CC recipients too --
    // if (cc != null)
     msg.setRecipients(Message.RecipientType.BCC 
     ,InternetAddress.parse("pravin404@yahoo.com", false));
    // -- Set the subject and body text --
    msg.setSubject(subject);
    msg.setText(body);
    // -- Set some other header information --
    msg.setHeader("X-Mailer", "PortalSevenEmailRegistration");
    msg.setSentDate(new Date());
    // -- Send the message --
    Transport.send(msg);
    System.out.println("Message sent OK.");
  }
  catch (Exception ex)
  {
    ex.printStackTrace();
  }
}


 public static void sendEmail(String subjectText, String emailId, String messageText){
	 
	 String smtpServer = null;                                                                                                                   
	 String smtpPort = null;                                                                                                                     
	 final String authAddress = "account@portalseven.com";//request.getParameter("auth_add");                                                                                
	 final String authPassword ="Maha404";// request.getParameter("auth_pass");                                                                              
	 String subject = null;                                                                                                                      
	 String email = null;                                                                                                                        
	 String message = null;                                                                                                                      
	 String send =  "";//request.getParameter("send");                                                                                                 
	 String siteName= "";//request.getServerName();                                                                                                    
	 siteName=siteName.replaceAll("www.","");                                                                                                    

	 if(send!=null){
	         smtpServer = "localhost";
	         smtpPort = "2525";
	         subject = subjectText;    
	         email = emailId;      
	         message =messageText;    
	         try{                                             
	                 Properties props = new Properties();     
	                 props.put("mail.smtp.host", smtpServer);
	                 props.put("mail.smtp.port", smtpPort);   
	             props.put("mail.smtp.auth", "true");         
	                                                          
	             // create some properties and get the default Session
	             Session sessionMail = Session.getInstance(props, new Authenticator() {
	                  public PasswordAuthentication getPasswordAuthentication() {     
	                          return new PasswordAuthentication(authAddress, authPassword);
	                  }                                                                   
	                 });                                                                  
	                                                                                      
	             sessionMail.setDebug(true);

	             // create a message
	             Message msg = new MimeMessage(sessionMail);

	             // set the from and to address
	             InternetAddress addressFrom = new InternetAddress(authAddress);
	             msg.setFrom(addressFrom);

	             InternetAddress[] addressTo = new InternetAddress[1];
	             addressTo[0] = new InternetAddress(email);
	             msg.setRecipients(Message.RecipientType.TO, addressTo);


	             // Optional : You can also set your custom headers in the Email if you Want
	             msg.addHeader("site", siteName);

	             // Setting the Subject and Content Type
	             msg.setSubject(subject);
	             msg.setContent(message, "text/plain");
	             Transport.send(msg);
	         }catch(Exception e){
	        	 logger.error(e);
	        
	         }
	 }
 }


 public static void sendHtmlEmail(String subjectText, String emailId, String messageText)
 {
	 String smtpServer = null;                                                                                                                   
	 String smtpPort = null;                                                                                                                     
	 final String authAddress = "account@portalseven.com";//request.getParameter("auth_add");                                                                                
	 final String authPassword ="Pass";// request.getParameter("auth_pass");                                                                              
	 String subject = null;                                                                                                                      
	 String email = null;                                                                                                                        
	 String message = null;                                                                                                                      
	 String send =  "";//request.getParameter("send");                                                                                                 
	 String siteName= "http://PortalSeven.com";//request.getServerName();                                                                                                    
	 siteName=siteName.replaceAll("www.","");                                                                                                    

	 if(send!=null)
	 {
	         smtpServer = "localhost";
	         smtpPort = "2525";
	         subject = subjectText;    
	         email = emailId;      
	         message =messageText;    
	 
	         try
	         {                                             
	              Properties props = new Properties();     
	              props.put("mail.smtp.host", smtpServer);
	              props.put("mail.smtp.port", smtpPort);   
	              props.put("mail.smtp.auth", "true");         
	                                                          
	              // create some properties and get the default Session
	              Session sessionMail = Session.getInstance(props, new Authenticator() {
	                  public PasswordAuthentication getPasswordAuthentication() {     
	                          return new PasswordAuthentication(authAddress, authPassword);
	                  }                                                                   
	                 });                                                                  
	                                                                                      
	             sessionMail.setDebug(true);

	             // create a message
	             Message msg = new MimeMessage(sessionMail);

	             // set the from and to address
	             InternetAddress addressFrom = new InternetAddress(authAddress);
	             msg.setFrom(addressFrom);

	             InternetAddress[] addressTo = new InternetAddress[1];
	             addressTo[0] = new InternetAddress(email);
	             msg.setRecipients(Message.RecipientType.TO, addressTo);

	             // Optional : You can also set your custom headers in the Email if you Want
	             msg.addHeader("site", siteName);
	             msg.setHeader("X-Mailer", "PortalSevenEmailRegistration");
	             msg.setSentDate(new java.util.Date());
	             // Setting the Subject and Content Type
	             msg.setSubject(subject);
	             msg.setContent(message, "text/html");
	             Transport.send(msg);
	         }
	         catch(Exception e)
	         {
	        	 logger.error(e);
	         }
	 }
  }
}
