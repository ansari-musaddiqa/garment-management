package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.bean.ProfileBean;
import com.bean.RegisterBean;
import com.connect.Connect;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class RegisterDao {
	static int pId;
	public void insertEmployee(RegisterBean bean)
	{
		try
		{
			Connection con=(Connection) Connect.sqlConnection();
			
			DateTimeFormatter dft=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			if(bean.getWork_id()==0)
			{
				String query="insert into employee_registration (first_name,last_name,job_type_id,shop_id,user_name,pass,emp_add,city_id,state_id,phoneno,email,photo,doi,dou,isactive)  values(?,?,?,?,?,?,?,?,?,?,?,?,'"+dft.format(now)+"','"+dft.format(now)+"',1)";
				PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
				ps.setString(1, bean.getFirst_name());
				ps.setString(2, bean.getLast_name());
				ps.setInt(3,bean.getJob_type_id() );
				ps.setInt(4, bean.getShop_id());				
				ps.setString(5, bean.getUname());
				ps.setString(6, bean.getPassword());
				ps.setString(7, bean.getAddress());
				ps.setInt(8, bean.getCity_id());
				ps.setInt(9,bean.getState_id());
				ps.setLong(10,bean.getPhoneno());
				ps.setString(11, bean.getEmail());
				ps.setString(12, bean.getPhoto());
				ps.executeUpdate();
			}
			else
			{
				String query="insert into employee_registration (first_name,last_name,job_type_id,work_id,shop_id,user_name,pass,emp_add,city_id,state_id,phoneno,email,photo,doi,dou,isactive)  values(?,?,?,?,?,?,?,?,?,?,?,?,?,'"+dft.format(now)+"','"+dft.format(now)+"',1)";
				PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
				ps.setString(1, bean.getFirst_name());
				ps.setString(2, bean.getLast_name());
				ps.setInt(3,bean.getJob_type_id() );
				ps.setInt(4, bean.getWork_id());
				ps.setInt(5, bean.getShop_id());				
				ps.setString(6, bean.getUname());
				ps.setString(7, bean.getPassword());
				ps.setString(8, bean.getAddress());
				ps.setInt(9, bean.getCity_id());
				ps.setInt(10,bean.getState_id());
				ps.setLong(11,bean.getPhoneno());
				ps.setString(12, bean.getEmail());
				ps.setString(13, bean.getPhoto());
				ps.executeUpdate();
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	public List<RegisterBean> getAllEmployees()
	{
		List<RegisterBean> list=new ArrayList<RegisterBean>();
		try
		{
			Connection con=Connect.sqlConnection();
			String tempquery="SELECT * FROM employee_registration";
			PreparedStatement ps1=(PreparedStatement) con.prepareStatement(tempquery);
			ResultSet rs1=ps1.executeQuery();
			while(rs1.next())
			{
				if(rs1.getInt("work_id")!=0)
				{
					System.out.println(" work_id "+rs1.getInt("work_id"));
					//System.out.println("workid is not null and emp_id "+rs1.getInt("emp_id"));
					String query="SELECT * FROM employee_registration INNER JOIN job_type ON employee_registration.job_type_id = job_type.job_type_id INNER JOIN typeofwork ON employee_registration.work_id = typeofwork.work_id INNER JOIN shop ON shop.shop_id = employee_registration.shop_id INNER JOIN city ON city.city_id = employee_registration.city_id INNER JOIN state ON state.state_id = employee_registration.state_id WHERE employee_registration.`emp_id`='"+rs1.getInt("emp_id")+"'";
					PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
					ResultSet rsw=ps.executeQuery();
					while(rsw.next())
					{
						RegisterBean bean=new RegisterBean();
						bean.setEmp_id(rsw.getInt("emp_id"));
						bean.setFirst_name(rsw.getString("first_name"));
						bean.setLast_name(rsw.getString("last_name"));
						bean.setJob_type_id(rsw.getInt("job_type_id"));
						bean.setWork_id(rsw.getInt("work_id"));
						bean.setUname(rsw.getString("user_name"));
						bean.setPassword(rsw.getString("pass"));
						bean.setAddress(rsw.getString("emp_add"));
						bean.setCity_id(rsw.getInt("city_id"));
						bean.setState_id(rsw.getInt("state_id"));
						bean.setPhoneno(rsw.getLong("phoneno"));
						bean.setEmail(rsw.getString("email"));
						bean.setPhoto(rsw.getString("photo"));
						bean.setStatus(rsw.getInt("isactive"));
						bean.setWork_name(rsw.getString("work_name"));
						bean.setJob_name(rsw.getString("job_name"));
						bean.setCity_name(rsw.getString("city_name"));
						bean.setState_name(rsw.getString("state_name"));
						bean.setShop_name(rsw.getString("branch_name"));
						list.add(bean);
					}

				}
				else
				{
					System.out.println(" work_id "+rs1.getInt("work_id"));
					//System.out.println("workid is null ans emp_id "+rs1.getInt("emp_id"));
					String query="SELECT * FROM employee_registration INNER JOIN job_type ON employee_registration.job_type_id = job_type.job_type_id INNER JOIN shop ON shop.shop_id = employee_registration.shop_id INNER JOIN city ON city.city_id = employee_registration.city_id INNER JOIN state ON state.state_id = employee_registration.state_id  WHERE employee_registration.`work_id` IS NULL AND employee_registration.`emp_id`='"+rs1.getInt("emp_id")+"'";
					PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
					ResultSet rs=ps.executeQuery();
					if(rs.next())
					{
						RegisterBean bean=new RegisterBean();
						bean.setEmp_id(rs.getInt("emp_id"));
						bean.setFirst_name(rs.getString("first_name"));
						bean.setLast_name(rs.getString("last_name"));
						bean.setJob_type_id(rs.getInt("job_type_id"));
						bean.setWork_id(rs.getInt("work_id"));
						bean.setUname(rs.getString("user_name"));
						bean.setPassword(rs.getString("pass"));
						bean.setAddress(rs.getString("emp_add"));
						bean.setCity_id(rs.getInt("city_id"));
						bean.setState_id(rs.getInt("state_id"));
						bean.setPhoneno(rs.getLong("phoneno"));
						bean.setEmail(rs.getString("email"));
						bean.setPhoto(rs.getString("photo"));
						bean.setStatus(rs.getInt("isactive"));
						bean.setWork_name("");
						bean.setJob_name(rs.getString("job_name"));
						bean.setCity_name(rs.getString("city_name"));
						bean.setState_name(rs.getString("state_name"));
						bean.setShop_name(rs.getString("branch_name"));
						list.add(bean);
					}

				}

		  }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		for(RegisterBean b1:list)
		{
			System.out.println(b1.getEmp_id());
		}
		return list;
	}
	public void deleteById(int id)
	{
		try
		{
			Connection con=Connect.sqlConnection();
			String query="update employee_registration set isactive=? where emp_id=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, 0);
			ps.setInt(2, id);
			ps.executeUpdate();
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}
	public static boolean isValidUser(String email,String pass)
	{
		try 
		{
			Connection cn = Connect.sqlConnection();
			String query = "SELECT * FROM employee_registration WHERE email='"+email+"' AND pass='"+pass+"'";
			PreparedStatement ps = (PreparedStatement) cn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				return true;
			}
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return false;
	}
	public static int getIdByEmail(String email) throws SQLException
	{
		Connection cn=Connect.sqlConnection();
		String query="SELECT * FROM employee_registration WHERE email='"+email+"'";
		PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			return rs.getInt("emp_id");
		}
		
		return 0;
	}
	public static RegisterBean getUserById(int id)
	{
		try
		{
			System.out.println("id :"+id);
			Connection con=Connect.sqlConnection();
			String query="SELECT * FROM employee_registration WHERE emp_id=?";
			PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				System.out.println("if condition");
				RegisterBean bean=new RegisterBean();
				bean.setEmp_id(rs.getInt("emp_id"));
				bean.setFirst_name(rs.getString("first_name"));
				bean.setLast_name(rs.getString("last_name"));
				bean.setJob_type_id(rs.getInt("job_type_id"));
				bean.setWork_id(rs.getInt("work_id"));
				bean.setUname(rs.getString("user_name"));
				bean.setPassword(rs.getString("pass"));
				bean.setAddress(rs.getString("emp_add"));
				bean.setCity_id(rs.getInt("city_id"));
				bean.setState_id(rs.getInt("state_id"));
				bean.setPhoneno(rs.getLong("phoneno"));
				bean.setEmail(rs.getString("email"));
				bean.setPhoto(rs.getString("photo"));
				bean.setStatus(rs.getInt("isactive"));
				bean.setShop_id(rs.getInt("shop_id"));
				System.out.println("cur emp id :"+bean.getEmp_id());			
				return bean;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	public static void profileId(ProfileBean bean)
	{
		pId=bean.getCuser(); 
	}
	public static RegisterBean getProfile()
	{
		int id=pId;
		System.out.println("get profile for id :"+id);
		try
		{
			Connection con=Connect.sqlConnection();
			String tempquery="SELECT * FROM employee_registration WHERE emp_id='"+id+"'";
			PreparedStatement ps1=(PreparedStatement) con.prepareStatement(tempquery);
			ResultSet rs1=ps1.executeQuery();
			if(rs1.next())
			{
				if(rs1.getInt("work_id")!=0)
				{
					String query="SELECT * FROM employee_registration INNER JOIN job_type ON employee_registration.job_type_id = job_type.job_type_id INNER JOIN typeofwork ON employee_registration.work_id = typeofwork.work_id INNER JOIN shop ON shop.shop_id = employee_registration.shop_id INNER JOIN city ON city.city_id = employee_registration.city_id INNER JOIN state ON state.state_id = employee_registration.state_id WHERE employee_registration.`emp_id`='"+rs1.getInt("emp_id")+"'";
					PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
					ResultSet rsw=ps.executeQuery();
					if(rsw.next())
					{
						RegisterBean bean=new RegisterBean();
						bean.setEmp_id(rsw.getInt("emp_id"));
						bean.setFirst_name(rsw.getString("first_name"));
						bean.setLast_name(rsw.getString("last_name"));
						bean.setJob_type_id(rsw.getInt("job_type_id"));
						bean.setWork_id(rsw.getInt("work_id"));
						bean.setUname(rsw.getString("user_name"));
						bean.setPassword(rsw.getString("pass"));
						bean.setAddress(rsw.getString("emp_add"));
						bean.setCity_id(rsw.getInt("city_id"));
						bean.setState_id(rsw.getInt("state_id"));
						bean.setPhoneno(rsw.getLong("phoneno"));
						bean.setEmail(rsw.getString("email"));
						bean.setPhoto(rsw.getString("photo"));
						bean.setStatus(rsw.getInt("isactive"));
						bean.setWork_name(rsw.getString("work_name"));
						bean.setJob_name(rsw.getString("job_name"));
						bean.setCity_name(rsw.getString("city_name"));
						bean.setState_name(rsw.getString("state_name"));
						bean.setShop_name(rsw.getString("branch_name"));
						return bean;
					}

				}
				else
				{
					String query="SELECT * FROM employee_registration INNER JOIN job_type ON employee_registration.job_type_id = job_type.job_type_id INNER JOIN shop ON shop.shop_id = employee_registration.shop_id INNER JOIN city ON city.city_id = employee_registration.city_id INNER JOIN state ON state.state_id = employee_registration.state_id  WHERE employee_registration.`work_id` IS NULL AND employee_registration.`emp_id`='"+rs1.getInt("emp_id")+"'";
					PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
					ResultSet rs=ps.executeQuery();
					if(rs.next())
					{
						RegisterBean bean=new RegisterBean();
						bean.setEmp_id(rs.getInt("emp_id"));
						bean.setFirst_name(rs.getString("first_name"));
						bean.setLast_name(rs.getString("last_name"));
						bean.setJob_type_id(rs.getInt("job_type_id"));
						bean.setWork_id(rs.getInt("work_id"));
						bean.setUname(rs.getString("user_name"));
						bean.setPassword(rs.getString("pass"));
						bean.setAddress(rs.getString("emp_add"));
						bean.setCity_id(rs.getInt("city_id"));
						bean.setState_id(rs.getInt("state_id"));
						bean.setPhoneno(rs.getLong("phoneno"));
						bean.setEmail(rs.getString("email"));
						bean.setPhoto(rs.getString("photo"));
						bean.setStatus(rs.getInt("isactive"));
						bean.setWork_name("");
						bean.setJob_name(rs.getString("job_name"));
						bean.setCity_name(rs.getString("city_name"));
						bean.setState_name(rs.getString("state_name"));
						bean.setShop_name(rs.getString("branch_name"));
						return bean;
					}

				}

		  }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public void updateRegister(RegisterBean bean)
	{
		try
		{
			Connection cn=(Connection)Connect.sqlConnection();
			DateTimeFormatter dft=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
			LocalDateTime now=LocalDateTime.now();
			String query="";
			if(bean.getWork_id() != 0)
			{
				 query="UPDATE `employee_registration` SET `first_name`='"+bean.getFirst_name()+"',"
						+ "`last_name`='"+bean.getLast_name()+"',"
						+ "emp_add='"+bean.getAddress()+"',"
						+ "city_id='"+bean.getCity_id()+"',"
						+ "state_id='"+bean.getState_id()+"',"
						+ "phoneno='"+bean.getPhoneno()+"',"
						+ "email='"+bean.getEmail()+"',"
						+ "user_name='"+bean.getUname()+"',"
						+"employee_registration.shop_id='"+bean.getShop_id()+"',"
						+ "employee_registration.job_type_id='"+bean.getJob_type_id()+"',"
						+ "employee_registration.work_id='"+bean.getWork_id()+"',"
						+"photo='"+bean.getPhoto()+"',"
						+ "dou='"+now+"',"
						+ "isactive='"+bean.getStatus()+"'"
						+ "WHERE emp_id='"+bean.getEmp_id()+"'";
						System.out.println("is not equal to zero" + bean.getEmp_id());
			}
			else
			{	
					query="UPDATE `employee_registration` SET `first_name`='"+bean.getFirst_name()+"',"
					+ "`last_name`='"+bean.getLast_name()+"',"
					+ "emp_add='"+bean.getAddress()+"',"
					+ "city_id='"+bean.getCity_id()+"',"
					+ "state_id='"+bean.getState_id()+"',"
					+ "phoneno='"+bean.getPhoneno()+"',"
					+ "email='"+bean.getEmail()+"',"
					+ "user_name='"+bean.getUname()+"',"
					+"employee_registration.shop_id='"+bean.getShop_id()+"',"
					+ "employee_registration.job_type_id='"+bean.getJob_type_id()+"',"
					+"photo='"+bean.getPhoto()+"',"		
					+ "dou='"+now+"',"
					+ "isactive='"+bean.getStatus()+"'"
					+ "WHERE emp_id='"+bean.getEmp_id()+"'";
					System.out.println("equal tozero");
			}
			PreparedStatement ps=(PreparedStatement) cn.prepareStatement(query);
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public int currentUser(int id)
	{
		return id;
	}
	
	public static RegisterBean getEmplyeeDetailsById(int id)
	{
		System.out.println("get profile for id :"+id);
		try
		{
			Connection con=Connect.sqlConnection();
			String tempquery="SELECT * FROM employee_registration WHERE emp_id='"+id+"'";
			PreparedStatement ps1=(PreparedStatement) con.prepareStatement(tempquery);
			ResultSet rs1=ps1.executeQuery();
			if(rs1.next())
			{
				if(rs1.getInt("work_id")!=0)
				{
					String query="SELECT * FROM employee_registration INNER JOIN job_type ON employee_registration.job_type_id = job_type.job_type_id INNER JOIN typeofwork ON employee_registration.work_id = typeofwork.work_id INNER JOIN shop ON shop.shop_id = employee_registration.shop_id INNER JOIN city ON city.city_id = employee_registration.city_id INNER JOIN state ON state.state_id = employee_registration.state_id WHERE employee_registration.`emp_id`='"+rs1.getInt("emp_id")+"'";
					PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
					ResultSet rsw=ps.executeQuery();
					if(rsw.next())
					{
						RegisterBean bean=new RegisterBean();
						bean.setEmp_id(rsw.getInt("emp_id"));
						bean.setFirst_name(rsw.getString("first_name"));
						bean.setLast_name(rsw.getString("last_name"));
						bean.setJob_type_id(rsw.getInt("job_type_id"));
						bean.setWork_id(rsw.getInt("work_id"));
						bean.setUname(rsw.getString("user_name"));
						bean.setPassword(rsw.getString("pass"));
						bean.setAddress(rsw.getString("emp_add"));
						bean.setCity_id(rsw.getInt("city_id"));
						bean.setState_id(rsw.getInt("state_id"));
						bean.setPhoneno(rsw.getLong("phoneno"));
						bean.setEmail(rsw.getString("email"));
						bean.setPhoto(rsw.getString("photo"));
						bean.setStatus(rsw.getInt("isactive"));
						bean.setWork_name(rsw.getString("work_name"));
						bean.setJob_name(rsw.getString("job_name"));
						bean.setCity_name(rsw.getString("city_name"));
						bean.setState_name(rsw.getString("state_name"));
						bean.setShop_name(rsw.getString("branch_name"));
						return bean;
					}

				}
				else
				{
					String query="SELECT * FROM employee_registration INNER JOIN job_type ON employee_registration.job_type_id = job_type.job_type_id INNER JOIN shop ON shop.shop_id = employee_registration.shop_id INNER JOIN city ON city.city_id = employee_registration.city_id INNER JOIN state ON state.state_id = employee_registration.state_id  WHERE employee_registration.`work_id` IS NULL AND employee_registration.`emp_id`='"+rs1.getInt("emp_id")+"'";
					PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
					ResultSet rs=ps.executeQuery();
					if(rs.next())
					{
						RegisterBean bean=new RegisterBean();
						bean.setEmp_id(rs.getInt("emp_id"));
						bean.setFirst_name(rs.getString("first_name"));
						bean.setLast_name(rs.getString("last_name"));
						bean.setJob_type_id(rs.getInt("job_type_id"));
						bean.setWork_id(rs.getInt("work_id"));
						bean.setUname(rs.getString("user_name"));
						bean.setPassword(rs.getString("pass"));
						bean.setAddress(rs.getString("emp_add"));
						bean.setCity_id(rs.getInt("city_id"));
						bean.setState_id(rs.getInt("state_id"));
						bean.setPhoneno(rs.getLong("phoneno"));
						bean.setEmail(rs.getString("email"));
						bean.setPhoto(rs.getString("photo"));
						bean.setStatus(rs.getInt("isactive"));
						bean.setWork_name("");
						bean.setJob_name(rs.getString("job_name"));
						bean.setCity_name(rs.getString("city_name"));
						bean.setState_name(rs.getString("state_name"));
						bean.setShop_name(rs.getString("branch_name"));
						return bean;
					}

				}

		  }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}
	
}
