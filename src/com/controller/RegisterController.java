package com.controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bean.RegisterBean;
import com.connect.Connect;
import com.dao.RegisterDao;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

@WebServlet("/registercontroller")
@MultipartConfig(fileSizeThreshold=1024*1024*10,maxFileSize=1024*1024*50,maxRequestSize=1024*1024*100)
public class RegisterController extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String action=req.getParameter("action");
		if(action.equalsIgnoreCase("insert"))
		{
			Part part = req.getPart("image");
			String path = req.getServletContext().getRealPath("/") + "\\upload\\" + part.getSubmittedFileName();
			part.write(path);
			
			RegisterBean bean=new RegisterBean();
			bean.setFirst_name(req.getParameter("fname"));
			bean.setLast_name(req.getParameter("lname"));
			bean.setAddress(req.getParameter("add"));
			bean.setCity_id(Integer.parseInt(req.getParameter("cityname")));
			bean.setState_id(Integer.parseInt(req.getParameter("statename")));
			bean.setPhoneno(Long.parseLong(req.getParameter("contact")));
			bean.setEmail(req.getParameter("email"));
			bean.setShop_id(Integer.parseInt(req.getParameter("shop")));
			bean.setPhoto(part.getSubmittedFileName());
			bean.setUname(req.getParameter("uname"));
			bean.setPassword(req.getParameter("pass"));
			bean.setJob_type_id(Integer.parseInt(req.getParameter("empType")));
			bean.setWork_id(Integer.parseInt(req.getParameter("jobworktype_name")));
			
			
			RegisterDao dao=new RegisterDao();
			dao.insertEmployee(bean);
			
			req.getRequestDispatcher("ViewEmployees.jsp").forward(req, res);
		}
		if(action.equalsIgnoreCase("delete"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			RegisterDao dao=new RegisterDao();
			dao.deleteById(id);
			req.getRequestDispatcher("ViewEmployees.jsp").forward(req, res);
		}
		if(action.equalsIgnoreCase("update"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			RegisterDao dao=new RegisterDao();
			RegisterBean bean=dao.getUserById(id);
			req.setAttribute("upid", bean);
			req.getRequestDispatcher("updateEmployee.jsp").forward(req, res);
		}
		if(action.equalsIgnoreCase("save"))
		{
			int f=0;
			//RegisterBean bean=new RegisterBean();
			int id=Integer.parseInt(req.getParameter("id"));
			RegisterBean b=new RegisterBean();
			try
			{
				Connection cn=(Connection)Connect.sqlConnection();
				
				String sel="select * from `employee_registration` where emp_id='"+id+"'";
				//System.out.println("id:"+id);
				PreparedStatement ps1=(PreparedStatement) cn.prepareStatement(sel);
				ResultSet rs1=ps1.executeQuery();
			  if(rs1.next())
			  {
				String fn=rs1.getString("first_name");
				String ln=rs1.getString("last_name");
				String add=rs1.getString("emp_add");
				int job_type_id=rs1.getInt("job_type_id");
				int work_id=rs1.getInt("work_id");
				String user=rs1.getString("user_name");
				int city_id=rs1.getInt("city_id");
				int state_id=rs1.getInt("state_id");
				long phone=rs1.getLong("phoneno");
				String email=rs1.getString("email");
				String ph=rs1.getString("photo");
				int isactive=rs1.getInt("isactive");		
				int shop_id=rs1.getInt("shop_id");
				
				if(req.getParameter("firstname")!=null)
				{
					fn=req.getParameter("firstname");
					//System.out.println("fn:"+fn);
				}
				if(req.getParameter("lastname")!=null)
				{
					ln=req.getParameter("lastname");
				}
				if(req.getParameter("address")!=null)
				{
					add=req.getParameter("address");
				}
				if(req.getParameter("cityName")!=null)
				{
					city_id=Integer.parseInt(req.getParameter("cityName"));
				}
				if(req.getParameter("stateName")!=null)
				{
					state_id=Integer.parseInt(req.getParameter("stateName"));
				}
				if(req.getParameter("contactnum")!=null)
				{
					phone=Long.parseLong(req.getParameter("contactnum"));
				}
				if(req.getParameter("email")!=null)
				{
					email=req.getParameter("email");
				}
				if(req.getParameter("shop")!=null)
				{
					shop_id=Integer.parseInt(req.getParameter("shop"));
				}
				if(req.getParameter("username")!=null)
				{
					user=req.getParameter("username");
				}
				if(req.getParameter("empType")!=null)
				{
					job_type_id=Integer.parseInt(req.getParameter("empType"));
				}
				if(req.getParameter("jobworkType")!=null)
				{
					work_id=Integer.parseInt(req.getParameter("jobworkType"));
				}
						
				if(req.getParameter("image")!=null)
				{
					Part part = req.getPart("image");
					String path = req.getServletContext().getRealPath("/") + "\\upload\\" + part.getSubmittedFileName();
					part.write(path);
			
					System.out.println("not null inside");
					b.setPhoto(part.getSubmittedFileName());	
					ph=b.getPhoto();
					//System.out.println("\t\t\t\tbean inside null:"+b.getPhoto());
				}
				else
				{
					System.out.println("\n\n\n\t\t\tnull inside");
					f++;
				}
					
					System.out.println("\n\n\n\t\tin part");
					Part part = req.getPart("image");
					if(part!=null)
					{
						String path = req.getServletContext().getRealPath("/") + "\\upload\\" + part.getSubmittedFileName();
						part.write(path);
			
						System.out.println("not null inside");
						b.setPhoto(part.getSubmittedFileName());	
						ph=b.getPhoto();
					}
					
					//System.out.println(ph);
				b.setPhoto(ph);
				b.setEmp_id(id);
				b.setAddress(add);
				b.setCity_id(city_id);
				b.setEmail(email);
				b.setFirst_name(fn);
				b.setJob_type_id(job_type_id);
				b.setLast_name(ln);
				b.setPhoneno(phone);
				b.setState_id(state_id);
				b.setStatus(isactive);
				b.setUname(user);
				b.setWork_id(work_id);
				b.setShop_id(shop_id);
				b.setStatus(isactive);
			  }
			  System.out.println(b.getFirst_name());
				RegisterDao dao=new RegisterDao();
				dao.updateRegister(b);
				req.getRequestDispatcher("ViewEmployees.jsp").forward(req, res);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
					}
	}
}