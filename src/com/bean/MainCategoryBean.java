package com.bean;

public class MainCategoryBean {
  private int main_cat_id;
  private String main_cat_name;
  private int cat_type_id;
  private String cat_type_name;
  private int status;
  public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public String getCat_type_name() {
	return cat_type_name;
}
public void setCat_type_name(String cat_type_name) {
	this.cat_type_name = cat_type_name;
}
private String desc;
public int getMain_cat_id() {
	return main_cat_id;
}
public void setMain_cat_id(int main_cat_id) {
	this.main_cat_id = main_cat_id;
}
public int getCat_type_id() {
	return cat_type_id;
}
public void setCat_type_id(int cat_type_id) {
	this.cat_type_id = cat_type_id;
}
public String getMain_cat_name() {
	return main_cat_name;
}
public void setMain_cat_name(String main_cat_name) {
	this.main_cat_name = main_cat_name;
}
public String getDesc() {
	return desc;
}
public void setDesc(String desc) {
	this.desc = desc;
}  
}
