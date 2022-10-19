package com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ProfileBean;
import com.bean.RegisterBean;
import com.dao.RegisterDao;
@WebServlet("/logincontroller")
public class LoginController extends HttpServlet{
		public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException
		{
			String action=req.getParameter("action");
			
			if(action.equalsIgnoreCase("login"))
			{
				
				String email=req.getParameter("email");
				String pass=req.getParameter("pass");
				
				int id=0;
				boolean status=RegisterDao.isValidUser(email, pass);
				System.out.println("action :"+action);
				System.out.println("status "+status);
				try
				{
					id=RegisterDao.getIdByEmail(email);
					System.out.println("getid by email:"+id);
				}
				catch(SQLException e)
				{
					e.printStackTrace();
				}
				
				
				if(status)
				{
					RegisterBean rb=RegisterDao.getUserById(id);
					System.out.println("gt emp:"+  rb.getEmp_id());
					HttpSession ses=req.getSession();
					ses.setAttribute("id", rb.getEmp_id());
					ses.setAttribute("shop", rb.getShop_id());
					res.sendRedirect("dashboard.jsp");
				}
				else
				{
					RequestDispatcher rd=req.getRequestDispatcher("loginWarning.jsp");
					rd.include(req, res);
				}
				
			}
			
			if(action.equalsIgnoreCase("logout"))
			{
				System.out.print("logout");
				res.sendRedirect("login.jsp");
				//req.getRequestDispatcher("login.jsp").forward(req, res);
			}
		}
}
