package com.dao;

import java.io.PrintWriter;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.bean.CityBean;
import com.bean.StateBean;
import com.connect.Connect;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class CityDao {
	public void insertcity(CityBean cb)
	{
		try
		{
			Connection cn=Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query="insert into city(state_id, city_name,doi,dou,isactive) values(?,?, '"+dtf.format(now)+"', '"+dtf.format(now)+"', '"+1+"')";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			
			ps.setInt(1, cb.getSid());
			ps.setString(2, cb.getCnm());
			
			ps.executeUpdate();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<CityBean> getAllState()
	{
		java.util.List<CityBean> list=new ArrayList<CityBean>();
		try
		{
			Connection con=Connect.sqlConnection();
			String query="select * from city";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				CityBean cb=new CityBean();
				cb.setCid(rs.getInt("city_id"));
				cb.setCnm(rs.getString("city_name"));
				cb.setStatus(rs.getInt("isactive"));
				list.add(cb);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public List<CityBean> getAllCity()
	{
		List<CityBean> cityList = new ArrayList<CityBean>();
		try{
			Connection cn=Connect.sqlConnection();
			String query="SELECT * FROM city INNER JOIN state ON city.`state_id` = state.`state_id` WHERE state.`isactive`=1";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				CityBean cb=new CityBean();
				cb.setCid(rs.getInt("city_id"));
				cb.setCnm(rs.getString("city_name"));
				cb.setSnm(rs.getString("state_name"));
				cb.setStatus(rs.getInt("isactive"));
				cityList.add(cb);				
			}
			rs.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return cityList;
	}
	
	public CityBean getCityById(int id)
	{
		CityBean cb = new CityBean();
		
		try 
		{
			Connection cn = Connect.sqlConnection();
			String query = "select * from city where city_id=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				cb.setCid(rs.getInt("city_id"));
				cb.setCnm(rs.getString("city_name"));
				cb.setSid(rs.getInt("state_id"));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return cb;	
	}
	
	public void updateCity(CityBean cb,String city2,int state2)
	{
		try 
		{
			Connection cn = Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query = "update city set city_name=?, state_id=?, dou='"+dtf.format(now)+"' where city_id=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			if(cb.getCnm()==null)
			{
				ps.setString(1, city2);
			}
			else
			{
				ps.setString(1, cb.getCnm());
			}
			ps.setInt(2,state2);
			ps.setInt(3, cb.getCid());
			ps.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	public void deleteCity(CityBean cb)
	{
		try
		{
			Connection cn=Connect.sqlConnection();
			String query="update city set isactive=? where city_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, 0);
			ps.setInt(2, cb.getCid());
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
