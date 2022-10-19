package com.dao;

import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.connect.Connect;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class DashboardDao {
	
	public int getAllCompleteOrders()
	{
		int count=0;
		try
		{
			Connection con=Connect.sqlConnection();
			String query="select * from order_master where order_status=2";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				count++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	public int getAllNewOrders()
	{
		int count=0;
		try
		{
			Connection con=Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd");
			LocalDate now=LocalDate.now();
			String query="select * from order_master where doi between '"+dtf.format(now)+" 00:00:00' and '"+dtf.format(now)+" 23:59:59'";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				count++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	public int getAllOrders()
	{
		int count=0;
		try
		{
			Connection con=Connect.sqlConnection();
			String query="select * from order_master";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				count++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	public int getAllCustomOrders()
	{
		int count=0;
		try
		{
			Connection con=Connect.sqlConnection();
			String query="select * from order_master where order_status=1";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				count++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	public int getAllProducts()
	{
		int count=0;
		try
		{
			Connection con=Connect.sqlConnection();
			String query="select * from product";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				count++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	public int getProductShop1()
	{
		int count=0;
		try
		{
			Connection con=Connect.sqlConnection();
			String query="select * from product where shop_id=6";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				count++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	public int getProductShop2()
	{
		int count=0;
		try
		{
			Connection con=Connect.sqlConnection();
			String query="select * from product where shop_id=10";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				count++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	public int getAllCustomers()
	{
		int count=0;
		try
		{
			Connection con=Connect.sqlConnection();
			String query="select * from customer";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				count++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	public int getAllEmployees()
	{
		int count=0;
		try
		{
			Connection con=Connect.sqlConnection();
			String query="select * from employee_registration";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				count++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
	public int getAllVendors()
	{
		int count=0;
		try
		{
			Connection con=Connect.sqlConnection();
			String query="select * from vendor";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				count++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}
}
