package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connect.Connect;
import com.dao.ForgotPasswordDao;
import com.dao.mailManage;

@WebServlet("/forgot1")


public class ForgotPasswordController extends HttpServlet{

	
private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
	{
			String action=req.getParameter("action");
			if(action.equalsIgnoreCase("sendotp"))
			{
			
					String email = req.getParameter("email");
					boolean status=false;
					try {
						status=ForgotPasswordDao.isValidemail(email);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					if(status)
					{
						String x=mailManage.sendOTP(email,"Nutan Handicraft","is your OTP.Please enter the same on Nutan Handicraft to complete verification.");
						System.out.println("\t\t\n\nOTP from conyroller"+x +status);
						HttpSession session=req.getSession();
						session.setAttribute("otp", x);
						session.setAttribute("email", email);
						res.sendRedirect("Otpverify.jsp");
					}
					else
					{
						String msg="Wrong Email Id";
						res.sendRedirect("forgotPassword.jsp?id="+msg);
					}
			
			}
			else if(action.equalsIgnoreCase("submitotp"))
			{
				String msg="wrong otp";
				String otps=req.getParameter("otps");
				String otp=req.getParameter("otp");
				boolean st=otps.equals(otp);
				if(st){
				res.sendRedirect("Newpass.jsp");}
				else
				{
					res.sendRedirect("Otpverify.jsp?id="+msg);
				}
			}
			else if(action.equalsIgnoreCase("change"))	
			{
				String password=req.getParameter("pass");
				String email1=req.getParameter("email1");
				ForgotPasswordDao.changePasswordreg(email1, password);
				System.out.println(password+"<===>"+email1);
				res.sendRedirect("login.jsp");	
			}
	}

}
