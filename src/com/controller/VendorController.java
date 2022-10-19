package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.VendorBean;
import com.dao.VendorDao;

@WebServlet("/vendorcontroller")
public class VendorController extends HttpServlet{
	
	String fnm,lnm,add,email;
	int city,state;
	long phn;
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String action = req.getParameter("action");
		
		if(action.equalsIgnoreCase("insert"))
		{
			VendorBean vb = new VendorBean();
			vb.setF_nm(req.getParameter("fname"));
			vb.setL_nm(req.getParameter("lname"));
			vb.setAdres(req.getParameter("add"));
			vb.setC_id(Integer.parseInt(req.getParameter("cityName")));
			vb.setS_id(Integer.parseInt(req.getParameter("stateName")));
			vb.setMo_no(Long.parseLong(req.getParameter("mo_num")));
			vb.setEmail(req.getParameter("eml"));
			
			VendorDao vd = new VendorDao();
			vd.insertVendor(vb);
			req.getRequestDispatcher("ViewVendor.jsp").forward(req, res);
		}
		
		else if(action.equalsIgnoreCase("Update")) //execute when clicked on update button from table
		{
			int id = Integer.parseInt(req.getParameter("id"));
			VendorDao vd = new VendorDao();
			VendorBean vb = vd.getVendorById(id);
			fnm = vb.getF_nm();
			lnm = vb.getL_nm();
			add = vb.getAdres();
			email = vb.getEmail();
			phn = vb.getMo_no();
			city = vb.getC_id();
			state=vb.getS_id();
			req.setAttribute("id", vb);
			req.getRequestDispatcher("updateVendor.jsp").forward(req, res);
		}
		
		else if(action.equalsIgnoreCase("save")) //execute when clicked on save button of updateColor form
		{
			String fnm1,lnm1,add1,eml1,tmp,temp,phn1;
			VendorBean vb = new VendorBean();
			vb.setV_id(Integer.parseInt(req.getParameter("id")));
			fnm1 = req.getParameter("fname");
			lnm1 = req.getParameter("lname");
			add1 = req.getParameter("add");
			phn1 = req.getParameter("phn");
			eml1 = req.getParameter("eml");
			tmp = req.getParameter("cityName");
			temp = req.getParameter("stateName");
			VendorDao vd = new VendorDao();
			if(fnm1 == null || lnm1 == null || add1 == null || phn1 == null || eml1 == null || tmp == null || temp == null)
			{
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
					phn = Long.parseLong(phn1);
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
			}
			else
			{
				fnm = fnm1;
				lnm = lnm1;
				add = add1;
				phn = Long.parseLong(phn1);
				email = eml1;
				city = Integer.parseInt(tmp);
				state = Integer.parseInt(temp);
			}
			vb.setF_nm(fnm);
			vb.setL_nm(lnm);
			vb.setAdres(add);
			vb.setMo_no(phn);
			vb.setEmail(email);
			vb.setC_id(city);
			vb.setS_id(state);
			vd.updateVendor(vb);
			req.getRequestDispatcher("ViewVendor.jsp").forward(req, res);
		}
		
		else if(action.equalsIgnoreCase("delete"))
		{
			int id = Integer.parseInt(req.getParameter("id"));
			VendorDao vd = new VendorDao();
			VendorBean vb = vd.getVendorById(id);
			vd.deleteVendor(vb);
			req.getRequestDispatcher("ViewVendor.jsp").forward(req, res);
		}
	}
}
