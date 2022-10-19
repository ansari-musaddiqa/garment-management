package com.dao;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class mailManage {

	private final static String fromMail ="nutanhandicraft7@gmail.com";
	private final static String pass="20001211";
	
	/*private final static String fromMail ="easycompliances1178@gmail.com";
	private final static String pass="123@Rutvi";
	*/static char[] OTP(int len)
	{
		String number="0123456789";
		Random rm=new Random();
		char[] otp=new char[len];
		for(int i=0;i<len;i++)
		{
			otp[i]=number.charAt(rm.nextInt(number.length()));
		}
		return otp;
	}
	public static String sendMailtoUser(String to,String subject,String body)
	{
		String otp=new String(OTP(4));
		System.out.println("done==>"+to + subject+ body);
		Properties prop=new Properties();
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		 
		Authentication auth=new Authentication();
		Session session=Session.getInstance(prop, auth);
			try
		{
			Message message=new MimeMessage(session);
			message.setFrom(new InternetAddress(fromMail));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(body);
			Transport.send(message);
			return otp;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	public static String sendOTP(String to,String subject,String body)
	{
		String otp=new String(OTP(4));
		Properties prop=new Properties();
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", "587");
		 
		Authentication auth=new Authentication();
		Session session=Session.getInstance(prop, auth);
			try
		{
			Message message=new MimeMessage(session);
			message.setFrom(new InternetAddress(fromMail));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
			message.setSubject(subject);
			message.setText(body+otp);
			Transport.send(message);
			return otp;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	static class Authentication extends Authenticator
	{
		@Override
		protected PasswordAuthentication getPasswordAuthentication()
		{
			return new PasswordAuthentication(fromMail, pass);
		}
	}
	
}
