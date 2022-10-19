package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.StateBean;
import com.dao.StateDao;

@WebServlet("/statecontroller")
public class StateController extends HttpServlet{

	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
			String action=req.getParameter("action");
	
			if(action.equalsIgnoreCase("insert"))
			{
				StateBean state=new StateBean();
				state.setSnm(req.getParameter("statenm"));
				
				StateDao sd=new StateDao();
				sd.insertState(state);
				req.getRequestDispatcher("ViewState.jsp").forward(req, res);
			}
			else if(action.equalsIgnoreCase("Update")) //execute when clicked on update button from table
			{
				int id = Integer.parseInt(req.getParameter("id"));
				StateDao sd = new StateDao();
				StateBean sb = sd.getStateById(id);
				req.setAttribute("id", sb);
				req.getRequestDispatcher("updatestate.jsp").forward(req, res);
			}
			else if(action.equalsIgnoreCase("save")) //execute when clicked on save button of updateState form
			{
				StateBean sb = new StateBean();
				sb.setSid(Integer.parseInt(req.getParameter("id")));
				sb.setSnm(req.getParameter("updatestate"));
				StateDao sd = new StateDao();
				sd.updateState(sb);
				req.getRequestDispatcher("ViewState.jsp").forward(req, res);
			}
	}
}
