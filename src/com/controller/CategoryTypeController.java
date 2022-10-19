package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.CategoryTypeBean;
import com.dao.CategoryTypeDao;

@WebServlet("/catrgorytypecontroller")
public class CategoryTypeController extends HttpServlet{
	
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String action=req.getParameter("action");
		
		if(action.equalsIgnoreCase("insert"))
		{
			CategoryTypeBean ctb=new CategoryTypeBean();
			ctb.setCat_type_name(req.getParameter("cat_type_name"));
			
			CategoryTypeDao ctd=new CategoryTypeDao();
			ctd.insertCatType(ctb);
			req.getRequestDispatcher("ViewCategoryType.jsp").forward(req, res);	
		}
		if(action.equalsIgnoreCase("Update"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			CategoryTypeDao ctd=new CategoryTypeDao();
			CategoryTypeBean ctb=ctd.getCategoryTypeById(id);
			req.setAttribute("up", ctb);
			req.getRequestDispatcher("updateCategoryType.jsp").forward(req,res);
		}
		if(action.equalsIgnoreCase("save"))
		{
			CategoryTypeBean ctb=new CategoryTypeBean();
			ctb.setCat_type_id(Integer.parseInt(req.getParameter("id")));
			ctb.setCat_type_name(req.getParameter("upcat_name"));
			CategoryTypeDao ctd=new CategoryTypeDao();
			ctd.updateCategoryType(ctb);
			req.getRequestDispatcher("ViewCategoryType.jsp").forward(req,res);
		}
		if(action.equalsIgnoreCase("delete"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			CategoryTypeDao dao=new CategoryTypeDao();
			dao.deleteByid(id);
			req.getRequestDispatcher("ViewCategoryType.jsp").forward(req,res);
		}
	}
}
