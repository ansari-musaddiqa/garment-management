package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ProfileBean;
import com.bean.RegisterBean;
import com.dao.RegisterDao;

@WebServlet("/profilecontroller")
public class ProfileController extends HttpServlet{
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String action=req.getParameter("action");
		try
		{
			if(action.equalsIgnoreCase("profile"))
			{
				HttpSession ses=req.getSession();
				int id=(int) ses.getAttribute("id");
				
				ProfileBean bean=new ProfileBean();
				bean.setCuser(id);
				
				RegisterDao.profileId(bean);
				req.getRequestDispatcher("empProfile.jsp").forward(req, res);
			}
			if(action.equalsIgnoreCase("empdetails"))
			{
				int id=Integer.parseInt(req.getParameter("id"));
				RegisterDao dao=new RegisterDao();
				RegisterBean bean=new RegisterBean();
				bean=dao.getEmplyeeDetailsById(id);	
				req.setAttribute("empDid", bean);
				req.getRequestDispatcher("empDetails.jsp").forward(req, res);
			}
		}
		catch(Exception e)
			{
				
			}
	}

}
