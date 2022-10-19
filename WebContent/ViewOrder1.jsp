<%@page import="com.bean.OrderBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

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
            <a href="dashboard.jsp">DASHBOARD</a>
          </li>
        
           <li class="breadcrumb-item">
            <a href="#">ORDER</a>
          </li>
          
          <li class="breadcrumb-item active">VIEW ORDER</li>
        </ol>
        
          <div class="card mb-3">
          <div class="card-header heading">
            <i class="fa fa-shopping-basket" aria-hidden="true"></i>
            View Order
          </div>
          	<div class="card-body">
			
       			<div class="row" style="margin-bottom:15px;">
            			<div class="col-md-9">
      					</div>
           				<div class="col-md-3">
			                	<a class="btn btn-primary btn-block" href="AddOrder1.jsp">
			                		<i class="fas fa-plus"style="margin-right:9px;"></i>Create New Order
			                	</a>
			            </div>
			      </div>
			
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
                    <th>Complete</th>
                    <th>View Order</th>
                  </tr>
                </thead>
                <tbody>
                <%
                	OrderDao dao=new OrderDao();
                List<OrderBean> list=dao.getAllOrder();
                for(OrderBean bean:list)
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
                  	
                  	<td>
                  		<form action="ordercontroller" method="post">
                  			<input type="hidden" name = "id" value = "<%=bean.getOrder_id()%>">
                  			<input type="hidden" name = "orderstatus" value = "2">  			
                  			<%
                  			if(bean.getOrder_status()==0 || bean.getOrder_status()==2)
                  			{
	                  			%>
	                  			<button class="btn btn-primary btn-uesr btn-block" type="submit" name="action" value="complete" id="cmp" disabled>
	                  				complete
	                  			</button>
	                  			<%
                  			}
                  			else
                  			{
                  				%>
	                  			<button class="btn btn-primary btn-uesr btn-block" type="submit" name="action" value="complete" id="cmp">
	                  				complete
	                  			</button>
	                  			<%
                  			}
	                  		%>
                  		
                  		</form>
                  	</td>
                  	<td>
                  		<form action="ordercontroller" method="post">
                  			<input type="hidden" name = "id" value = "<%=bean.getOrder_id()%>">
                  			<button class="btn btn-primary btn-uesr btn-block" type="submit" name="action" value="viewdetails">
                  				View
                  			</button>
                  		</form>
                  	</td>
                  </tr>
                  <%
                }
                  %>
       			</tbody>
       	   	  </table>
       	     </div>
                 
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
 <script>
$(document).ready(function(){
  $("#cmp").click(function(){
    //alert("The paragraph was clicked.");
    document.getElementById('orderstatus').value="2";
  });
});
</script>
</body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>