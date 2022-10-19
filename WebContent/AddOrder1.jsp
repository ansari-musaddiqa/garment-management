<%@page import="com.bean.OrderBean"%>
<%@page import="com.bean.RegisterBean"%>
<%@page import="com.dao.RegisterDao"%>
<%@page import="com.dao.JobTypeDao"%>
<%@page import="com.bean.JobTypeBean"%>
<%@page import="com.bean.TypeOfWorkBean"%>
<%@page import="com.dao.TypeOfWorkDao"%>
<%@page import="com.bean.ProductBean"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CustomerDao"%>
<%@page import="com.bean.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<%
 List<OrderBean> show=(List<OrderBean>)request.getAttribute("show");
 String t=(String)request.getAttribute("total");
%>

<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:06 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->

<jsp:include page="head.jsp"></jsp:include>

<body id="page-top">

  <jsp:include page="header.jsp"></jsp:include>
  
  <div id="wrapper">

    <jsp:include page="sidebar.jsp"></jsp:include>
    
    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">DASHBOARD</a>
          </li>
          <li class="breadcrumb-item">
            <a href="#">ORDER</a>
          </li>
          <li class="breadcrumb-item active">Add Order</li>
        </ol>
        
        <div class="card mb-3">
          <div class="card-header heading">
          <i class="fas fa-cart-plus"></i>
            Add Order</div>
          	<div class="card-body">
            
      <form action="ordercontroller" method="post" onSubmit="return validate();">
       	    	
       	    <div class="form-group">
      				<div class="form-row">
      					<div class="col-md-9">
      					</div>
           				<div class="col-md-3">
                			<div class="form-label-group">
			                	<a class="btn btn-primary btn-block" href="addCustomer.jsp">
			                	<i class="fas fa-plus"style="margin-right:9px;"></i>
			                	Create New Customer</a>
			                </div>
			            </div>
			        </div>
			    </div>	
       	    	
            <div class="table-responsive" style="margin-bottom: 20px;">
              <table class="table table-bordered tbl_pro">
                <thead>
                  <tr>
                  	<th>Code</th>
                    <th>Quantity</th>
                    <th>Customization</th>
                    <th>Job-Work-Type</th>
<!--   <th>Job-Worker</th> --> 
                    <th>Job-Work-Charge</th>
                    <th>Description</th>
                    <th>Add</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <select name="code" id="code" class="form-control" required="required" autofocus="autofocus">
                        <option value="Code">Code</option>
                        <%
                        	ProductDao pd = new ProductDao();
                        	List<ProductBean> pro = pd.getAllProduct();
                        	
                        	for(ProductBean pb : pro)
                        	{
                        		if(pb.getQty()!=0)
                        		{
                        %>
                        	
                        	<option value="<%=pb.getCode()%>">
                        		<%= pb.getCode() %>
                        	</option>
                        	
                        <%
                        		}
                        	}
                        %>	
                      </select>
	                      <div class="script1" id="valpro" style="margin-top: 15px;">
					          <div class="form-group">
							  <label class="form-control valbg" id="txtpro">Enter product</label>
							  </div>
						  </div>
                    </td>
	                    <td>
	                   	<input type="number" min="1" id="qty" name="qty" class="form-control" placeholder="Quantity" required="required">
	                    <div class="script1" id="valqty" style="margin-top: 15px;">
					          <div class="form-group">
							  <label class="form-control valbg" id="txtqty">Qty</label>
							  </div>
						  </div>
	                    </td>
                    <td>
                      <div class="btn-group btn-group-toggle" data-toggle="buttons">
                        <label class="btn btn-secondary active">
                          <input type="radio" name="options_cust" value="yes" id="option1"  autocomplete="off"> Yes
                        </label>
                        <label class="btn btn-secondary">
                          <input type="radio" name="options_cust" value="no" id="option2"  autocomplete="off" checked > No
                        </label>
                      </div>
                      
                      
                    </td>
                    <td>
                      <select name="job_work_type" id="job_work_type" class="form-control" required="required" autofocus="autofocus">
                        <option value="job_work_type">Job-Work</option>
						
						<%
					 	 TypeOfWorkDao dao1 = new TypeOfWorkDao();
                    	List<TypeOfWorkBean> li = dao1.getAllTypeOfWork();
                    	
                    	for(TypeOfWorkBean tw : li)
                    	{
                   			if(tw.getStatus()==1)
						%>
							<option value="<%=tw.getWork_id()%>"><%=tw.getWork_name() %></option>
						<%
                    	}
						%>
                      </select>
                      <div class="script1" id="valjob" style="margin-top: 15px;">
					          <div class="form-group">
							  <label class="form-control valbg" id="txtjob">job</label>
							  </div>
					  </div>
	        
                    </td>
                    <td>                    	
                		<input type="number" min="1" id="charge" name="jobworkcharge" class="form-control" placeholder="Job-Work-Charges" required="required">
                    	<div class="script1" id="valch" style="margin-top: 15px;">
					          <div class="form-group">
							  <label class="form-control valbg" id="txtch">charge</label>
							  </div>
						  </div>
                    </td>
                    <td>
                    	<input type="text" id="descrp" name="descrp" class="form-control" placeholder="Description" required="required">
                    </td>
                    <td>
                    	<button type="submit" name="action" value="insert" class="btn btn-success add-pro ml-2" formnovalidate>+</button>
                    </td>
                  </tr>
       
              </table>
       		 </div>
       		
       			</form>	
       			
       				<pre>    </pre>
       				<center><h2 style="color: #dc3545;">Order Summary</h2></center>
             	
            <div class="table-responsive" style="margin-bottom: 20px;">
              <table class="table table-bordered tbl_pro">
                <thead>
                  <tr>
                    <th>Remove</th>
                  	<th>Id</th>
                  	<th>Code</th>
                  	<th>Product Name</th>
                  	<th>Color</th>
                  	<th>Size</th>
                    <th>Quantity</th>
                    <th>Customization</th>
                    <th>Job-Work-Type</th>
<!--                     <th>Job-Worker</th>  -->
                    <th>Job-Work-Charge</th>
                    <th>Description</th>
                    <th>Unit Cost</th>
                    <th>Sub Total</th>
                  </tr>
                </thead>
                <tbody>
                  <%
                  if(show!=null)
                  {
                  	for(OrderBean b:show)
                  	{
                  %>
                  <tr>
                    <td>
                    	<form action="ordercontroller" method="post">
                    	<input type="hidden" name="id" value="<%=b.getSummary_id()%>">
                    	<button type="submit" name="action" value="remove" class="btn btn-danger remove_pro ml-2" formnovalidate>&times;</button>
                    	</form>
                    </td>
                  	<td><%=b.getSummary_id()%></td>
                  	<td><%=b.getCode()%></td>
                  	<td><%=b.getProd_name()%></td>
                  	<td><%=b.getColor_name()%></td>
                  	<td><%=b.getSize_name()%></td>
                  	<td><%=b.getQty() %></td>
                  	<td><%=b.getCustomization()%></td>
                  	<td><%=b.getJob_work_type_name() %></td>
                  	<td><%=b.getJob_work_charges()%></td>
                  	<td><%=b.getDescription()%></td>
                  	<td><%=b.getUnit_cost()%></td>
                  	<td><%=b.getSubtotal() %></td> 
                  </tr>
                  <%
                  	}
                  }
                  %>
       			</tbody>
       	   	  </table>
       	     </div>
             	
            <form action="ordercontroller" method="post" onSubmit="return validate1();">
            
            	<div class="form-group">
      				<div class="form-row">
           				<div class="col-md-6">
                			<div class="form-label-group">
			                <select name="custname" id="custname" class="form-control" placeholder="Customer Name" required="required" autofocus="autofocus">
			                    <option value="Customer Name">Customer Name</option>
								
								<%
									CustomerDao cd = new CustomerDao();
									List<CustomerBean> lst = cd.getAllCustomer();
									
									for(CustomerBean cb : lst)
									{
										System.out.println("\n\t\torder customer id"+cb.getCustid());
								%>    
									<option value="<%=cb.getCustid()%>">
										<%=cb.getFname() + " " + cb.getLname()%>
									</option>
								<%
									}
								%>                
			                </select>
			               	</div>
              			</div>
              			
              			<div class="col-md-6">
                			<div class="form-label-group">
			                <select name="empname" id="orderassign" class="form-control" placeholder="Work Assigned By" required="required" autofocus="autofocus">
			                    <option value="Order Assigned By">Order Assigned By</option>
								
								<%
									RegisterDao rd1 = new RegisterDao();
									List<RegisterBean> lst1 = rd1.getAllEmployees();
									
									for(RegisterBean b : lst1)
									{
										
								%>    
									<option value="<%=b.getEmp_id()%>">
										<%=b.getFirst_name() + " " + b.getLast_name()%>
									</option>
								<%
									}
								%> 
								               
			                </select>
			               	</div>
              			</div>
              		</div>     		
              	</div>
             	
             	
             	<div class="form-group">
		            <div class="form-row">
		               <div class="col-md-6">
		                <div class="form-label-group">
		                  <div class="script1" id="valcus">
				  			<label class="form-control valbg" id="txtcus">Customer</label>
		                  </div>
		              	</div>
		           		</div>
		           		
		           		<div class="col-md-6">
		                <div class="form-label-group">
		                  <div class="script1" id="valemp">
				  			<label class="form-control valbg" id="txtemp">emp</label>
		                  </div>
		              	</div>
		           		</div>
		          </div>
				 </div>
             	
             	
             	<div class="form-group">
      				<div class="form-row">
           	    		  <div class="col-md-4">
           	    			<div class="form-label-group">
           	    				<input type="date" name="returndt" id="returndt" class="form-control" placeholder="Date_Of_Return" required="required" autofocus="autofocus">
			                	<label for="returndt" style="font-weight: 700; color:black;">Date_Of_Return :</label>
                      		</div>
              			</div>
              			<div class="col-md-4">
           	    			<div class="form-label-group">
			                    <input type="number" min=1 name="rcvpmnt" id="rcvpmnt" class="form-control" placeholder="Payment Due" required="required" autofocus="autofocus">
                				<label for="rcvpmnt" style="font-weight: 700; color:black;">Recieved Payment :</label>
			                </div>
                		</div>
                		<div class="col-md-4">
           	    			<div class="form-label-group">
           	    				<input type="number" min=1 name="ttlpmnt" id="ttlpmnt" value="<%= t %>" class="form-control" placeholder="Total Payment" required="required" autofocus="autofocus">
          					
              				<label for="ttlpmnt" style="font-weight: 700; color:black;">Total Payment :</label>
              				</div>
              			</div>
              		</div>
              	</div>
         	
         		
             	<div class="form-group">
		            <div class="form-row">
		               <div class="col-md-4">
		                <div class="form-label-group">
		                  <div class="script1" id="valrdt">
				  			<label class="form-control valbg" id="txtrdt">return</label>
		                  </div>
		              	</div>
		           		</div>
		           		
		           		<div class="col-md-4">
		                <div class="form-label-group">
		                  <div class="script1" id="valpaid">
				  			<label class="form-control valbg" id="txtpaid">paid</label>
		                  </div>
		              	</div>
		           		</div>
		           		
		           		<div class="col-md-4">
		                <div class="form-label-group">
		                  <div class="script1" id="valtot">
				  			<label class="form-control valbg" id="txttot">total</label>
		                  </div>
		              	</div>
		           		</div>
		          </div>
				 </div>
         		
         	
         	 <div class="form-group">
         	<div class="form-row">
             	<div class="col-md-4">
            	  	<div class="form-label-group">
 		        	 		<form action="ordercontroller" method="post">
 		        	 		<button type="submit" name="action" value="placeorder" class="btn btn-primary btn-block" formnovalidate>PlaceOrder</button>
          				</form>
          			</div>
          		</div>
          
          		<div class="col-md-4">
          			<div class="form-label-group">
          				<button type="reset" class="btn btn-primary btn-block" href="#">Reset</button>
          			</div>
          		</div>
          
          		<div class="col-md-4">
           			<div class="form-label-group">  
          				<button type="reset" class="btn btn-primary btn-block" href="#">Cancel</button>
          			</div>
          		</div>
         	</div>
         </div>
         	
			  </form>    	
      
          </div>
        </div>
        
        
              	</div>
      </div>
      <!-- /.container-fluid -->

      <jsp:include page="footer.jsp"></jsp:include>
      
    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <jsp:include page="script.jsp"></jsp:include>
   <jsp:include page="AddOrderValidate.jsp"></jsp:include>
<script  type="text/javascript">

$(document).ready
(
	function(){
	
		  var yes = document.getElementById("option1");
		  var no = document.getElementById("option2");
		  
		  if (yes.value="yes") {
			  document.getElementById('job_work_type').disabled=true;
			  document.getElementById('charge').disabled=true;
		  } 
		  else {
			  document.getElementById('job_work_type').disabled=false;
			  document.getElementById('charge').disabled=false;    
		  }
	
});

$('input[type=radio]').change( function() {
	  // alert("test");   
	   
		  if (document.getElementById("option1").checked == true) 
		  {
			  document.getElementById('job_work_type').disabled=false;
			  document.getElementById('charge').disabled=false;    
		  } 

		  if (document.getElementById("option2").checked ==true) 
		  {  
			  document.getElementById('job_work_type').disabled=true;
			  document.getElementById('charge').disabled=true;
		
		  }
	});
	
</script>
  
</body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>