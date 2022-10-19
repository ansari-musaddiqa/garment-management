package com.bean;

public class SubCategoryBean {
	private int sub_cat_id;
	private int main_cat_id;
	private String sub_cat_name;
	private String cat_type_name;
	private String main_cat_name;
	private String descrip;
	private int status;
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getMain_cat_name() {
		return main_cat_name;
	}
	public void setMain_cat_name(String main_cat_name) {
		this.main_cat_name = main_cat_name;
	}
	public String getCat_type_name() {
		return cat_type_name;
	}
	public void setCat_type_name(String cat_type_name) {
		this.cat_type_name = cat_type_name;
	}
	public int getSub_cat_id() {
		return sub_cat_id;
	}
	public void setSub_cat_id(int sub_cat_id) {
		this.sub_cat_id = sub_cat_id;
	}
	public int getMain_cat_id() {
		return main_cat_id;
	}
	public void setMain_cat_id(int main_cat_id) {
		this.main_cat_id = main_cat_id;
	}
	public String getSub_cat_name() {
		return sub_cat_name;
	}
	public void setSub_cat_name(String sub_cat_name) {
		this.sub_cat_name = sub_cat_name;
	}
	public String getDescrip() {
		return descrip;
	}
	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}
}
