package com.bean;


public class OrderBean {
	private String code;
	private int qty;
	private int customization;
	private int job_work_Type_id;
	private String job_work_type_name;
	private int job_work_charges=0;
	private String description;
	
	private String prod_name;
	private int color_id;
	private String color_name;
	private int size_id;
	private String size_name;
	private int unit_cost;
	private long subtotal;
	private int prod_id;
	
	
	private String date_of_return;
	private long total_payment;
	private long rcv_payment;
	
	private int summary_id;
	
	private int cust_id;
	private String cust_name;
	
	private long due_payment;
	
	private int shop_id;
	private int order_id;
	private int order_d_id;
	
	private int worker_id;
	private String worker_name;
	private long worker_charges;
	private String frmdt;
	private String todt;
	
	public String getFrmdt() {
		return frmdt;
	}
	public void setFrmdt(String frmdt) {
		this.frmdt = frmdt;
	}
	public String getTodt() {
		return todt;
	}
	public void setTodt(String todt) {
		this.todt = todt;
	}
	public long getWorker_charges() {
		return worker_charges;
	}
	public void setWorker_charges(long worker_charges) {
		this.worker_charges = worker_charges;
	}
	public String getWorker_name() {
		return worker_name;
	}
	public void setWorker_name(String worker_name) {
		this.worker_name = worker_name;
	}
	private int emp_id;
	private String emp_name; 
	
	private int order_status;
	private String shop_name;

	private long worker_paid_amt;
	private int jobworker_pay_id;
	
	
	private int isactive;
	private int assign;
	
	public int getAssign() {
		return assign;
	}
	public void setAssign(int assign) {
		this.assign = assign;
	}
	public int getIsactive() {
		return isactive;
	}
	public void setIsactive(int isactive) {
		this.isactive = isactive;
	}
	public int getJobworker_pay_id() {
		return jobworker_pay_id;
	}
	public void setJobworker_pay_id(int jobworker_pay_id) {
		this.jobworker_pay_id = jobworker_pay_id;
	}
	public long getWorker_paid_amt() {
		return worker_paid_amt;
	}
	public void setWorker_paid_amt(long worker_paid_amt) {
		this.worker_paid_amt = worker_paid_amt;
	}
	public int getWorker_id() {
		return worker_id;
	}
	public void setWorker_id(int worker_id) {
		this.worker_id = worker_id;
	}
	public int getOrder_d_id() {
		return order_d_id;
	}
	public void setOrder_d_id(int order_d_id) {
		this.order_d_id = order_d_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	public int getShop_id() {
		return shop_id;
	}
	public void setShop_id(int shop_id) {
		this.shop_id = shop_id;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	
	
	
	public long getRcv_payment() {
		return rcv_payment;
	}
	public void setRcv_payment(long rcv_payment) {
		this.rcv_payment = rcv_payment;
	}
	public int getCust_id() {
		return cust_id;
	}
	public void setCust_id(int cust_id) {
		this.cust_id = cust_id;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	
	
	public int getSummary_id() {
		return summary_id;
	}
	public void setSummary_id(int summary_id) {
		this.summary_id = summary_id;
	}
	public int getProd_id() {
		return prod_id;
	}
	public void setProd_id(int prod_id) {
		this.prod_id = prod_id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getCustomization() {
		return customization;
	}
	public void setCustomization(int customization) {
		this.customization = customization;
	}
	public int getJob_work_Type_id() {
		return job_work_Type_id;
	}
	public void setJob_work_Type_id(int job_work_Type_id) {
		this.job_work_Type_id = job_work_Type_id;
	}
	public String getJob_work_type_name() {
		return job_work_type_name;
	}
	public void setJob_work_type_name(String job_work_type_name) {
		this.job_work_type_name = job_work_type_name;
	}
	public int getJob_work_charges() {
		return job_work_charges;
	}
	public void setJob_work_charges(int job_work_charges) {
		this.job_work_charges = job_work_charges;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getColor_id() {
		return color_id;
	}
	public void setColor_id(int color_id) {
		this.color_id = color_id;
	}
	public String getColor_name() {
		return color_name;
	}
	public void setColor_name(String color_name) {
		this.color_name = color_name;
	}
	public int getSize_id() {
		return size_id;
	}
	public void setSize_id(int size_id) {
		this.size_id = size_id;
	}
	public String getSize_name() {
		return size_name;
	}
	public void setSize_name(String size_name) {
		this.size_name = size_name;
	}
	public int getUnit_cost() {
		return unit_cost;
	}
	public void setUnit_cost(int unit_cost) {
		this.unit_cost = unit_cost;
	}
	public long getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(long subtotal) {
		this.subtotal = subtotal;
	}
	
	
	
	public String getDate_of_return() {
		return date_of_return;
	}
	public void setDate_of_return(String date_of_return) {
		this.date_of_return = date_of_return;
	}
	public long getTotal_payment() {
		return total_payment;
	}
	public void setTotal_payment(long total_payment) {
		this.total_payment = total_payment;
	}
	public long getDue_payment() {
		return due_payment;
	}
	public void setDue_payment(long due_payment) {
		this.due_payment = due_payment;
	}
	
}
