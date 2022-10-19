package com.dao;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/*
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
*/
import com.bean.MaterialBean;
import com.connect.Connect;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class MaterialDao {

	public void insertMaterial(MaterialBean sb)
	{
		try{
			Connection cn=(Connection) Connect.sqlConnection();
			
			DateTimeFormatter dft=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query="insert into material(material_name,doi,dou,isactive) values(?,'"+dft.format(now)+"','"+dft.format(now)+"',1)";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, sb.getMname());
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<MaterialBean> getAllMaterial()
	{
		List<MaterialBean> list =new ArrayList<MaterialBean>();
		try
		{
			Connection cn=(Connection) Connect.sqlConnection();
			String query="select * from material";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				MaterialBean mb=new MaterialBean();
				mb.setMid(rs.getInt("material_id"));
				mb.setMname(rs.getString("material_name"));
				mb.setStatus(rs.getInt("isactive"));
				list.add(mb);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	public MaterialBean getMaterialById(int id)
	{
		MaterialBean mb=new MaterialBean();
		try
		{
			Connection cn=(Connection)Connect.sqlConnection();
			String query="select * from material where material_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				mb.setMid(rs.getInt("material_id"));
				mb.setMname(rs.getString("material_name"));
				mb.setStatus(rs.getInt("isactive"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return mb;
	}
	public void updateMaterial(MaterialBean mb)
	{
		try
		{
			DateTimeFormatter dft=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();			
			Connection cn=(Connection)Connect.sqlConnection();
			String query="update material set material_name=?,dou='"+dft.format(now) +"' where material_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, mb.getMname());
			ps.setInt(2, mb.getMid());
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
			String query="update material set isactive=? ,dou='"+dft.format(now) +"' where material_id=?";
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
