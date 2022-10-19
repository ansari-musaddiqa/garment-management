package com.dao;

import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.bean.SubCategoryBean;
import com.connect.Connect;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class SubCategoryDao {
	public void insertSubCategory(SubCategoryBean bean)
	{
	  try
	  {
		  Connection con=(Connection)Connect.sqlConnection();
		  DateTimeFormatter dft=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		  LocalDateTime now=LocalDateTime.now();
		  String query="insert into sub_category_type (main_cat_id,sub_cat_name,Description,doi,dou,isactive) values(?,?,?,'"+dft.format(now)+"','"+dft.format(now)+"',1)";
		  PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
		  ps.setInt(1,bean.getMain_cat_id());
		  ps.setString(2, bean.getSub_cat_name());
		  ps.setString(3 ,bean.getDescrip());
		  ps.executeUpdate();
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	}
	public List<SubCategoryBean> getAllSubCategory()
	{
		
		List<SubCategoryBean> list=new ArrayList<SubCategoryBean>();
		try
		{
			Connection con=(Connection)Connect.sqlConnection();
			String query="SELECT * FROM sub_category_type INNER JOIN main_category_type ON sub_category_type.main_cat_id=main_category_type.main_cat_id INNER JOIN category_type ON category_type.category_type_id=main_category_type.category_type_id";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				SubCategoryBean bean=new SubCategoryBean();
				bean.setSub_cat_id(rs.getInt("sub_cat_id"));
				bean.setSub_cat_name(rs.getString("sub_cat_name"));
				bean.setMain_cat_name(rs.getString("main_category_name"));
				bean.setCat_type_name(rs.getString("category_name"));
				bean.setDescrip(rs.getString("Description"));
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

	public SubCategoryBean getSubCatById(int id)
	{
		SubCategoryBean sb = new SubCategoryBean();
		
		try 
		{
			Connection cn = Connect.sqlConnection();
			String query = "select * from sub_category_type where sub_cat_id=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				sb.setSub_cat_id(rs.getInt("sub_cat_id"));
				sb.setSub_cat_name(rs.getString("sub_cat_name"));
				sb.setDescrip(rs.getString("Description"));
				sb.setMain_cat_id(rs.getInt("main_cat_id"));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return sb;
	}
	
	public void updateSub_cat(SubCategoryBean sb)
	{
		try 
		{
			Connection cn = Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query = "update sub_category_type set main_cat_id=?, sub_cat_name=?, Description=?, dou='"+dtf.format(now)+"' where sub_cat_id=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, sb.getMain_cat_id());
			ps.setString(2, sb.getSub_cat_name());
			ps.setString(3, sb.getDescrip());
			ps.setInt(4, sb.getSub_cat_id());
			ps.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	public void deleteByid(int id)
	{
		try
		{
			DateTimeFormatter dft=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			
			Connection con=(Connection)Connect.sqlConnection();
			String query="update sub_category_type set isactive=?,dou='"+dft.format(now)+"' where sub_cat_id=?";
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
