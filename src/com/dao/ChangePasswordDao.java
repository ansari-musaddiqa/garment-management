package com.dao;

import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.bean.ChangePasswordBean;
import com.connect.Connect;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class ChangePasswordDao {
	public boolean updatePassword(ChangePasswordBean bean)
	{
		try
		{
			Connection con=(Connection) Connect.sqlConnection();
			DateTimeFormatter dft=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			
			String upquery;
			String query="SELECT pass FROM `employee_registration` WHERE emp_id='"+bean.getEmp_id()+"';";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				if(rs.getString("pass").equals(bean.getOldpass()))
				{
					upquery="UPDATE employee_registration SET pass='"+bean.getNewpass()+"',dou='"+now+"' WHERE emp_id='"+bean.getEmp_id()+"';";
					PreparedStatement ps1=(PreparedStatement) con.prepareStatement(upquery);
					ps1.executeUpdate();
					return true;
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
}
