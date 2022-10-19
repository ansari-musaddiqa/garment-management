package com.dao;

import java.sql.ResultSet;
import java.time.LocalDateTime;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.bean.StateBean;
import com.connect.Connect;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;


public class StateDao {
	public void insertState(StateBean sb)
	{
		try{
			Connection cn=(Connection) Connect.sqlConnection();
			
			DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query="insert into state(state_name,doi,dou,isactive) values(?, '"+dtf.format(now)+"', '"+dtf.format(now)+"', '"+1+"')";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, sb.getSnm());
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<StateBean> getAllState1()
	{
		java.util.List<StateBean> list=new ArrayList<StateBean>();
		try
		{
			Connection con=Connect.sqlConnection();
			String query="select * from state";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				StateBean sb=new StateBean();
				sb.setSid(rs.getInt("state_id"));
				sb.setSnm(rs.getString("state_name"));
				sb.setStatus(rs.getInt("isactive"));
				list.add(sb);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public StateBean getStateById(int id)
	{
		StateBean sb=new StateBean();
		try{
			Connection cn=Connect.sqlConnection();
			String query="select * from state where state_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				sb.setSid(rs.getInt("state_id"));
				sb.setSnm(rs.getString("state_name"));
			}
			else
			{
				sb=null;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return sb;
	}
	
	public void updateState(StateBean sb)
	{
		try{
			Connection cn=Connect.sqlConnection();
			String query="update state set state_name=? where state_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, sb.getSnm());
			ps.setInt(2, sb.getSid());
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public void deleteState(StateBean sb)
	{
		try{
			Connection cn=Connect.sqlConnection();
			String query="update state set isactive=? where state_id=?";
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.setInt(1, 0);
			ps.setInt(2, sb.getSid());
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
