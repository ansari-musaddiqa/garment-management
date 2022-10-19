package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.CityBean;
import com.bean.ShopBean;
import com.bean.VendorBean;
import com.dao.CityDao;
import com.dao.ShopDao;
import com.dao.VendorDao;

@WebServlet("/shopcontroller")
public class ShopController extends HttpServlet{

	String bnm="",add="",email="";
	int city=0,state=0;
	long phn=0;

	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String action=req.getParameter("action");
		if(action.equalsIgnoreCase("insert"))
		{
			ShopBean sb=new ShopBean();
			sb.setBnm(req.getParameter("branchname"));
			sb.setNum(Long.parseLong(req.getParameter("num")));
			
			sb.setAdd(req.getParameter("add"));
			sb.setCid(Integer.parseInt(req.getParameter("cityName")));
			sb.setSid(Integer.parseInt(req.getParameter("stateName")));
			
			ShopDao sd=new ShopDao();
			sd.insertShop(sb);
			
			req.getRequestDispatcher("ViewShop.jsp").forward(req, res);
		}
		else if(action.equalsIgnoreCase("Delete"))
		{
			ShopBean sb=new ShopBean();
			sb.setBid(Integer.parseInt(req.getParameter("id")));
			ShopDao sd=new ShopDao();
			sd.deleteShop(sb);
			req.getRequestDispatcher("ViewShop.jsp").forward(req, res);
		}
		else if(action.equalsIgnoreCase("Update")) //execute when clicked on update button from table
		{
			int id = Integer.parseInt(req.getParameter("id"));
			ShopDao sd = new ShopDao();
			ShopBean sb = sd.getShopById(id);
			bnm = sb.getBnm();
			add = sb.getAdd();
			//System.out.println("Hyy" + add);
			phn = sb.getNum();
			city = sb.getCid();
			state=sb.getSid();
			req.setAttribute("id", sb);
			req.getRequestDispatcher("updateShop.jsp").forward(req, res);
		}
		else if(action.equalsIgnoreCase("save")) //execute when clicked on save button of updateColor form
		{
			String bnm1,add1,tmp,temp,phn1;
			ShopBean sb = new ShopBean();
			sb.setBid(Integer.parseInt(req.getParameter("id")));
			bnm1 = req.getParameter("branchname");
			add1 = req.getParameter("add");
			phn1 = req.getParameter("num");
			tmp = req.getParameter("cityName");
			temp = req.getParameter("stateName");
			ShopDao sd = new ShopDao();
			if(bnm1 == null || add1 == null || phn1 == null || tmp == null || temp == null)
			{	
				if(bnm1 != null)
				{
					bnm = bnm1;
				}
				if(add1 != null)
				{
					add = add1;
				}
				if(phn1 != null)
				{
					phn = Long.parseLong(phn1);
				}
				if(tmp != null)
				{
					city = Integer.parseInt(tmp);
				}
				if(temp != null)
				{
					state = Integer.parseInt(temp);
				}

			}
			else
			{
				bnm = bnm1;
				add = add1;
				phn = Long.parseLong(phn1);
				city = Integer.parseInt(tmp);
				state = Integer.parseInt(temp);
			}
			sb.setBnm(bnm);
			sb.setAdd(add);
			sb.setNum(phn);
			sb.setCid(city);
			sb.setSid(state);
			sd.updateShop(sb);
		
			req.getRequestDispatcher("ViewShop.jsp").forward(req, res);
		}

	}
}
	