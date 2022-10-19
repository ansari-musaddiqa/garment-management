package com.bean;

public class CategoryTypeBean {
	private int cat_type_id;
	private String cat_type_name;
	private int status; 
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getCat_type_id() {
		return cat_type_id;
	}
	public void setCat_type_id(int cat_type_id) {
		this.cat_type_id = cat_type_id;
	}
	public String getCat_type_name() {
		return cat_type_name;
	}
	public void setCat_type_name(String cat_type_name) {
		this.cat_type_name = cat_type_name;
	}
}
