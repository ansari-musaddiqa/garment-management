package com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.MaterialBean;
import com.dao.MaterialDao;
@WebServlet("/materialcontroller")
public class MaterialController extends HttpServlet {
	
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String action=req.getParameter("action");
		if(action.equalsIgnoreCase("insert"))
		{
			MaterialBean mb=new MaterialBean();
			mb.setMname(req.getParameter("materialname"));
			mb.setStatus(1);
			MaterialDao md=new MaterialDao();
			md.insertMaterial(mb);
			req.getRequestDispatcher("ViewMaterial.jsp").forward(req, res);
		}
		
		if(action.equalsIgnoreCase("Update"))//execute when clicked on update button from table
		{
			int id=Integer.parseInt(req.getParameter("id"));
			MaterialDao md=new MaterialDao();
			MaterialBean mb=md.getMaterialById(id);
			req.setAttribute("id", mb);
			req.getRequestDispatcher("updateMaterial.jsp").forward(req, res);
		}
		if(action.equalsIgnoreCase("save"))////execute when clicked on save button of updateState form
		{
		  MaterialBean mb=new MaterialBean();
		  mb.setMname(req.getParameter("upmat_name"));
		  mb.setMid(Integer.parseInt(req.getParameter("id")));
		  MaterialDao md=new MaterialDao();
		  md.updateMaterial(mb);
		  req.getRequestDispatcher("ViewMaterial.jsp").forward(req, res);
		}
		if(action.equalsIgnoreCase("delete"))
		{
			//MaterialBean bean=new MaterialBean();
			//bean.setMid(Integer.parseInt(req.getParameter("id")));
			int id=Integer.parseInt(req.getParameter("id"));
			MaterialDao dao=new MaterialDao();
			dao.deleteByid(id);
			req.getRequestDispatcher("ViewMaterial.jsp").forward(req, res);	
		}
	}

}
