package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.SizeBean;
import com.dao.SizeDao;

@WebServlet("/sizecontroller")
public class SizeController extends HttpServlet{
	
	String size;
	int category;
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String action = req.getParameter("action");
		
		if(action.equalsIgnoreCase("add"))
		{
			SizeBean sb = new SizeBean();
			sb.setSize(req.getParameter("addsize"));
			sb.setCat_id(Integer.parseInt(req.getParameter("cat_id")));
			SizeDao sd = new SizeDao();
			sd.insertSize(sb);
			req.getRequestDispatcher("ViewSize.jsp").forward(req, res);
		}
		
		else if(action.equalsIgnoreCase("Update")) //execute when clicked on update button from table
		{
			int id = Integer.parseInt(req.getParameter("id"));
			SizeDao sd = new SizeDao();
			SizeBean sb = sd.getSizeById(id);
			size=sb.getSize();
			category=sb.getCat_id();
			req.setAttribute("id", sb);
			req.getRequestDispatcher("updateSize.jsp").forward(req, res);
		}
		
		else if(action.equalsIgnoreCase("save")) //execute when clicked on save button of updateColor form
		{
			SizeBean sb = new SizeBean();
			sb.setSizeid(Integer.parseInt(req.getParameter("id")));
			sb.setSize(req.getParameter("updatesize"));
			String temp=req.getParameter("catnm");
			SizeDao sd = new SizeDao();
			if(temp == null)
			{	
				sd.updateSize(sb,size,category);
			}
			else
			{
				category=Integer.parseInt(req.getParameter("catnm"));
				sd.updateSize(sb,size,category);
			}
			req.getRequestDispatcher("ViewSize.jsp").forward(req, res);
		}
		
		else if(action.equalsIgnoreCase("delete"))
		{
			int id = Integer.parseInt(req.getParameter("id"));
			SizeDao sd = new SizeDao();
			SizeBean sb = sd.getSizeById(id);
			sd.deleteSize(sb);
			req.getRequestDispatcher("ViewSize.jsp").forward(req, res);
		}
	}
}
