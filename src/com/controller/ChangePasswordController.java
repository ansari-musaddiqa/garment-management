package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ChangePasswordBean;
import com.dao.ChangePasswordDao;

@WebServlet("/changepasswordcontroller")
public class ChangePasswordController extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String action=req.getParameter("action");
		if(action.equalsIgnoreCase("change"))
		{
			HttpSession ses=req.getSession();
			ChangePasswordBean bean=new ChangePasswordBean();
			int id=(int) ses.getAttribute("id");
			bean.setEmp_id(id);
			bean.setOldpass(req.getParameter("oldpass"));
			bean.setNewpass(req.getParameter("newpass"));
		
			ChangePasswordDao dao=new ChangePasswordDao();
			if(dao.updatePassword(bean))
			{
				req.getRequestDispatcher("login.jsp").forward(req, res);
			}
			else
			{
				req.getRequestDispatcher("ChangePassword.jsp").forward(req, res);
			}
	   }
		
	}
}