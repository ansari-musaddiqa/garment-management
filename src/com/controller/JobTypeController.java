package com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.JobTypeBean;
import com.dao.JobTypeDao;
@WebServlet("/jobtypecontroller")
public class JobTypeController extends HttpServlet{
		
	 public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
		{
			String action=req.getParameter("action");
			if(action.equalsIgnoreCase("insert"))
			{
				JobTypeBean bean=new JobTypeBean();
				bean.setJob_name(req.getParameter("JobTypeName"));
				bean.setStatus(1);
				JobTypeDao dao=new JobTypeDao();
				dao.insertJobType(bean);
				req.getRequestDispatcher("ViewJobType.jsp").forward(req,res);
			}
			if(action.equalsIgnoreCase("delete"))
			{
				JobTypeDao dao=new JobTypeDao();
				dao.deleteById(Integer.parseInt(req.getParameter("id")));
				req.getRequestDispatcher("ViewJobType.jsp").forward(req,res);
			}
			if(action.equalsIgnoreCase("update"))
			{
				JobTypeDao dao=new JobTypeDao();
				JobTypeBean bean=dao.getJobTypeById(Integer.parseInt(req.getParameter("id")));
				req.setAttribute("upid",bean);
				req.getRequestDispatcher("UpdateJobType.jsp").forward(req,res);
			}
			if(action.equalsIgnoreCase("save"))
			{
				JobTypeBean bean=new JobTypeBean();
				bean.setJob_type_id(Integer.parseInt(req.getParameter("id")));
				bean.setJob_name(req.getParameter("JobTypeName"));
				System.out.println("controller jobname :"+bean.getJob_name());
				
				JobTypeDao dao=new JobTypeDao();
				dao.updateById(bean);
				req.getRequestDispatcher("ViewJobType.jsp").forward(req,res);
			}
		}
}
