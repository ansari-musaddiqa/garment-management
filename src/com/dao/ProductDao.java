package com.dao;

import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.bean.CustomerBean;
import com.bean.ProductBean;
import com.bean.ShopBean;
import com.connect.Connect;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class ProductDao {

	public void insertproduct(ProductBean pb)
	{
		try{
			Connection cn=Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			
			String query="insert into product(prod_name,shop_id,cat_type_id,main_cat_id,sub_cat_id,material_id,size_id,color_id,vendor_id,description,qty,price,photo,code,doi,dou,isactive) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,'"+dtf.format(now)+"', '"+dtf.format(now)+"', '"+1+"')";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			
			ps.setString(1, pb.getProdnm());
			ps.setInt(2, pb.getBranchid());
			ps.setInt(3, pb.getTypeid());
			ps.setInt(4, pb.getMainid());
			ps.setInt(5, pb.getSubid());
			ps.setInt(6, pb.getMatid());
			ps.setInt(7, pb.getSizeid());
			ps.setInt(8, pb.getColorid());
			ps.setInt(9, pb.getVenid());
			ps.setString(10, pb.getDes());
			ps.setInt(11, pb.getQty());
			ps.setInt(12, pb.getPrice());
			ps.setString(13, pb.getImg());
			ps.setString(14, pb.getCode());
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<ProductBean> getAllProduct()
	{
		List<ProductBean> productList=new ArrayList<ProductBean>();
		try{
			Connection cn=Connect.sqlConnection();
			String query="SELECT * FROM product INNER JOIN shop ON shop.`shop_id`=product.`shop_id` INNER JOIN category_type ON category_type.`category_type_id`=product.`cat_type_id` INNER JOIN main_category_type ON main_category_type.`main_cat_id`=product.`main_cat_id` INNER JOIN sub_category_type ON sub_category_type.`sub_cat_id`=product.`sub_cat_id` INNER JOIN material ON material.`material_id`=product.`material_id` INNER JOIN size ON size.`size_id`=product.`size_id` INNER JOIN color ON color.`color_id`=product.`color_id` INNER JOIN vendor ON vendor.`vendor_id`=product.`vendor_id`"; 
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				ProductBean bean=new ProductBean();
				bean.setProdid(rs.getInt("prod_id"));
				bean.setProdnm(rs.getString("prod_name"));
				bean.setCode(rs.getString("code"));
				bean.setBranchnm(rs.getString("branch_name"));
				bean.setTypenm(rs.getString("category_name"));
				bean.setMainnm(rs.getString("main_category_name"));
				bean.setSubnm(rs.getString("sub_cat_name"));
				bean.setMatnm(rs.getString("material_name"));
				bean.setSizenm(rs.getString("size_unit"));
				bean.setColornm(rs.getString("color_name"));
				bean.setVennm(rs.getString("first_name")+rs.getString("last_name"));
				bean.setDes(rs.getString("description"));
				bean.setImg(rs.getString("photo"));
				bean.setQty(rs.getInt("qty"));
				bean.setPrice(rs.getInt("price"));
				productList.add(bean);
			}
			ps.close();
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return productList;
	}

	public ProductBean getProductById(int id)
	{
		ProductBean pb = new ProductBean();
		
		try 
		{
			Connection cn = Connect.sqlConnection();
			String query = "select * from product where prod_id=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				pb.setProdid(rs.getInt("prod_id"));
				pb.setProdnm(rs.getString("prod_name"));
				pb.setCode(rs.getString("code"));
				pb.setBranchid(rs.getInt("shop_id"));
				pb.setTypeid(rs.getInt("cat_type_id"));
				pb.setMainid(rs.getInt("main_cat_id"));
				pb.setSubid(rs.getInt("sub_cat_id"));
				pb.setMatid(rs.getInt("material_id"));
				pb.setSizeid(rs.getInt("size_id"));
				pb.setColorid(rs.getInt("color_id"));
				pb.setVenid(rs.getInt("vendor_id"));
				pb.setDes(rs.getString("description"));
				pb.setQty(rs.getInt("qty"));
				pb.setPrice(rs.getInt("price"));
				pb.setImg(rs.getString("photo"));
				//System.out.println(rs.getInt("qty"));
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return pb;
	}
	
	public void updateProduct(ProductBean pb)
	{
		try 
		{
			System.out.println("Dao :" +pb.getCode());
			Connection cn = Connect.sqlConnection();
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query = "update product set code=?,prod_name=?, shop_id=?, cat_type_id=?, main_cat_id=?, sub_cat_id=?, material_id=?, size_id=?, color_id=?, vendor_id=?, photo=?, qty=?, price=?,  dou='"+dtf.format(now)+"' where prod_id=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, pb.getCode());
			ps.setString(2, pb.getProdnm());
			ps.setInt(3, pb.getBranchid());
			ps.setInt(4, pb.getTypeid());
			ps.setInt(5, pb.getMainid());
			ps.setInt(6, pb.getSubid());
			ps.setInt(7, pb.getMatid());
			ps.setInt(8, pb.getSizeid());
			ps.setInt(9, pb.getColorid());
			ps.setInt(10, pb.getVenid());
			ps.setString(11, pb.getImg());
			ps.setInt(12, pb.getQty());
			ps.setInt(13, pb.getPrice());
			ps.setInt(14, pb.getProdid());
			ps.executeUpdate();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

	public List<ProductBean> getProductsReport(ProductBean pb)
	{
		List<ProductBean> productList=new ArrayList<ProductBean>();
		try{
			int shopid = pb.getShopid();
			String frm = pb.getFrmdt();
			String to = pb.getTodt();
			Connection cn=Connect.sqlConnection();
			if(shopid!=0)
			{
				System.out.println("shop is in dao :"+shopid);
				String query="SELECT * FROM product INNER JOIN shop ON shop.`shop_id` = product.`shop_id` INNER JOIN category_type ON category_type.`category_type_id`=product.`cat_type_id` INNER JOIN main_category_type ON main_category_type.`main_cat_id`=product.`main_cat_id` INNER JOIN sub_category_type ON sub_category_type.`sub_cat_id`=product.`sub_cat_id` INNER JOIN material ON material.`material_id`=product.`material_id` INNER JOIN size ON size.`size_id`=product.`size_id` INNER JOIN color ON color.`color_id`=product.`color_id` INNER JOIN vendor ON vendor.`vendor_id`=product.`vendor_id` WHERE product.shop_id = '"+shopid+"' AND product.doi BETWEEN '"+frm+"' AND '"+to+"'"; 
				PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
				ResultSet rs=ps.executeQuery();
				
				while(rs.next())
				{
					ProductBean bean=new ProductBean();
					bean.setProdid(rs.getInt("prod_id"));
					bean.setProdnm(rs.getString("prod_name"));
					bean.setBranchnm(rs.getString("branch_name"));
					bean.setTypenm(rs.getString("category_name"));
					bean.setMainnm(rs.getString("main_category_name"));
					bean.setSubnm(rs.getString("sub_cat_name"));
					bean.setMatnm(rs.getString("material_name"));
					bean.setSizenm(rs.getString("size_unit"));
					bean.setColornm(rs.getString("color_name"));
					bean.setVennm(rs.getString("first_name")+rs.getString("last_name"));
					bean.setDes(rs.getString("description"));
					bean.setImg(rs.getString("photo"));
					bean.setQty(rs.getInt("qty"));
					bean.setPrice(rs.getInt("price"));
					productList.add(bean);
				}
				ps.close();
				rs.close();
			}
			else
			{

				System.out.println("without shop");
				String query="SELECT * FROM product INNER JOIN shop ON shop.`shop_id` = product.`shop_id` INNER JOIN category_type ON category_type.`category_type_id`=product.`cat_type_id` INNER JOIN main_category_type ON main_category_type.`main_cat_id`=product.`main_cat_id` INNER JOIN sub_category_type ON sub_category_type.`sub_cat_id`=product.`sub_cat_id` INNER JOIN material ON material.`material_id`=product.`material_id` INNER JOIN size ON size.`size_id`=product.`size_id` INNER JOIN color ON color.`color_id`=product.`color_id` INNER JOIN vendor ON vendor.`vendor_id`=product.`vendor_id` WHERE product.dou BETWEEN '"+frm+"' AND '"+to+"'"; 
				PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
				ResultSet rs=ps.executeQuery();
				
				while(rs.next())
				{
					ProductBean bean=new ProductBean();
					bean.setProdid(rs.getInt("prod_id"));
					bean.setProdnm(rs.getString("prod_name"));
					bean.setBranchnm(rs.getString("branch_name"));
					bean.setTypenm(rs.getString("category_name"));
					bean.setMainnm(rs.getString("main_category_name"));
					bean.setSubnm(rs.getString("sub_cat_name"));
					bean.setMatnm(rs.getString("material_name"));
					bean.setSizenm(rs.getString("size_unit"));
					bean.setColornm(rs.getString("color_name"));
					bean.setVennm(rs.getString("first_name")+rs.getString("last_name"));
					bean.setDes(rs.getString("description"));
					bean.setImg(rs.getString("photo"));
					bean.setQty(rs.getInt("qty"));
					bean.setPrice(rs.getInt("price"));
					productList.add(bean);
				}
				ps.close();
				rs.close();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return productList;
	}	
	public void deleteById(int id)
	{
		try
		{
			Connection con=Connect.sqlConnection();
			String query="update product set isactive=? where emp_id=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, 0);
			ps.setInt(2, id);
			ps.executeUpdate();
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}


}
