package com.connect;

import java.sql.DriverManager;

import com.mysql.jdbc.Connection;



public class Connect {
	public static Connection sqlConnection()
	{
		Connection cn=null;
		try{
			Class.forName("com.mysql.jdbc.Driver"); // registers the driver for connection
			cn=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/garments","root","11122000");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return cn;
	}
}
