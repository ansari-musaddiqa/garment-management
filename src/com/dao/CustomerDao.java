package com.dao;

import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.bean.CustomerBean;
import com.connect.Connect;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class CustomerDao {

	public void insertcustomer(CustomerBean cb)
	{
		try{
			Connection cn=Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query="insert into customer(fname, lname, cust_add, email, phoneno, city_id, state_id, doi, dou, isactive) values(?,?,?,?,?,?,?,'"+dtf.format(now)+"', '"+dtf.format(now)+"', '"+1+"')";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			
			ps.setString(1, cb.getFname());
			ps.setString(2, cb.getLname());
			ps.setString(3, cb.getAdd());
			ps.setString(4, cb.getEmail());
			ps.setLong(5,cb.getNum());
			ps.setInt(6, cb.getCid());
			ps.setInt(7, cb.getSid());
			
			ps.executeUpdate();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<CustomerBean> getAllCustomer()
	{
		List<CustomerBean> customerList=new ArrayList<CustomerBean>();
		try{
			Connection cn=Connect.sqlConnection();
			String query="SELECT * FROM customer INNER JOIN city ON customer.city_id=city.city_id INNER JOIN state ON customer.state_id=state.state_id";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				CustomerBean cb=new CustomerBean();
				cb.setCustid(rs.getInt("cust_id"));
				cb.setFname(rs.getString("fname"));
				cb.setLname(rs.getString("lname"));
				cb.setNum(rs.getLong("phoneno"));
				cb.setEmail(rs.getString("email"));
				cb.setAdd(rs.getString("cust_add"));
				cb.setCid(rs.getInt("city_id"));
				cb.setSid(rs.getInt("state_id"));
				cb.setCnm(rs.getString("city_name"));
				cb.setSnm(rs.getString("state_name"));
				cb.setStatus(rs.getInt("isactive"));
				customerList.add(cb);
			}
			ps.close();
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return customerList;
	}
	public CustomerBean getCustomerById(int id)
	{
		CustomerBean cb=new CustomerBean();
		try
		{	
			Connection cn=Connect.sqlConnection();
			String query="SELECT * FROM customer INNER JOIN city ON customer.city_id=city.city_id INNER JOIN state ON city.state_id=state.state_id where cust_id='"+id+"'";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				cb.setCustid(rs.getInt("cust_id"));
				cb.setFname(rs.getString("fname"));
				cb.setLname(rs.getString("lname"));
				cb.setNum(rs.getLong("phoneno"));
				cb.setEmail(rs.getString("email"));
				cb.setAdd(rs.getString("cust_add"));
				cb.setCid(rs.getInt("city_id"));
				cb.setSid(rs.getInt("state_id"));
				cb.setCnm(rs.getString("city_name"));
				cb.setSnm(rs.getString("state_name"));
				cb.setStatus(rs.getInt("isactive"));
			}
		
			ps.close();
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		System.out.println(cb.getCustid());
		return cb;
	}
	public void deleteByid(int id)
	{
		try
		{		
			DateTimeFormatter dft=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			
			Connection con=(Connection)Connect.sqlConnection();
			String query="update customer set isactive=? ,dou='"+dft.format(now) +"' where cust_id=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, 0);
			ps.setInt(2, id);
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public void updateCustomerById(CustomerBean cb)
	{
		try 
		{
			Connection cn = Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query = "update customer set fname=?, lname=?, cust_add=?,email=?,phoneno=?, city_id=?, state_id=?, dou='"+dtf.format(now)+"' where cust_id=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, cb.getFname());
			ps.setString(2, cb.getLname());
			ps.setString(3, cb.getAdd());
			ps.setString(4, cb.getEmail());
			ps.setLong(5, cb.getNum());
			ps.setInt(6, cb.getCid());
			ps.setInt(7, cb.getSid());
			ps.setInt(8, cb.getCustid());
			ps.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}
