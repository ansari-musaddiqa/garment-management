<%@page import="com.bean.OrderBean"%>
<%@page import="com.dao.OrderDao"%>
<%@page import="com.bean.ShopBean"%>
<%@page import="com.dao.ShopDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html lang="en">

<%
	List<OrderBean> list1 = (List<OrderBean>)request.getAttribute("show");
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
            <a href="dashboard.jsp">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Order Report</li>
        </ol>
        
        <div class="heading" style="margin-bottom: 40px;">Order Report </div>
       
        <form onSubmit="return validate()" action="ordercontroller" method="post">
        
          <div class="form-group">         
            <div class="form-row">
            
 			  <div class="col-md-1" style="text-align: right; padding-top: 6px;  font-weight: bold;">  
                <label for="shop">Shop </label>
              </div>           
            	
              <div class="col-md-3">
              	<div class="form-label-group">
                  <select id="shop" name="shop" class="form-control" required="required" autofocus = "autofocus">
                    <option value="Shop" id="0">Shop</option>
                  	<%
                  	ShopDao sd=new ShopDao();
                  	List<ShopBean> list=sd.getAllShop();
                  	
                  	for(ShopBean sb:list)
                  	{
                  		if(sb.getStatus() == 1)
                  		{
                  	%>
                  	<option value="<%=sb.getBid()%>"><%=sb.getBnm()%></option>
                  	<%
                  		}
                  	}
                  	%>
                  </select>
                </div>
              </div>
              
            </div>
          </div>
        
          <div class="form-group">         
            <div class="form-row">
            
 			  <div class="col-md-1" style="text-align: right; padding-top: 3px;  font-weight: bold;">  
                <label for="start">From </label>
                  <i style="color: red; font-size: 20px;">*</i>
              </div>           
            
              <div class="col-md-3">
				<input type="date" id="start" name="trip-start" max="2020-08-17" class="form-control" autofocus = "autofocus">
              </div>
              
            </div>
          </div>
          
          <div class="form-group">         
            <div class="form-row">
            
 			  <div class="col-md-1" style="text-align: right; padding-top: 3px;  font-weight: bold;">
                  <label for="to">To </label>
                  <i style="color: red; font-size: 20px;">*</i>
              </div>           
            
              <div class="col-md-3">    
				<input type="date" id="to" name="to" max="2020-08-18" class="form-control" autofocus = "autofocus">
              </div>
              
            </div>
          </div>
		
		  <div class="form-group">         
            <div class="form-row">
            
 			  <div class="col-md-1">
              </div>           
            
              <div class="col-md-2">
              	<button type="submit" class="btn btn-primary btn-block" name="action" value="show" formnovalidate>SHOW REPORT</button>		            		            
              </div>
              
            </div>
          </div>
          
        </form>
        
		<div class="table-responsive">
              <table class="table table-bordered tbl_pro" id="dataTable">
                <thead>
                  <tr>
                    <th>Id</th>
                    <th>Order Status</th>
                    <th>Shop Name</th>
                  	<th>Customer Name</th>
                  	<th>Assigned By</th>
                    <th>Total Amount</th>
                    <th>Received Amount</th>
                    <th>Due Amount</th>
                    <th>Date Of Return</th>
                  </tr>
                </thead>
                <tbody>
                <%
                if(list1 != null)
              	{
              	for(OrderBean bean:list1)
                {
                	
                
                %>
                  <tr>
                  	<td><%= bean.getOrder_id()%></td>
                  	
                  	<%
                  		if(bean.getOrder_status()==1)
                  		{
                  	%>	
                  		<td ><p id="m" style="font-weight: bold;">COMPLETED</p></td>
                  	<%
                  		}
                  		else if(bean.getOrder_status()==2)
                  		{
                  			%>
                  					<td style="color:#28a745; font-weight: bold;"><p id="m">DELIEVERED</p></td>
                  			<% 
                  		}
                  		else
                  		{
                  			%>
                  					<td style="color:#dc3545; font-weight: bold;"><p id="m">RUNNING</p></td>
                  			<% 
                  		}
                  	%>
                  	<td><%= bean.getShop_name()%></td>
                  	<td><%= bean.getCust_name()%></td>
                  	<td><%= bean.getEmp_name()%></td>
                  	<td><%= bean.getTotal_payment()%></td>
                  	<td><%= bean.getRcv_payment()%></td>
                  	<td><%= bean.getDue_payment()%></td>
                  	
                  	
                  	
              	<td><%=bean.getDate_of_return() %></td>
                  	
            
                  </tr>
                  <%
                }
                }
                  %>
       			</tbody>
       	   	  </table>
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
  
  <script type="text/javascript">
  	
  </script>
  
</body>

<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>