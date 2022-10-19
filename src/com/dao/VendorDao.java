package com.dao;

import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.bean.VendorBean;
import com.connect.Connect;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class VendorDao {

	public void insertVendor(VendorBean vb)
	{
		try
		{
			Connection cn = Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query = "insert into vendor(first_name,last_name,vendor_add,phone_num,email,city_id,state_id,doi,dou,isactive) values(?,?,?,?,?,?,?, '"+dtf.format(now)+"', '"+dtf.format(now)+"', 1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, vb.getF_nm());
			ps.setString(2, vb.getL_nm());
			ps.setString(3, vb.getAdres());
			ps.setLong(4, vb.getMo_no());
			ps.setString(5, vb.getEmail());
			ps.setInt(6, vb.getC_id());
			ps.setInt(7, vb.getS_id());
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<VendorBean> getAllVendor()
	{
		List<VendorBean> vendorList = new ArrayList<VendorBean>();
		try 
		{
			Connection cn = Connect.sqlConnection();
			String query = "SELECT * FROM vendor INNER JOIN city ON vendor.`city_id` = city.`city_id`"
							+ "INNER JOIN state ON city.`state_id` = state.`state_id`";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				VendorBean vb = new VendorBean();
				vb.setV_id(rs.getInt("vendor_id"));
				vb.setF_nm(rs.getString("first_name"));
				vb.setL_nm(rs.getString("last_name"));
				vb.setMo_no(rs.getLong("phone_num"));
				vb.setEmail(rs.getString("email"));
				vb.setAdres(rs.getString("vendor_add"));
				vb.setCity(rs.getString("city_name"));
				vb.setState(rs.getString("state_name"));
				vb.setActive(rs.getInt("isactive"));
				vendorList.add(vb);
			}
			rs.close();
			ps.close();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return vendorList;
	}
	
	public VendorBean getVendorById(int id)
	{
		VendorBean vb = new VendorBean();
		
		try 
		{
			Connection cn = Connect.sqlConnection();
			String query = "select * from vendor where vendor_id=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				vb.setV_id(rs.getInt("vendor_id"));
				vb.setF_nm(rs.getString("first_name"));
				vb.setL_nm(rs.getString("last_name"));
				vb.setAdres(rs.getString("vendor_add"));
				vb.setMo_no(rs.getLong("phone_num"));
				vb.setEmail(rs.getString("email"));
				vb.setC_id(rs.getInt("city_id"));
				vb.setS_id(rs.getInt("state_id"));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return vb;
	}
	
	public void updateVendor(VendorBean vb)
	{
		try 
		{
			Connection cn = Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query = "update vendor set first_name=?, last_name=?, vendor_add=?, phone_num=?, email=?, city_id=?, state_id=?, dou='"+dtf.format(now)+"' where vendor_id=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, vb.getF_nm());
			ps.setString(2, vb.getL_nm());
			ps.setString(3, vb.getAdres());
			ps.setLong(4, vb.getMo_no());
			ps.setString(5, vb.getEmail());
			ps.setInt(6, vb.getC_id());
			ps.setInt(7, vb.getS_id());
			ps.setInt(8, vb.getV_id());
			ps.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	
	public void deleteVendor(VendorBean vb)
	{
		try 
		{
			Connection cn = Connect.sqlConnection();
			String query = "update vendor set isactive=? where vendor_id=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, 0);
			ps.setInt(2, vb.getV_id());
			ps.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}
