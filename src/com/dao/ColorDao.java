package com.dao;

import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.bean.ColorBean;
import com.connect.Connect;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class ColorDao {
	public void insertColor(ColorBean cb)
	{
		try{
			Connection cn=(Connection) Connect.sqlConnection();
			
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query="insert into color(color_name,doi,dou,isactive) values(?, '"+dtf.format(now)+"', '"+dtf.format(now)+"', '"+1+"')";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, cb.getCnm());
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<ColorBean> getAllColor()
	{
		java.util.List<ColorBean> list=new ArrayList<ColorBean>();
		try
		{
			Connection con=Connect.sqlConnection();
			String query="select * from color";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				ColorBean cb=new ColorBean();
				cb.setCid(rs.getInt("color_id"));
				cb.setCnm(rs.getString("color_name"));
				cb.setActive(rs.getInt("isactive"));
				list.add(cb);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public ColorBean getColorById(int id)
	{
		ColorBean cb = new ColorBean();
		
		try 
		{
			Connection cn = Connect.sqlConnection();
			String query = "select * from color where color_id=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				cb.setCid(rs.getInt("color_id"));
				cb.setCnm(rs.getString("color_name"));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return cb;	
	}
	
	public void updateColor(ColorBean cb)
	{
		try 
		{
			Connection cn = Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query = "update color set color_name=?, dou='"+dtf.format(now)+"' where color_id=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, cb.getCnm());
			ps.setInt(2, cb.getCid());
			ps.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	public void deleteColor(ColorBean cb)
	{
		try 
		{
			Connection cn = Connect.sqlConnection();
			String query = "update color set isactive=? where color_id=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, 0);
			ps.setInt(2, cb.getCid());
			ps.executeUpdate();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}