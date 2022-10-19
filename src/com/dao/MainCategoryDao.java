package com.dao;

import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.bean.MainCategoryBean;
import com.connect.Connect;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class MainCategoryDao {
  
	public void insertMainCategory(MainCategoryBean bean)
	{
		try
		{

			Connection cn=(Connection) Connect.sqlConnection();			
			
			DateTimeFormatter dft=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query="insert into main_category_type(category_type_id,main_category_name,description,doi,dou,isactive) values(?,?,?,'"+dft.format(now)+"','"+dft.format(now)+"',1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
		    ps.setInt(1, bean.getCat_type_id());
			ps.setString(2, bean.getMain_cat_name());
			ps.setString(3,bean.getDesc());
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		} 
	}
	public List<MainCategoryBean> getAllMainCategory()
	{
	   
		List<MainCategoryBean> list=new ArrayList<MainCategoryBean>();
		try
		{
			Connection cn=(Connection) Connect.sqlConnection();			
			String query="SELECT * FROM main_category_type INNER JOIN category_type ON main_category_type.category_type_id = category_type.category_type_id";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				MainCategoryBean bean=new MainCategoryBean();
				bean.setMain_cat_id(rs.getInt("main_cat_id"));
				bean.setCat_type_name(rs.getString("category_name"));
				bean.setMain_cat_name(rs.getString("main_category_name"));
				bean.setDesc(rs.getString("description")); 
				bean.setStatus(rs.getInt("isactive"));
				list.add(bean);
			}
			rs.close();
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public MainCategoryBean getMainCategoryById(int id)
	{
	   
		MainCategoryBean bean=new MainCategoryBean();
		try
		{
			Connection con=(Connection)Connect.sqlConnection();
			String query="SELECT * FROM main_category_type INNER JOIN category_type ON main_category_type.category_type_id = category_type.category_type_id where main_cat_id=?";

			//String query="select * from main_category_type where main_cat_id=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				bean.setMain_cat_id(rs.getInt("main_cat_id"));
				bean.setMain_cat_name(rs.getString("main_category_name"));
				bean.setCat_type_id(rs.getInt("category_type_id"));
				bean.setDesc(rs.getString("description"));
				bean.setCat_type_name(rs.getString("category_name"));
				bean.setStatus(rs.getInt("isactive"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return bean;
	}

	public void updateMainCategory(MainCategoryBean mb)
	{
		try
		{
			Connection con=(Connection)Connect.sqlConnection();
			DateTimeFormatter dft=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();	
			String query="update main_category_type set category_type_id='"+mb.getCat_type_id()+"',main_category_name='"+mb.getMain_cat_name()+"',description='"+mb.getDesc()+"',dou='"+dft.format(now)+"' where main_cat_id='"+mb.getMain_cat_id()+"'";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void deleteByid(int id)
	{
		try
		{
			Connection con=(Connection)Connect.sqlConnection();
			String query="update main_category_type set isactive=? where main_cat_id=?";
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
}
