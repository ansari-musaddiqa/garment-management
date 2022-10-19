package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.CustomerBean;
import com.bean.OrderBean;
import com.bean.ProductBean;
import com.dao.CustomerDao;
import com.dao.OrderDao;
import com.dao.ProductDao;


@WebServlet("/ordercontroller")
public class OrderController extends HttpServlet{
	
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		
		String total;
		String action=req.getParameter("action");
		
		if(action.equalsIgnoreCase("insert"))
		{
			OrderBean bean=new OrderBean();
			bean.setCode(req.getParameter("code"));
			bean.setQty(Integer.parseInt(req.getParameter("qty")));
			if(req.getParameter("options_cust").equalsIgnoreCase("yes"))
			{
			bean.setCustomization(1);
			bean.setJob_work_Type_id(Integer.parseInt(req.getParameter("job_work_type")));
			bean.setJob_work_charges(Integer.parseInt(req.getParameter("jobworkcharge")));
			}
			else
			{
				bean.setCustomization(0);	
			}
			bean.setDescription(req.getParameter("descrp"));
			OrderDao dao=new OrderDao();
			List<OrderBean> list=new ArrayList<OrderBean>();
			list=dao.insertOrderSummary(bean);
			total=Long.toString(dao.getTotalPayment());
			req.setAttribute("total", total);
			req.setAttribute("show", list);
			req.getRequestDispatcher("AddOrder1.jsp").forward(req,res);
		}
		if(action.equalsIgnoreCase("viewdetails"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			OrderDao dao=new OrderDao();
			List<OrderBean> list=dao.getOrderDetailsByOrderId(id);
			req.setAttribute("or_de_by_id", list);
			req.getRequestDispatcher("ViewOrderDetailsById.jsp").forward(req,res);
		}
		if(action.equalsIgnoreCase("placeorder"))
		{
			System.out.println("Farha the great");
			OrderBean cb=new OrderBean();
			System.out.println("Farha the great"+req.getParameter("custname"));
			
			cb.setCust_id(Integer.parseInt(req.getParameter("custname")));
			cb.setEmp_id(Integer.parseInt(req.getParameter("empname")));
			cb.setDate_of_return(req.getParameter("returndt"));
			cb.setTotal_payment(Long.parseLong(req.getParameter("ttlpmnt")));
			cb.setRcv_payment(Long.parseLong(req.getParameter("rcvpmnt")));
			//cb.setRcv_payment(Long.parseLong(req.getParameter("")));
			HttpSession ses=req.getSession();
			int shop=(int) ses.getAttribute("shop");
			cb.setShop_id(shop);
			OrderDao d=new OrderDao();
			try {
				d.insertIntoOrderMaster(cb);				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			req.getRequestDispatcher("ViewOrder1.jsp").forward(req,res);
		}
		if(action.equalsIgnoreCase("remove"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			OrderDao dao=new OrderDao();
			dao.deleteOrderSummaryById(id);
			List<OrderBean> list=new ArrayList<OrderBean>();
			list=dao.getAllOrderSummary();
			total=Long.toString(dao.getTotalPayment());
			req.setAttribute("total", total);
			req.setAttribute("show", list);
			req.getRequestDispatcher("AddOrder1.jsp").forward(req,res);
		}
		if(action.equalsIgnoreCase("assignjobwork"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			req.setAttribute("ordeid", id);
			req.getRequestDispatcher("AssignJobWork.jsp").forward(req,res);
		}
		if(action.equalsIgnoreCase("assign"))
		{
			int id=Integer.parseInt(req.getParameter("forid"));
			
			OrderBean bean=new OrderBean();
			bean.setOrder_d_id(id);
			bean.setWorker_id(Integer.parseInt(req.getParameter("job_worker")));
			bean.setDate_of_return(req.getParameter("returndt"));
			bean.setWorker_charges(Long.parseLong(req.getParameter("charges")));
			bean.setWorker_paid_amt(Long.parseLong(req.getParameter("paidamt")));
			bean.setDescription(req.getParameter("descrp"));
			
			System.out.println("\nMusaddiqa Controller:worker amt :"+req.getParameter("charges"));
			OrderDao dao=new OrderDao();
			System.out.println("\nMusaddiqa Controller:assign id :"+id);
			dao.insertIntoJoworkerPayment(bean);
			req.getRequestDispatcher("ViewJobWorkPayment1.jsp").forward(req,res);
		}
		if(action.equalsIgnoreCase("updatejobwork"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			req.setAttribute("upordeid", id);
			req.getRequestDispatcher("UpdateJobWorkPayment.jsp").forward(req,res);
		}
		if(action.equalsIgnoreCase("updatejobworkform"))
		{
			int id=Integer.parseInt(req.getParameter("id"));
			OrderBean bean=new OrderBean();
			OrderDao dao=new OrderDao();
			bean=dao.getWokerPaymentDetailsById(id);
			System.out.println("\t\t\t\t\t\t\tmaaz been.getjobworker_payid()"+bean.getJobworker_pay_id());
				if(!(req.getParameter("job_worker").equals("job_worker")))
				{
					System.out.println("\n\nreturn date"+req.getParameter("job_worker"));
					bean.setWorker_id(Integer.parseInt(req.getParameter("job_worker")));
				}
				if(!(req.getParameter("returndt").equalsIgnoreCase("")))
				{
					System.out.println("\n\nreturn date"+req.getParameter("returndt"));
					bean.setDate_of_return(req.getParameter("returndt"));
				}
				if(!(req.getParameter("charges").equalsIgnoreCase("")))
				{
					bean.setWorker_charges(Long.parseLong(req.getParameter("charges")));
				}
				if(!(req.getParameter("paidamt").equalsIgnoreCase("")))
				{
					bean.setWorker_paid_amt(Long.parseLong(req.getParameter("paidamt")));
				}
				if(req.getParameter("descrp")!=null)
				{
					bean.setDescription(req.getParameter("descrp"));
				}
				System.out.println("\nMusaddiqa Controller");
				dao.updateWorkerPaymentDetailsById(bean);
				req.getRequestDispatcher("ViewJobWorkPayment1.jsp").forward(req,res);
		}
		if(action.equalsIgnoreCase("complete"))
		{
			OrderDao dao=new OrderDao();
			int id=Integer.parseInt(req.getParameter("id"));
			int orderstatus=Integer.parseInt(req.getParameter("orderstatus"));
			System.out.println("\t\ttOrder status "+orderstatus);
			dao.CompleteOrderById(id,orderstatus);
			req.getRequestDispatcher("ViewOrder1.jsp").forward(req,res);
		}
		if(action.equalsIgnoreCase("completeJobwork"))
		{
			OrderDao dao=new OrderDao();
			int id=Integer.parseInt(req.getParameter("id"));
			dao.CompleteJobWorkOrderById(id);
			req.getRequestDispatcher("ViewOrder1.jsp").forward(req,res);
		}
		if(action.equalsIgnoreCase("show")) //execute when clicked on show report button
		{
			String shop = req.getParameter("shop");
			int bid;
			if(shop.equals("Shop"))
			{
				bid = 0;
			}
			else
			{
				bid = Integer.parseInt(shop);
			}

			System.out.print("Start Date : "+req.getParameter("trip-start")+"\nTo date : "+req.getParameter("to")+"\nshop : "+bid);
			
			OrderBean ob = new OrderBean();
			ob.setShop_id(bid);
			ob.setFrmdt(req.getParameter("trip-start"));
			ob.setTodt(req.getParameter("to"));
			
			OrderDao dao = new OrderDao();
			List<OrderBean> list = dao.getAllOrderReport(ob);
			
			req.setAttribute("show",list);
			req.getRequestDispatcher("OrderReport.jsp").forward(req, res);
		}
	}
}
