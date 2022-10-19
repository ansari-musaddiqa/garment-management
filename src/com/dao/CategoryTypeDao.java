package com.dao;

import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.bean.CategoryTypeBean;
import com.connect.Connect;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class CategoryTypeDao {
		public void insertCatType(CategoryTypeBean ctb)
		{
			try
			{
				Connection cn=(Connection) Connect.sqlConnection();			
				
				DateTimeFormatter dft=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
				LocalDateTime now=LocalDateTime.now();
				String query="insert into category_type(category_name,doi,dou,isactive) values(?,'"+dft.format(now)+"','"+dft.format(now)+"',1)";
				PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			    ps.setString(1, ctb.getCat_type_name());
				ps.executeUpdate();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		}
		public List<CategoryTypeBean> getAllCategoryType()
		{
			List<CategoryTypeBean> list=new ArrayList<CategoryTypeBean>();
			try
			{
				Connection cn=(Connection) Connect.sqlConnection();
				String query="select * from category_type";
				PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					CategoryTypeBean ctb=new CategoryTypeBean();
					ctb.setCat_type_id(rs.getInt("category_type_id"));
					ctb.setCat_type_name(rs.getString("category_name"));
					ctb.setStatus(rs.getInt("isactive"));
					list.add(ctb);
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return list;
		}
		public CategoryTypeBean getCategoryTypeById(int id)
		{
			CategoryTypeBean ctb=new CategoryTypeBean();
			try
			{
				Connection cn=(Connection) Connect.sqlConnection();
				String query="select * from category_type where category_type_id=?";
				PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
				ps.setInt(1, id);
				ResultSet rs=ps.executeQuery();
				if(rs.next())
				{
					ctb.setCat_type_id(rs.getInt("category_type_id"));
					ctb.setCat_type_name(rs.getString("category_name"));
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return ctb;
		}
		public void updateCategoryType(CategoryTypeBean ctb) 
		{
			try
			{
				Connection cn=(Connection) Connect.sqlConnection();
				String query="update category_type set category_name=? where category_type_id=?";
				PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
				ps.setString(1, ctb.getCat_type_name());
				ps.setInt(2, ctb.getCat_type_id());
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
				DateTimeFormatter dft=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
				LocalDateTime now=LocalDateTime.now();
	
				Connection con=(Connection)Connect.sqlConnection();
				String query="update category_type set isactive=?,dou='"+dft.format(now)+"' where category_type_id=?";
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
