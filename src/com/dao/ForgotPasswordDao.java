package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.connect.Connect;

public class ForgotPasswordDao {
	
	
	public static boolean isValidemail(String email) throws SQLException
	{
		Connection con = Connect.sqlConnection();
		String query = "select * from employee_registration where email='"+email+"'";
		
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ResultSet re = ps.executeQuery();
		
		while(re.next())
		{
			return true;
		}
		re.close();
		ps.close();
		
		return false;
	}

	public void changePassword(String email,String pass)
	{
		try
		{
			Connection cn = Connect.sqlConnection();
			String query = "update employee_registration set pass='"+pass+"' where email=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			/*ps.setInt(1, email);*/
			ps.setString(1, email);
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static void changePasswordreg(String email,String pass)
	{
		try
		{
			Connection cn = Connect.sqlConnection();
			String query = "update employee_registration set pass='"+pass+"' where email=?";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ps.setString(1, email);
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
