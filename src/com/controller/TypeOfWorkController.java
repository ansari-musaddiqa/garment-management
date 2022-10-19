package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.TypeOfWorkBean;
import com.dao.TypeOfWorkDao;

@WebServlet("/TypeOfWorkController")
public class TypeOfWorkController extends HttpServlet{
	
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String action=req.getParameter("action");
		if(action.equalsIgnoreCase("insert"))
		{
			TypeOfWorkBean bean=new TypeOfWorkBean();
			bean.setStatus(1);
			bean.setWork_name(req.getParameter("typeOfWorkName"));
			
			TypeOfWorkDao dao=new TypeOfWorkDao();
			dao.insertTypeOfWork(bean);
			
			req.getRequestDispatcher("ViewTypeOfWork.jsp").forward(req, res);
		}
		if(action.equalsIgnoreCase("delete"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			TypeOfWorkDao dao=new TypeOfWorkDao();
			dao.deleteById(id);
			req.getRequestDispatcher("ViewTypeOfWork.jsp").forward(req, res);
		}
		if(action.equalsIgnoreCase("update"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			TypeOfWorkDao dao=new TypeOfWorkDao();
			TypeOfWorkBean bean= dao.getTypeOfWorkById(id);
			req.setAttribute("id", bean);
			req.getRequestDispatcher("updateTypeOfWork.jsp").forward(req, res);
		}
		if(action.equalsIgnoreCase("save"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			System.out.println(id);
			TypeOfWorkDao dao=new TypeOfWorkDao();
			TypeOfWorkBean bean=dao.getTypeOfWorkById(id);
			System.out.println(bean.getWork_name());
			String wn=req.getParameter("typeOfWorkName");
			if(wn == null)
			{
				wn=bean.getWork_name();
			}
			bean.setWork_name(wn);
			dao.UpdateTypeOfWork(bean);
			req.getRequestDispatcher("ViewTypeOfWork.jsp").forward(req, res);
		}
	}
}
