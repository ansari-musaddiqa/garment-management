package com.dao;

import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.bean.TypeOfWorkBean;
import com.connect.Connect;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class TypeOfWorkDao {
	public void insertTypeOfWork(TypeOfWorkBean bean)
	{
		try
		{
			Connection con=Connect.sqlConnection();
			
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			
			String query="insert into typeofwork(work_name,doi,dou,isactive) values(?,'"+dtf.format(now)+"','"+dtf.format(now)+"',1)";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setString(1, bean.getWork_name());
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	public List<TypeOfWorkBean> getAllTypeOfWork()
	{
		List<TypeOfWorkBean> list=new ArrayList<TypeOfWorkBean>();
		try
		{
			Connection con=Connect.sqlConnection();
			String query="select * from typeofwork";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
		    ResultSet rs=ps.executeQuery();
		    while(rs.next())
		    {
		    	TypeOfWorkBean bean=new TypeOfWorkBean();
		    	bean.setStatus(rs.getInt("isactive"));
		    	bean.setWork_id(rs.getInt("work_id"));
		    	bean.setWork_name(rs.getString("work_name"));
		    	list.add(bean);
		    }
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return list;
	}
	public void deleteById(int id)
	{
		try
		{
			Connection con=Connect.sqlConnection();
			String query="update typeofwork set isactive=? where work_id=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, 0);
			ps.setInt(2, id);
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	public TypeOfWorkBean getTypeOfWorkById(int id)
	{
		TypeOfWorkBean bean=new TypeOfWorkBean();
		try
		{
			Connection con=Connect.sqlConnection();
			String query="select * from typeofwork where work_id='"+id+"'";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
		    ResultSet rs=ps.executeQuery();
		    if(rs.next())
		    {
		    	bean.setStatus(rs.getInt("isactive"));
		    	bean.setWork_id(rs.getInt("work_id"));
		    	bean.setWork_name(rs.getString("work_name"));
		    }
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return bean;
	}
	public void UpdateTypeOfWork(TypeOfWorkBean bean)
	{
		try
		{
			Connection cn = Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query = "update typeofwork set work_name=? where work_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, bean.getWork_name());
			ps.setInt(2, bean.getWork_id());
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
}
