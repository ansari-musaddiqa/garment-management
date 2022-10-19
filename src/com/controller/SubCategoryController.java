package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.SubCategoryBean;
import com.dao.SubCategoryDao;

@WebServlet("/subcategorycontroller")
public class SubCategoryController extends HttpServlet{
	
	String sub_cat,desc;
	int main_cat_id;
	
	public  void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String action=req.getParameter("action");
		
		if(action.equalsIgnoreCase("insert"))
		{
			SubCategoryBean bean=new SubCategoryBean();
			bean.setSub_cat_name(req.getParameter("sub_cat_name"));
			bean.setMain_cat_id(Integer.parseInt(req.getParameter("main_cat_type_id")));
			bean.setDescrip(req.getParameter("description"));
			
			SubCategoryDao dao=new SubCategoryDao();
			dao.insertSubCategory(bean);
			req.getRequestDispatcher("ViewSubCategory.jsp").forward(req, res);
		}
		
		if(action.equalsIgnoreCase("update"))
		{
			int id = Integer.parseInt(req.getParameter("id"));
			SubCategoryDao sd = new SubCategoryDao();
			SubCategoryBean sb = sd.getSubCatById(id);
			sub_cat = sb.getSub_cat_name();
			main_cat_id = sb.getMain_cat_id();
			desc = sb.getDescrip();
			req.setAttribute("id", sb);
			req.getRequestDispatcher("updateSubCategory.jsp?id="+id).forward(req, res);
		}
		
		if(action.equalsIgnoreCase("save"))
		{
			SubCategoryBean sb = new SubCategoryBean();
			sb.setSub_cat_id(Integer.parseInt(req.getParameter("id")));
			String sub_cat1 = req.getParameter("sub_cat");
			String desc1 = req.getParameter("desc");
			String temp = req.getParameter("main_cat");
			SubCategoryDao sd = new SubCategoryDao();
			if(sub_cat1 == null || desc1 == null || temp == null)
			{	
				if(sub_cat1 != null)
				{
					sub_cat = sub_cat1;
				}
				if(desc1 != null)
				{
					desc = desc1;
				}
				if(temp != null)
				{
					main_cat_id = Integer.parseInt(temp);
				}
			}
			else
			{
				sub_cat = sub_cat1;
				desc = desc1;
				main_cat_id=Integer.parseInt(temp);
			}
			sb.setSub_cat_name(sub_cat);
			if(desc == null)
			{
				desc="";
			}
			sb.setDescrip(desc);
			sb.setMain_cat_id(main_cat_id);
			sd.updateSub_cat(sb);
			req.getRequestDispatcher("ViewSubCategory.jsp").forward(req, res);
		}
		
		if(action.equalsIgnoreCase("delete"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
		    SubCategoryDao dao=new SubCategoryDao();
			dao.deleteByid(id);
			req.getRequestDispatcher("ViewSubCategory.jsp").forward(req, res);
		}
		
	}

}
