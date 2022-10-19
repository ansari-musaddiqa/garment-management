package com.dao;

import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.bean.CityBean;
import com.bean.ShopBean;
import com.bean.VendorBean;
import com.connect.Connect;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class ShopDao {

	public void insertShop(ShopBean sb)
	{
		try{
			Connection cn=Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query="insert into shop(branch_name, phoneno, city_id, state_id, address, doi, dou, isactive) values(?,?,?,?,?,'"+dtf.format(now)+"', '"+dtf.format(now)+"', '"+1+"')";
			PreparedStatement ps=(PreparedStatement)cn.prepareStatement(query);
			
			ps.setString(1, sb.getBnm());
			ps.setLong(2, sb.getNum());
			ps.setInt(3, sb.getCid());
			ps.setInt(4, sb.getSid());
			ps.setString(5, sb.getAdd());
			
			ps.executeUpdate();
		}

		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<ShopBean> getAllShop()
	{
		List<ShopBean> shopList=new ArrayList<ShopBean>();
		try{
			Connection cn=Connect.sqlConnection();
			String query="SELECT * FROM shop INNER JOIN city ON shop.city_id=city.city_id INNER JOIN state ON city.state_id=state.state_id";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				ShopBean sb=new ShopBean();
				sb.setBid(rs.getInt("shop_id"));
				sb.setBnm(rs.getString("branch_name"));
				sb.setNum(rs.getLong("phoneno"));
				sb.setAdd(rs.getString("address"));
				sb.setCnm(rs.getString("city_name"));
				sb.setSnm(rs.getString("state_name"));
				sb.setStatus(rs.getInt("isactive"));
				shopList.add(sb);
			}
			ps.close();
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return shopList;
	}
	
	public void deleteShop(ShopBean sb)
	{
		try{
			Connection cn=Connect.sqlConnection();
			String query="update shop set isactive=? where shop_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, 0);
			ps.setInt(2, sb.getBid());
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public void updateShop(ShopBean sb)
	{
		try 
		{
			Connection cn = Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query = "update shop set branch_name=?, address=?, phoneno=?, city_id=?, state_id=?, dou='"+dtf.format(now)+"' where shop_id=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, sb.getBnm());
			ps.setString(2, sb.getAdd());
			ps.setLong(3, sb.getNum());
			ps.setInt(4, sb.getCid());
			ps.setInt(5, sb.getSid());
			ps.setInt(6, sb.getBid());
			ps.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	public ShopBean getShopById(int id)
	{
		ShopBean sb = new ShopBean();
		
		try 
		{
			Connection cn = Connect.sqlConnection();
			String query = "select * from shop where shop_id=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				sb.setBid(rs.getInt("shop_id"));
				sb.setBnm(rs.getString("branch_name"));
				sb.setAdd(rs.getString("address"));
				sb.setNum(rs.getLong("phoneno"));
				sb.setCid(rs.getInt("city_id"));
				sb.setSid(rs.getInt("state_id"));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return sb;
	}

}
