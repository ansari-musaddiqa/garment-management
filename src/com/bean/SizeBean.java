package com.bean;


public class SizeBean {
	
	private int sizeid;
	private String size;
	private int cat_id;
	private String cat_nm;
	private int active;
	
	public int getActive() 
	{
		return active;
	}
	public void setActive(int active) 
	{
		this.active = active;
	}
	public int getSizeid() 
	{
		return sizeid;
	}
	public void setSizeid(int sizeid)
	{
		this.sizeid = sizeid;
	}
	public String getSize() 
	{
		return size;
	}
	public void setSize(String size) 
	{
		this.size = size;
	}
	public int getCat_id()
	{
		return cat_id;
	}
	public void setCat_id(int cat_id) 
	{
		this.cat_id = cat_id;
	}
	public String getCat_nm() 
	{
		return cat_nm;
	}
	public void setCat_nm(String cat_nm) 
	{
		this.cat_nm = cat_nm;
	}

}
