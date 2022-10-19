package com.dao;

import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.bean.SizeBean;
import com.connect.Connect;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class SizeDao {
	
	public void insertSize(SizeBean sb)
	{
		try
		{
			Connection cn = Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query = "insert into size(size_unit,cat_type_id,doi,dou,isactive) values(?,?, '"+dtf.format(now)+"', '"+dtf.format(now)+"', 1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, sb.getSize());
			ps.setInt(2, sb.getCat_id());
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<SizeBean> getAllSize()
	{
		List<SizeBean> sizeList = new ArrayList<SizeBean>();
		try 
		{
			Connection cn = Connect.sqlConnection();
			String query = "SELECT * FROM size INNER JOIN category_type ON size.`cat_type_id` = category_type.`category_type_id`";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				SizeBean sb = new SizeBean();
				sb.setSizeid(rs.getInt("size_id"));
				sb.setSize(rs.getString("size_unit"));
				sb.setCat_nm(rs.getString("category_name"));
				sb.setActive(rs.getInt("isactive"));
				sizeList.add(sb);
			}
			rs.close();
			ps.close();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return sizeList;
	}
	
	public SizeBean getSizeById(int id)
	{
		SizeBean sb = new SizeBean();
		
		try 
		{
			Connection cn = Connect.sqlConnection();
			String query = "select * from size where size_id=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				sb.setSizeid(rs.getInt("size_id"));
				sb.setSize(rs.getString("size_unit"));
				sb.setCat_id(rs.getInt("cat_type_id"));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return sb;	
	}
	
	public void updateSize(SizeBean sb,String size1,int cat2)
	{
		try 
		{
			Connection cn = Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query = "update size set size_unit=?, cat_type_id=?, dou='"+dtf.format(now)+"' where size_id=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			if(sb.getSize()==null)
			{
				ps.setString(1, size1);
			}
			else
			{
				ps.setString(1, sb.getSize());
			}
			ps.setInt(2, cat2);
			ps.setInt(3, sb.getSizeid());
			ps.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	public void deleteSize(SizeBean sb)
	{
		try 
		{
			Connection cn = Connect.sqlConnection();
			String query = "update size set isactive=? where size_id=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, 0);
			ps.setInt(2, sb.getSizeid());
			ps.executeUpdate();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}