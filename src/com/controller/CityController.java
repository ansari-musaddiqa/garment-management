package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.CityBean;
import com.bean.StateBean;
import com.dao.CityDao;
import com.dao.StateDao;

@WebServlet("/citycontroller")
public class CityController extends HttpServlet{
	
	String city1;
	int state1;
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String action=req.getParameter("action");
		if(action.equalsIgnoreCase("insert"))
		{
			CityBean cb=new CityBean();
			cb.setCnm(req.getParameter("cityName"));
			cb.setSid(Integer.parseInt(req.getParameter("stateName")));
			CityDao cd=new CityDao();
			cd.insertcity(cb);
			req.getRequestDispatcher("ViewCity.jsp").forward(req,res);
		}

		else if(action.equalsIgnoreCase("Update")) //execute when clicked on update button from table
		{
			int id = Integer.parseInt(req.getParameter("id"));
			CityDao cd = new CityDao();
			CityBean cb = cd.getCityById(id);
			city1=cb.getCnm();
			state1=cb.getSid();
			req.setAttribute("id", cb);
			req.getRequestDispatcher("updatecity.jsp").forward(req, res);
		}
		
		else if(action.equalsIgnoreCase("save")) //execute when clicked on save button of updateColor form
		{
			CityBean cb = new CityBean();
			cb.setCid(Integer.parseInt(req.getParameter("id")));
			cb.setCnm(req.getParameter("updatecity"));
			String temp=req.getParameter("stateName");
			CityDao cd = new CityDao();
			if(temp == null)
			{	
				cd.updateCity(cb,city1,state1);
			}
			else
			{
				state1=Integer.parseInt(req.getParameter("stateName"));
				cd.updateCity(cb,city1,state1);
			}
			req.getRequestDispatcher("ViewCity.jsp").forward(req, res);
		}

		else if(action.equalsIgnoreCase("Delete"))
		{
			CityBean cb=new CityBean();
			cb.setCid(Integer.parseInt(req.getParameter("id")));
			CityDao cd=new CityDao();
			cd.deleteCity(cb);
			req.getRequestDispatcher("ViewCity.jsp").forward(req, res);
		}

	}
}
