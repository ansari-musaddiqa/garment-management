package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.CustomerBean;
import com.bean.VendorBean;
import com.dao.CustomerDao;
import com.dao.VendorDao;

@WebServlet("/customercontroller")
public class CustomerController extends HttpServlet 
{
	String fnm,lnm,add,email;
	int city,state;
	long phn;
	
		public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
		{
			String action=req.getParameter("action");
			if(action.equalsIgnoreCase("insert"))
			{
				CustomerBean cb=new CustomerBean();
				cb.setFname(req.getParameter("fname"));
				cb.setLname(req.getParameter("lname"));
				cb.setAdd(req.getParameter("add"));
				cb.setCid(Integer.parseInt(req.getParameter("cityName")));
				cb.setSid(Integer.parseInt(req.getParameter("stateName")));
				cb.setNum(Long.parseLong(req.getParameter("num")));
				cb.setEmail(req.getParameter("eml"));
				
				CustomerDao cd=new CustomerDao();
				cd.insertcustomer(cb);
				
				req.getRequestDispatcher("ViewCustomer.jsp").forward(req, res);
			}
			else if(action.equalsIgnoreCase("Update")) //execute when clicked on update button from table
			{
				int id = Integer.parseInt(req.getParameter("id"));
				CustomerDao cd = new CustomerDao();
				CustomerBean cb = cd.getCustomerById(id);
				fnm = cb.getFname();
				lnm = cb.getLname();
				add = cb.getAdd();
				email = cb.getEmail();
				phn = cb.getNum();
				city = cb.getCid();
				state=cb.getSid();
				req.setAttribute("id", cb);
				req.getRequestDispatcher("updateCustomer.jsp").forward(req, res);
			}
			else if(action.equalsIgnoreCase("delete"))
			{
				int id = Integer.parseInt(req.getParameter("id"));
				CustomerDao cd = new CustomerDao();
				CustomerBean cb = cd.getCustomerById(id);
				cd.deleteByid(id);
				req.getRequestDispatcher("ViewCustomer.jsp").forward(req, res);
			}
			else if(action.equalsIgnoreCase("save")) //execute when clicked on save button of updateColor form
			{
				String fnm1,lnm1,add1,eml1,tmp,temp,phn1;
				CustomerBean cb = new CustomerBean();
				fnm1 = req.getParameter("fname");
				lnm1 = req.getParameter("lname");
				add1 = req.getParameter("add");
				phn1 = req.getParameter("phn");
				eml1 = req.getParameter("eml");
				tmp = req.getParameter("cityName");
				temp = req.getParameter("stateName");
				CustomerDao cd = new CustomerDao();
					if(fnm1 != null)
					{
						fnm = fnm1;
					}
					if(lnm1 != null)
					{
						lnm = lnm1;
					}
					if(add1 != null)
					{
						add = add1;
					}
					if(phn1 != null)
					{
						System.out.println("Before phone np:"+phn);
						phn = Long.parseLong(phn1);
						System.out.println("phone np:"+phn);
					}
					if(eml1 != null)
					{
						email = eml1;
					}
					if(tmp != null)
					{
						city = Integer.parseInt(tmp);
					}
					if(temp != null)
					{
						state = Integer.parseInt(temp);
					}
				cb.setCustid(Integer.parseInt(req.getParameter("id")));
				cb.setFname(fnm);
				cb.setLname(lnm);
				cb.setAdd(add);
				cb.setNum(phn);
				cb.setEmail(email);
				cb.setCid(city);
				cb.setSid(state);
				System.out.println("update to be phn is"+cb.getNum());
				cd.updateCustomerById(cb);
				req.getRequestDispatcher("ViewCustomer.jsp").forward(req, res);
			}
		}
}