package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.ColorBean;
import com.dao.ColorDao;

@WebServlet("/colorcontroller")
public class ColorController extends HttpServlet{

	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
			String action=req.getParameter("action");
	
			if(action.equalsIgnoreCase("insert"))
			{
				ColorBean color=new ColorBean();
				color.setCnm(req.getParameter("colornm"));
				
				ColorDao sd=new ColorDao();
				sd.insertColor(color);
				req.getRequestDispatcher("ViewColor.jsp").forward(req, res);
			}
			else if(action.equalsIgnoreCase("Update")) //execute when clicked on update button from table
			{
				int id = Integer.parseInt(req.getParameter("id"));
				ColorDao cd = new ColorDao();
				ColorBean cb = cd.getColorById(id);
				req.setAttribute("id", cb);
				req.getRequestDispatcher("updatecolor.jsp").forward(req, res);
			}
			else if(action.equalsIgnoreCase("save")) //execute when clicked on save button of updateColor form
			{
				ColorBean cb = new ColorBean();
				cb.setCid(Integer.parseInt(req.getParameter("id")));
				cb.setCnm(req.getParameter("updatecolor"));
				ColorDao cd = new ColorDao();
				cd.updateColor(cb);
				req.getRequestDispatcher("ViewColor.jsp").forward(req, res);
			}
			else if(action.equalsIgnoreCase("delete"))
			{
				int id = Integer.parseInt(req.getParameter("id"));
				ColorDao cd = new ColorDao();
				ColorBean cb = cd.getColorById(id);
				cd.deleteColor(cb);
				req.getRequestDispatcher("ViewColor.jsp").forward(req, res);
			}
	}
}
