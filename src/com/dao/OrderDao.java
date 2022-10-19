package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.bean.OrderBean;
import com.connect.Connect;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class OrderDao {
	private long total=0;
	private int or_id=0;
	public List<OrderBean> insertOrderSummary(OrderBean b)
	{
		List<OrderBean> l=new ArrayList<OrderBean>();
		try
		{
			Connection cn=Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			
			if(b.getCustomization()==1)
			{
					String query="insert into order_summary(code,prod_id,unit_cost,qty,customization,cust_charges,sub_total,work_id,des) values(?,?,?,?,?,?,?,?,?)";
					PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
					
					
					String q="SELECT * FROM product WHERE CODE=?";
					PreparedStatement ps1=(PreparedStatement) cn.prepareStatement(q);
					ps1.setString(1, b.getCode());
					ResultSet rs=ps1.executeQuery();
					int p=1;
					if(rs.next())
					{
						ps.setInt(2,rs.getInt("prod_id"));
						ps.setInt(3, rs.getInt("price"));
						p=rs.getInt("price");
					}
					ps.setString(1, b.getCode());
					
					ps.setInt(4, b.getQty());
					
					
				
					ps.setInt(5, b.getCustomization());
					ps.setInt(6, b.getJob_work_charges());
					int ch=b.getJob_work_charges();
					int q1=b.getQty();
					long result=(q1*p)+ch;
					ps.setLong(7,result);
					ps.setInt(8, b.getJob_work_Type_id());
					ps.setString(9, b.getDescription());
					ps.executeUpdate();
					l=getAllOrderSummary();
					return l;
			}
			else
			{
				String query="insert into order_summary(code,prod_id,unit_cost,qty,customization,sub_total,des) values(?,?,?,?,?,?,?)";
				PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
				
				
				String q="SELECT * FROM product WHERE CODE=?";
				PreparedStatement ps1=(PreparedStatement) cn.prepareStatement(q);
				ps1.setString(1, b.getCode());
				ResultSet rs=ps1.executeQuery();
				int p=1;
				if(rs.next())
				{
					ps.setInt(2,rs.getInt("prod_id"));
					ps.setInt(3, rs.getInt("price"));
					p=rs.getInt("price");
				}
				ps.setString(1, b.getCode());
				
				ps.setInt(4, b.getQty());
				ps.setInt(5, b.getCustomization());
				int q1=b.getQty();
				long result=q1*p;
				System.out.println("\n\n\tqty in order dao :"+q1);
				System.out.println("\n\n\tprice in order dao :"+p);
				
				System.out.println("\n\n\tresult in order dao :"+result);
				ps.setLong(6,result);
				ps.setString(7, b.getDescription());
				ps.executeUpdate();
				l=getAllOrderSummary();
				return l;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	public List<OrderBean> getAllOrderSummary()
	{
		List<OrderBean> list=new ArrayList<OrderBean>();
		try
		{
			Connection cn=Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query="SELECT * FROM order_summary INNER JOIN `product` ON order_summary.`prod_id`=product.`prod_id` INNER JOIN color ON color.`color_id`=product.`color_id` INNER JOIN size ON size.`size_id`=product.`size_id` INNER JOIN typeofwork ON typeofwork.`work_id`=order_summary.`work_id`";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				OrderBean bean=new OrderBean();
				bean.setSummary_id(rs.getInt("summary_id"));
				bean.setProd_id(rs.getInt("prod_id"));
				bean.setProd_name(rs.getString("prod_name"));
				bean.setCode(rs.getString("code"));
				bean.setColor_id(rs.getInt("color_id"));
				bean.setColor_name(rs.getString("color_name"));
				bean.setSize_id(rs.getInt("size_id"));
				bean.setSize_name(rs.getString("size_unit"));
				bean.setQty(rs.getInt("qty"));
				bean.setCustomization(rs.getInt("customization"));
				bean.setJob_work_Type_id(rs.getInt("work_id"));
				bean.setJob_work_type_name(rs.getString("work_name"));
				bean.setJob_work_charges(rs.getInt("cust_charges"));
				bean.setUnit_cost(rs.getInt("price"));
				bean.setDescription(rs.getString("des"));	
				bean.setSubtotal(rs.getLong("sub_total"));
				total=total+rs.getLong("sub_total");
				list.add(bean);
			}
			
			
			String query2="SELECT * FROM order_summary INNER JOIN `product` ON order_summary.`prod_id`=product.`prod_id` INNER JOIN color ON color.`color_id`=product.`color_id` INNER JOIN size ON size.`size_id`=product.`size_id`WHERE work_id IS NULL";
			PreparedStatement ps2=(PreparedStatement) cn.prepareStatement(query2);
			ResultSet rs2=ps2.executeQuery();
			while(rs2.next())
			{
				OrderBean bean=new OrderBean();
				bean.setSummary_id(rs2.getInt("summary_id"));
				bean.setProd_id(rs2.getInt("prod_id"));
				bean.setProd_name(rs2.getString("prod_name"));
				bean.setCode(rs2.getString("code"));
				bean.setColor_id(rs2.getInt("color_id"));
				bean.setColor_name(rs2.getString("color_name"));
				bean.setSize_id(rs2.getInt("size_id"));
				bean.setSize_name(rs2.getString("size_unit"));
				bean.setQty(rs2.getInt("qty"));
				bean.setCustomization(rs2.getInt("customization"));
				System.out.println("summary Id");
				bean.setUnit_cost(rs2.getInt("price"));
				bean.setDescription(rs2.getString("des"));	
				bean.setSubtotal(rs2.getLong("sub_total"));
				total=total+rs2.getLong("sub_total");
				list.add(bean);
			}
			return list;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	public long getTotalPayment()
	{
		return total;
	}
	public void deleteOrderSummaryById(int id)
	{
		try
		{
			Connection cn=Connect.sqlConnection();
			String query="delete from order_summary where summary_id='"+id+"'";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public void insertIntoOrderMaster(OrderBean b) throws SQLException
	{
		try
		{
					Connection cn=Connect.sqlConnection();
					DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
					LocalDateTime now=LocalDateTime.now();
					String query="insert into order_master(cus_id,emp_id,shop_id,grand_total,paid_amount,due_amount,order_status,date_of_return,doi,dou,isactive) values(?,?,?,?,?,?,?,?,'"+dtf.format(now)+"','"+dtf.format(now)+"',1)";
					PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
					ps.setInt(1, b.getCust_id());
					ps.setInt(2, b.getEmp_id());
					ps.setInt(3, b.getShop_id());
					ps.setLong(4, b.getTotal_payment());
					if(b.getRcv_payment()>b.getTotal_payment())
					{
						b.setRcv_payment(b.getTotal_payment());						
					}
					ps.setLong(5, b.getRcv_payment());
					long due_amt=b.getTotal_payment()-b.getRcv_payment();
					ps.setLong(6, due_amt);
					
					String q="SELECT * FROM order_summary";
					PreparedStatement ps1=(PreparedStatement) cn.prepareStatement(q);
					ResultSet rs=ps1.executeQuery();
					int m=0;
					while(rs.next())
					{
						if(rs.getInt("customization")==1)
						{
							m++;
						}
						
					}
					if(m==0)
					{
						ps.setInt(7, 1);
					}
					else
					{
						ps.setInt(7, 0);
					}
						ps.setString(8, b.getDate_of_return());
					ps.executeUpdate();
					
					String or_idq="select * from order_master where doi='"+dtf.format(now)+"'";
					PreparedStatement or_id_ps=(PreparedStatement) cn.prepareStatement(or_idq);
					ResultSet result=or_id_ps.executeQuery();
					while(result.next())
					{
						if(or_id<result.getInt("order_id"))
						{
							or_id=result.getInt("order_id");
						}
					}
					
					insertIntoOrderDetails();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public void insertIntoOrderDetails() throws SQLException
	{
		try
		{
					Connection cn=Connect.sqlConnection();
					DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
					LocalDateTime now=LocalDateTime.now();
					
					
					
									String q="SELECT * FROM order_summary where work_id is not null";
									PreparedStatement ps2=(PreparedStatement) cn.prepareStatement(q);
									ResultSet rs2=ps2.executeQuery();
									while(rs2.next())
									{
										String query="insert into order_details(order_id,prod_id,code,unit_cost,qty,customization,cust_charges,sub_total,work_id,descr,doi,dou,isactive,assign) values(?,?,?,?,?,?,?,?,?,?,'"+dtf.format(now)+"','"+dtf.format(now)+"',?,?)";
										PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);	
										//ps.setInt(1, rs1.getInt("order_id"));
										ps.setInt(1, or_id);
										ps.setInt(2, rs2.getInt("prod_id"));
										ps.setInt(3, rs2.getInt("code"));
										ps.setInt(4, rs2.getInt("unit_cost"));		
										ps.setInt(5, rs2.getInt("qty"));
										
										String proq="select * from product where code='"+rs2.getInt("code")+"'";
										PreparedStatement proqps=(PreparedStatement) cn.prepareStatement(proq);
										ResultSet prodres=proqps.executeQuery();
										
										int nowqty=0;
										if(prodres.next())
										{
											nowqty=prodres.getInt("qty")-rs2.getInt("qty");
										}
										String proqq="update product set qty='"+nowqty+"' where code='"+rs2.getInt("code")+"'";
										PreparedStatement proqqps=(PreparedStatement) cn.prepareStatement(proqq);
										proqqps.executeUpdate();
										
										
										ps.setInt(6, rs2.getInt("customization"));							
										ps.setInt(7, rs2.getInt("cust_charges"));
										ps.setLong(8, rs2.getLong("sub_total"));
										ps.setInt(9, rs2.getInt("work_id"));
										ps.setString(10, rs2.getString("des"));
										
										if(rs2.getInt("customization")==1)
										{
											ps.setInt(11, 0);
											ps.setInt(12,0);
										}
										else
										{
											ps.setInt(11, 1);
											ps.setInt(12,1);
										}
										ps.executeUpdate();
									}
								
									String q4="SELECT * FROM order_summary where work_id is null";
									PreparedStatement ps4=(PreparedStatement) cn.prepareStatement(q4);
									ResultSet rs4=ps4.executeQuery();	
									while(rs4.next())
									{
										String query11="insert into order_details(order_id,prod_id,code,unit_cost,qty,customization,sub_total,descr,doi,dou,isactive,assign) values(?,?,?,?,?,?,?,?,'"+dtf.format(now)+"','"+dtf.format(now)+"',?,?)";
										PreparedStatement ps11=(PreparedStatement) cn.prepareStatement(query11);	
										//ps11.setInt(1, rs1.getInt("order_id"));
										ps11.setInt(1, or_id);
										ps11.setInt(2, rs4.getInt("prod_id"));
										ps11.setInt(3, rs4.getInt("code"));
										ps11.setInt(4, rs4.getInt("unit_cost"));		
										ps11.setInt(5, rs4.getInt("qty"));
										
										String proq="select * from product where code='"+rs4.getInt("code")+"'";
										PreparedStatement proqps=(PreparedStatement) cn.prepareStatement(proq);
										ResultSet prodres=proqps.executeQuery();
										int nowqty=0;
										if(prodres.next())
										{
										  nowqty=prodres.getInt("qty")-rs4.getInt("qty");
										}
										
										String proqq="update product set qty='"+nowqty+"' where code='"+rs4.getInt("code")+"'";
										PreparedStatement proqqps=(PreparedStatement) cn.prepareStatement(proqq);
										proqqps.executeUpdate();
							
										
										ps11.setInt(6, rs4.getInt("Customization"));							
										ps11.setLong(7, rs4.getLong("sub_total"));
										ps11.setString(8, rs4.getString("des"));
			
										if(rs4.getInt("customization")==1)
										{
											ps11.setInt(9, 0);
											ps11.setInt(10,0);
										}
										else
										{
											
											ps11.setInt(9, 1);
											ps11.setInt(10,1);
											
										}
										ps11.executeUpdate();
									 }									
	
		
					
					String dquery="delete from order_summary";
					PreparedStatement ps3=(PreparedStatement) cn.prepareStatement(dquery);
					ps3.executeUpdate();
					
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public List<OrderBean> getAllOrderDetails()
	{
		List<OrderBean> list=new ArrayList<OrderBean>();
		try
		{			
			Connection cn=Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query="SELECT * FROM order_details INNER JOIN `product` ON order_details.`prod_id`=product.`prod_id` INNER JOIN color ON color.`color_id`=product.`color_id` INNER JOIN size ON size.`size_id`=product.`size_id` INNER JOIN typeofwork ON typeofwork.`work_id`=order_details.`work_id`";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				OrderBean bean=new OrderBean();
				bean.setOrder_id(rs.getInt("order_id"));
				bean.setOrder_d_id(rs.getInt("order_details_id"));
				bean.setProd_id(rs.getInt("prod_id"));
				bean.setProd_name(rs.getString("prod_name"));
				bean.setCode(rs.getString("code"));
				bean.setColor_id(rs.getInt("color_id"));
				bean.setColor_name(rs.getString("color_name"));
				bean.setSize_id(rs.getInt("size_id"));
				bean.setSize_name(rs.getString("size_unit"));
				bean.setQty(rs.getInt("qty"));
				bean.setCustomization(rs.getInt("customization"));
				bean.setJob_work_Type_id(rs.getInt("work_id"));
				bean.setJob_work_type_name(rs.getString("work_name"));
				bean.setJob_work_charges(rs.getInt("cust_charges"));
				bean.setUnit_cost(rs.getInt("unit_cost"));
				bean.setDescription(rs.getString("descr"));	
				bean.setSubtotal(rs.getLong("sub_total"));
				bean.setAssign(rs.getInt("assign"));
				bean.setIsactive(rs.getInt("isactive"));
				list.add(bean);
			}
			
			String query2="SELECT * FROM order_details INNER JOIN `product` ON order_details.`prod_id`=product.`prod_id` INNER JOIN color ON color.`color_id`=product.`color_id` INNER JOIN size ON size.`size_id`=product.`size_id` WHERE work_id IS NULL";
			PreparedStatement ps2=(PreparedStatement) cn.prepareStatement(query2);
			ResultSet rs2=ps2.executeQuery();
			while(rs2.next())
			{
				OrderBean bean=new OrderBean();
				bean.setOrder_id(rs2.getInt("order_id"));
				bean.setOrder_d_id(rs2.getInt("order_details_id"));
				bean.setProd_id(rs2.getInt("prod_id"));
				bean.setProd_name(rs2.getString("prod_name"));
				bean.setCode(rs2.getString("code"));
				bean.setColor_id(rs2.getInt("color_id"));
				bean.setColor_name(rs2.getString("color_name"));
				bean.setSize_id(rs2.getInt("size_id"));
				bean.setSize_name(rs2.getString("size_unit"));
				bean.setQty(rs2.getInt("qty"));
				bean.setCustomization(rs2.getInt("customization"));
				bean.setUnit_cost(rs2.getInt("unit_cost"));
				bean.setDescription(rs2.getString("descr"));	
				bean.setSubtotal(rs2.getLong("sub_total"));
				bean.setAssign(rs2.getInt("assign"));
				bean.setIsactive(rs2.getInt("isactive"));
				list.add(bean);
			}
		
			return list;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	public List<OrderBean> getOrderDetailsByOrderId(int orderid)
	{
		List<OrderBean> list=new ArrayList<OrderBean>();
		try
		{			
			Connection cn=Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query="SELECT * FROM order_details INNER JOIN `product` ON order_details.`prod_id`=product.`prod_id` INNER JOIN color ON color.`color_id`=product.`color_id` INNER JOIN size ON size.`size_id`=product.`size_id` INNER JOIN typeofwork ON typeofwork.`work_id`=order_details.`work_id` where order_id='"+orderid+"'";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				OrderBean bean=new OrderBean();
				bean.setOrder_id(rs.getInt("order_id"));
				bean.setOrder_d_id(rs.getInt("order_details_id"));
				bean.setProd_id(rs.getInt("prod_id"));
				bean.setProd_name(rs.getString("prod_name"));
				bean.setCode(rs.getString("code"));
				bean.setColor_id(rs.getInt("color_id"));
				bean.setColor_name(rs.getString("color_name"));
				bean.setSize_id(rs.getInt("size_id"));
				bean.setSize_name(rs.getString("size_unit"));
				bean.setQty(rs.getInt("qty"));
				bean.setCustomization(rs.getInt("customization"));
				bean.setJob_work_Type_id(rs.getInt("work_id"));
				bean.setJob_work_type_name(rs.getString("work_name"));
				bean.setJob_work_charges(rs.getInt("cust_charges"));
				bean.setUnit_cost(rs.getInt("unit_cost"));
				bean.setDescription(rs.getString("descr"));	
				bean.setSubtotal(rs.getLong("sub_total"));
				bean.setAssign(rs.getInt("assign"));
				bean.setIsactive(rs.getInt("isactive"));
				list.add(bean);
			}
			
			String query2="SELECT * FROM order_details INNER JOIN `product` ON order_details.`prod_id`=product.`prod_id` INNER JOIN color ON color.`color_id`=product.`color_id` INNER JOIN size ON size.`size_id`=product.`size_id`  where order_id='"+orderid+"' AND work_id IS NULL";
			PreparedStatement ps2=(PreparedStatement) cn.prepareStatement(query2);
			ResultSet rs2=ps2.executeQuery();
			while(rs2.next())
			{
				OrderBean bean=new OrderBean();
				bean.setOrder_id(rs2.getInt("order_id"));
				bean.setOrder_d_id(rs2.getInt("order_details_id"));
				bean.setProd_id(rs2.getInt("prod_id"));
				bean.setProd_name(rs2.getString("prod_name"));
				bean.setCode(rs2.getString("code"));
				bean.setColor_id(rs2.getInt("color_id"));
				bean.setColor_name(rs2.getString("color_name"));
				bean.setSize_id(rs2.getInt("size_id"));
				bean.setSize_name(rs2.getString("size_unit"));
				bean.setQty(rs2.getInt("qty"));
				bean.setCustomization(rs2.getInt("customization"));
				bean.setUnit_cost(rs2.getInt("unit_cost"));
				bean.setDescription(rs2.getString("descr"));	
				bean.setSubtotal(rs2.getLong("sub_total"));
				bean.setAssign(rs2.getInt("assign"));
				bean.setIsactive(rs2.getInt("isactive"));
				list.add(bean);
			}
		
			return list;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;	
	}
	
	public List<OrderBean> getAllOrder()
	{
		List<OrderBean> list=new ArrayList<OrderBean>();
		try
		{			
			Connection cn=Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query="SELECT * FROM order_master INNER JOIN customer ON order_master.`cus_id` = customer.`cust_id` INNER JOIN employee_registration ON employee_registration.`emp_id`=order_master.`emp_id` INNER JOIN shop ON shop.`shop_id`= order_master.`shop_id`";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				OrderBean bean=new OrderBean();
				bean.setOrder_id(rs.getInt("order_id"));
				bean.setShop_id(rs.getInt("shop_id"));
				bean.setShop_name(rs.getString("branch_name"));
				
				bean.setEmp_id(rs.getInt("emp_id"));
				bean.setEmp_name(rs.getString("first_name")+rs.getString("last_name"));
				
				bean.setTotal_payment(rs.getLong("grand_total"));
				bean.setRcv_payment(rs.getLong("paid_amount"));
				bean.setDue_payment(rs.getLong("due_amount"));
				
				bean.setOrder_status(rs.getInt("order_status"));
				bean.setDate_of_return(rs.getString("date_of_return"));
				
				bean.setCust_id(rs.getInt("cus_id"));
				bean.setCust_name(rs.getString("fname")+rs.getString("lname"));
				list.add(bean);
			}
			return list;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public void insertIntoJoworkerPayment(OrderBean b)
	{
		try
		{
					Connection cn=Connect.sqlConnection();
					DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
					LocalDateTime now=LocalDateTime.now();
					String query="insert into jobworkerpayment(order_id,prod_id,work_id,worker_id,date_of_return,total_charge,paid_amount,due_amount,descri,doi,dou,isactive) values(?,?,?,?,?,?,?,?,?,'"+dtf.format(now)+"','"+dtf.format(now)+"',?)";
					PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
					ps.setInt(1, b.getOrder_d_id());
					
					String q1="select * from order_details where order_details_id='"+b.getOrder_d_id()+"'";
					PreparedStatement ps1=(PreparedStatement) cn.prepareStatement(q1);
					ResultSet rs1=ps1.executeQuery();
						if(rs1.next())
						{
							ps.setInt(2,rs1.getInt("prod_id") );
							ps.setInt(3,rs1.getInt("work_id"));	
						}
					ps.setInt(4, b.getWorker_id());
					ps.setString(5, b.getDate_of_return());
					ps.setLong(6, b.getWorker_charges());
					if(b.getWorker_paid_amt()>b.getWorker_charges())
					{	
						b.setWorker_paid_amt(b.getWorker_charges());
					}
					ps.setLong(7, b.getWorker_paid_amt());
					ps.setLong(8, b.getWorker_charges()-b.getWorker_paid_amt());
					ps.setString(9, b.getDescription());
					/*if(b.getDue_payment()==0 || b.getJob_work_charges()==b.getWorker_paid_amt())
					{
						ps.setInt(10, 0);	
					}
					else
					{
						ps.setInt(10, 1);	
					}*/
					ps.setInt(10, 0);
					ps.executeUpdate();
					String uq="update order_details set assign=1 where order_details_id='"+b.getOrder_d_id()+"'";
					PreparedStatement ups=(PreparedStatement) cn.prepareStatement(uq);
					ups.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
	}
	public List<OrderBean> getWokerPaymentDetails()
	{
		List<OrderBean> list=new ArrayList<OrderBean>();
		try
		{			
			Connection cn=Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query="SELECT * FROM jobworkerpayment INNER JOIN product ON product.`prod_id`=jobworkerpayment.`prod_id` INNER JOIN  typeofwork ON typeofwork.`work_id`=jobworkerpayment.`work_id` INNER JOIN employee_registration ON employee_registration.`emp_id`=jobworkerpayment.`worker_id`";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				System.out.println("\n\n\tget worker pay,ente");
				OrderBean bean=new OrderBean();
				bean.setJobworker_pay_id(rs.getInt("pay_id"));
				bean.setOrder_d_id(rs.getInt("order_id"));
				bean.setJob_work_Type_id(rs.getInt("work_id"));
				bean.setJob_work_type_name(rs.getString("work_name"));
				bean.setWorker_id(rs.getInt("worker_id"));
				bean.setWorker_name(rs.getString("first_name")+rs.getString("last_name"));
				bean.setDate_of_return(rs.getString("date_of_return"));
				bean.setWorker_charges(rs.getLong("total_charge"));
				bean.setWorker_paid_amt(rs.getLong("paid_amount"));
				bean.setDue_payment(rs.getLong("due_amount"));
				bean.setDescription(rs.getString("descri"));
				bean.setIsactive(rs.getInt("isactive"));
				list.add(bean);
			}
			return list;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
	public OrderBean getWokerPaymentDetailsById(int id)
	{
		OrderBean bean=new OrderBean();
			try
		{			
			Connection cn=Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query="SELECT * FROM jobworkerpayment INNER JOIN product ON product.`prod_id`=jobworkerpayment.`prod_id` INNER JOIN  typeofwork ON typeofwork.`work_id`=jobworkerpayment.`work_id` INNER JOIN employee_registration ON employee_registration.`emp_id`=jobworkerpayment.`worker_id` where pay_id='"+id+"'";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				System.out.println("\n\n\tget worker pay,ente");
				bean.setJobworker_pay_id(rs.getInt("pay_id"));
				bean.setOrder_d_id(rs.getInt("order_id"));
				bean.setJob_work_Type_id(rs.getInt("work_id"));
				bean.setJob_work_type_name(rs.getString("work_name"));
				bean.setWorker_id(rs.getInt("worker_id"));
				bean.setWorker_name(rs.getString("first_name")+rs.getString("last_name"));
				bean.setDate_of_return(rs.getString("date_of_return"));
				bean.setWorker_charges(rs.getLong("total_charge"));
				bean.setWorker_paid_amt(rs.getLong("paid_amount"));
				bean.setDue_payment(rs.getLong("due_amount"));
				bean.setDescription(rs.getString("descri"));
				bean.setIsactive(rs.getInt("isactive"));
			}
			return bean;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	public void updateWorkerPaymentDetailsById(OrderBean b)
	{
		try
		{
					Connection cn=Connect.sqlConnection();
					DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
					LocalDateTime now=LocalDateTime.now();
										
					String query="update jobworkerpayment set worker_id=?,date_of_return=?,total_charge=?,paid_amount=? ,due_amount=?,descri=? where pay_id='"+b.getJobworker_pay_id()+"'";
					PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
					ps.setInt(1, b.getWorker_id());
					ps.setString(2,b.getDate_of_return());						
					ps.setLong(3,b.getWorker_charges());	
					if(b.getWorker_paid_amt()>b.getWorker_charges())
					{
						b.setWorker_paid_amt(b.getWorker_charges());
					}
					ps.setLong(4, b.getWorker_paid_amt());
					ps.setLong(5, b.getWorker_charges()-b.getWorker_paid_amt());
					ps.setString(6, b.getDescription());
					ps.executeUpdate();
					
					
					String q1="SELECT * FROM jobworkerpayment where pay_id='"+b.getJobworker_pay_id()+"'";
					PreparedStatement ps1=(PreparedStatement) cn.prepareStatement(q1);
					ResultSet rs1=ps1.executeQuery();
					if(rs1.next())
					{
						if(rs1.getLong("due_amount")==0 && rs1.getLong("total_charge")==rs1.getLong("paid_amount"))
						{
							String q2="update jobworkerpayment set isactive=0"; 
							PreparedStatement ps2=(PreparedStatement) cn.prepareStatement(q2);
							ps2.executeUpdate();
						}
					}
		
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
	}
	public void CompleteOrderById(int id,int orderstatus)
	{
		try
		{
					Connection cn=Connect.sqlConnection();
					DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
					LocalDateTime now=LocalDateTime.now();
										
					String query="update order_master set order_status='2' ,due_amount=0,paid_amount=grand_total where order_id='"+id+"'";		
					PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
					ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public void CompleteJobWorkOrderById(int id)
	{
		try
		{
					Connection cn=Connect.sqlConnection();
					DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
					LocalDateTime now=LocalDateTime.now();
										
					String query="update jobworkerpayment set isactive=1,due_amount=0,paid_amount=total_charge where pay_id='"+id+"'";		
					PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
					ps.executeUpdate();
					
					String query1="select * from jobworkerpayment where pay_id='"+id+"'";		
					PreparedStatement ps1=(PreparedStatement) cn.prepareStatement(query1);
					ResultSet res=ps1.executeQuery();
					
					if(res.next())
					{
						String query2="update order_details set isactive=1 where order_details_id='"+res.getInt("order_id")+"'";		
						PreparedStatement ps2=(PreparedStatement) cn.prepareStatement(query2);
						ps2.executeUpdate();
					}
					UpdateOrderStatusFromAllOrderDetails();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public boolean UpdateOrderStatusFromAllOrderDetails()
	{
		try
		{
			Connection cn=Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			
			String mus="select * from order_master";
			PreparedStatement musps=(PreparedStatement) cn.prepareStatement(mus);
			ResultSet musres=musps.executeQuery();
			int f=0;
			while(musres.next())
			{
				
							String query1="select * from order_details where order_id='"+musres.getInt("order_id")+"'";		
							PreparedStatement ps1=(PreparedStatement) cn.prepareStatement(query1);
							ResultSet res=ps1.executeQuery();
							while(res.next())
							{
								if(res.getInt("isactive")==0)
								{
									f=1;
								}
							}
							if(f==0)
							{
								
								String qq="select * from order_master where order_id='"+musres.getInt("order_id")+"'";		
								PreparedStatement psps=(PreparedStatement) cn.prepareStatement(qq);
								ResultSet resres=psps.executeQuery();
								if(resres.next())
								{
									if(resres.getInt("order_status")!=2)
									{
										String upor="update order_master set order_status=1 where order_id='"+musres.getInt("order_id")+"'";		
										PreparedStatement uporps=(PreparedStatement) cn.prepareStatement(upor);
										uporps.executeUpdate();
										f=0;
									}	
								}
							}
							else
							{
								
										String upor="update order_master set order_status=0 where order_id='"+musres.getInt("order_id")+"'";		
										PreparedStatement uporps=(PreparedStatement) cn.prepareStatement(upor);
										uporps.executeUpdate();
										f=0;
							}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	public List<OrderBean> getAllOrderReport(OrderBean ob)
	{
		List<OrderBean> list=new ArrayList<OrderBean>();
		try
		{	
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			int shopid = ob.getShop_id();
			String frm = ob.getFrmdt();
			String to = ob.getTodt();
			Connection cn=Connect.sqlConnection();
			if(shopid!=0)
			{
				String query="SELECT * FROM order_master INNER JOIN customer ON order_master.`cus_id` = customer.`cust_id` INNER JOIN employee_registration ON employee_registration.`emp_id`=order_master.`emp_id` INNER JOIN shop ON shop.`shop_id`= order_master.`shop_id`  WHERE order_master.shop_id = '"+shopid+"' AND order_master.doi BETWEEN '"+frm+"' AND '"+to+"'";
				PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					OrderBean bean=new OrderBean();
					bean.setOrder_id(rs.getInt("order_id"));
					bean.setShop_id(rs.getInt("shop_id"));
					bean.setShop_name(rs.getString("branch_name"));
					
					bean.setEmp_id(rs.getInt("emp_id"));
					bean.setEmp_name(rs.getString("first_name")+rs.getString("last_name"));
					
					bean.setTotal_payment(rs.getLong("grand_total"));
					bean.setRcv_payment(rs.getLong("paid_amount"));
					bean.setDue_payment(rs.getLong("due_amount"));
					
					bean.setOrder_status(rs.getInt("order_status"));
					bean.setDate_of_return(rs.getString("date_of_return"));
					
					bean.setCust_id(rs.getInt("cus_id"));
					bean.setCust_name(rs.getString("fname")+rs.getString("lname"));
					list.add(bean);
				}
			}
			else
			{
				String query="SELECT * FROM order_master INNER JOIN customer ON order_master.`cus_id` = customer.`cust_id` INNER JOIN employee_registration ON employee_registration.`emp_id`=order_master.`emp_id` INNER JOIN shop ON shop.`shop_id`= order_master.`shop_id`  WHERE order_master.doi BETWEEN '"+frm+"' AND '"+to+"'";
				PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					OrderBean bean=new OrderBean();
					bean.setOrder_id(rs.getInt("order_id"));
					bean.setShop_id(rs.getInt("shop_id"));
					bean.setShop_name(rs.getString("branch_name"));
					
					bean.setEmp_id(rs.getInt("emp_id"));
					bean.setEmp_name(rs.getString("first_name")+rs.getString("last_name"));
					
					bean.setTotal_payment(rs.getLong("grand_total"));
					bean.setRcv_payment(rs.getLong("paid_amount"));
					bean.setDue_payment(rs.getLong("due_amount"));
					
					bean.setOrder_status(rs.getInt("order_status"));
					bean.setDate_of_return(rs.getString("date_of_return"));
					
					bean.setCust_id(rs.getInt("cus_id"));
					bean.setCust_name(rs.getString("fname")+rs.getString("lname"));
					list.add(bean);
				}
			}
			return list;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
}
