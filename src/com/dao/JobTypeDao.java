package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.bean.JobTypeBean;
import com.bean.MainCategoryBean;
import com.connect.Connect;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class JobTypeDao {
		public void insertJobType(JobTypeBean bean)
		{
			try
			{
				Connection con=Connect.sqlConnection();
				String query="insert into job_type(job_name,doi,dou,isactive)  values(?,?,?,?)";
				PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
				ps.setString(1, bean.getJob_name());
				
				DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
				LocalDateTime now=LocalDateTime.now();
				
				ps.setString(2, now.toString());
				ps.setString(3, now.toString());
				ps.setInt(4, bean.getStatus());
				ps.executeUpdate();
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		public  List<JobTypeBean> getAllJobType() 
		{
			List<JobTypeBean> list=new ArrayList<JobTypeBean>();
			try
			{
					Connection con=Connect.sqlConnection();
					
					String query="select * from job_type";
					PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
					ResultSet rs=ps.executeQuery();
					while(rs.next())
					{
						JobTypeBean bean=new JobTypeBean();
						bean.setJob_type_id(rs.getInt(1));
						bean.setJob_name(rs.getString(2));
						bean.setStatus(rs.getInt("isactive"));
						list.add(bean);
					}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			return list;
		}
		public void deleteById(int id)
		{
			try
			{
				DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
				LocalDateTime now=LocalDateTime.now();
				
				Connection con=Connect.sqlConnection();
				String query="update job_type set isactive=?,dou='"+dtf.format(now)+"' where job_type_id=?";
				PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
				ps.setInt(1, 0);
				ps.setInt(2, id);
				ps.executeUpdate();
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		public void updateById(JobTypeBean bean)
		{
			try
			{
				DateTimeFormatter dtf=DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
				LocalDateTime now=LocalDateTime.now();
				
				Connection con=Connect.sqlConnection();
				String query="update job_type set job_name=?,dou='"+dtf.format(now)+"' where job_type_id=?";
				PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
				ps.setString(1, bean.getJob_name());
				ps.setInt(2, bean.getJob_type_id());
				ps.executeUpdate();
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		public JobTypeBean getJobTypeById(int id)
		{
			System.out.println("dao"+id);
			 JobTypeBean bean=new JobTypeBean();
			try
			{
				Connection con=(Connection)Connect.sqlConnection();
				String query="select * from job_type where job_type_id=?";
				PreparedStatement ps=(PreparedStatement) con.prepareStatement(query);
				ps.setInt(1, id);
				ResultSet rs=ps.executeQuery();
				if(rs.next())
				{
					bean.setJob_type_id(rs.getInt("job_type_id"));
					bean.setJob_name(rs.getString("job_name"));
					bean.setStatus(rs.getInt("isactive"));
				}
				
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			return bean;
		}
}
