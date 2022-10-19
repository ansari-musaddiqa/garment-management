package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.MainCategoryBean;
import com.dao.MainCategoryDao;

@WebServlet("/maincategorycontroller")
public class MainCategoryController extends HttpServlet{
	
	String main_cat;
	int cat_id;
	
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String action=req.getParameter("action");
		
		if(action.equalsIgnoreCase("insert"))
		{
			MainCategoryBean bean=new MainCategoryBean();
			bean.setMain_cat_name(req.getParameter("main_cat_name"));
			bean.setCat_type_id(Integer.parseInt(req.getParameter("cat_type_id")));
			bean.setDesc(req.getParameter("description"));
			
			MainCategoryDao dao=new MainCategoryDao();
			dao.insertMainCategory(bean);
			
			req.getRequestDispatcher("ViewMainCategory.jsp").forward(req, res);
		}
		
		else if(action.equalsIgnoreCase("update"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			System.out.print(id);
			MainCategoryDao dao=new MainCategoryDao();
			MainCategoryBean bean=dao.getMainCategoryById(id);
			//main_cat=bean.getMain_cat_name();
			//cat_id=bean.getCat_type_id();
			req.setAttribute("id", bean);
			req.getRequestDispatcher("updateMainCategory.jsp").forward(req, res);
		}
		else if(action.equalsIgnoreCase("save"))
		{
			
			int id=Integer.parseInt(req.getParameter("id"));
			System.out.println("update to be id:"+id);
			MainCategoryBean mb = new MainCategoryBean();
			MainCategoryDao dao=new MainCategoryDao();
			mb=dao.getMainCategoryById(id);
		
			if(req.getParameter("cat_type")!=null)
			{
				System.out.println("in if of category name if it is not null or changed "+mb.getCat_type_id());
				mb.setCat_type_id(Integer.parseInt(req.getParameter("cat_type")));
				System.out.println("in if of category name if it is not null or changed "+mb.getCat_type_id());
			}
			if(req.getParameter("main_cat_nm")!=null)
			{
				mb.setMain_cat_name(req.getParameter("main_cat_nm"));
			}
			if(req.getParameter("des")!=null)
			{
				mb.setDesc(req.getParameter("des"));
			}
			dao.updateMainCategory(mb);
			req.getRequestDispatcher("ViewMainCategory.jsp").forward(req, res);
		}
		
		else if(action.equalsIgnoreCase("delete"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			MainCategoryDao dao=new MainCategoryDao();
			dao.deleteByid(id);
			req.getRequestDispatcher("ViewMainCategory.jsp").forward(req, res);
		}
	}
}
