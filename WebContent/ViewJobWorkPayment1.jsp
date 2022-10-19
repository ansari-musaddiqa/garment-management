<%@page import="com.bean.RegisterBean"%>
<%@page import="com.dao.RegisterDao"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.OrderBean"%>
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
          <li class="breadcrumb-item active">Job-Worker Details</li>
        </ol>
        
          <div class="card mb-3">
          <div class="card-header">
            <i class="fa fa-shopping-basket" aria-hidden="true"></i>
            Job-Worker Details
          </div>
          	<div class="card-body">
			
          <div class="table-responsive">
              <table class="table table-bordered tbl_pro" id="dataTable">
                   <thead>
                  <tr>
                  	<th>Id</th>
                  	<th>status</th>
                  	<th>Order_Details_ID</th>
                  	<th>worker_name</th>
                  	<th>work_name</th>
                  	<th>Date_of_return</th>
                    <th>Total_charges</th>
                    <th>Paid_amount</th>
                    <th>Due_amount</th>
                    <th>Description</th>
                    <th>update</th>
                   	<th>complete</th>
                   	</tr>
                </thead>
                <tbody>
              <%
              	OrderDao dao=new OrderDao();
                List <OrderBean> l=dao.getWokerPaymentDetails();
                for(OrderBean b:l)
                {
              %>
          
                  <tr>
                  	<td><%=b.getJobworker_pay_id() %></td> 
                  	<%
                  		if(b.getIsactive()==1)
                  		{
                  		%>
                  			<td style="color:#28a745; font-weight: bold;">COMPLETED</td>
                  		<% 
                  		}
                  		else
                  		{
                  		%>
                  			<td style="color:#dc3545; font-weight: bold;">RUNNING</td>
                  		<% 
                  		}
                  	%>
                  	
                  	
                  	
                  	
                  	<td><%=b.getOrder_d_id()%></td>
                  	<td><%=b.getWorker_name()%></td>
                  	<td><%=b.getJob_work_type_name()%></td>
                  	<td><%=b.getDate_of_return()%></td>
                  	<td><%=b.getWorker_charges()%></td>
                  	<td><%=b.getWorker_paid_amt()%></td>
                  	<td><%=b.getDue_payment() %></td>
                  	<td><%=b.getDescription()%></td> 	
<td>			
												<%						          
						          	     		if(b.getIsactive()==1)
						     					     		{
						     					%>
						     				<form action="ordercontroller" method="post">
						     				<input type="hidden" name="id" value="<%=b.getJobworker_pay_id()%>">
									      		<button type="submit" name="action" value="updatejobwork" class="btn btn-primary"  disabled>
												    update
												  </button>
							  				</form>
							 					     	<% 
						     					     		}
						     					     		else
						     					     		{
						     					     	%>
						      				<form action="ordercontroller" method="post">
						     					<input type="hidden" name="id" value="<%=b.getJobworker_pay_id()%>">
									      		<button type="submit" name="action" value="updatejobwork" class="btn btn-primary" >
												    update
												 </button>
							  				</form>
							 									        <%	
						     					     		}
						     					     	%>
						   
</td>
                  	<td>
                  		<form action="ordercontroller" method="post">
                  			<input type="hidden" name = "id" value = "<%=b.getJobworker_pay_id()%>">
                  									     					     	<%
						     					     		if(b.getIsactive()==1)
						     					     		{
						     					     	%>
								                  			<button class="btn btn-primary btn-uesr btn-block" type="submit" name="action" value="completeJobwork" disabled>
								                  				complete
								                  			</button>
						     					     	<% 
						     					     		}
						     					     		else
						     					     		{
						     					     	%>
									                  			<button class="btn btn-primary btn-uesr btn-block" type="submit" name="action" value="completeJobwork">
									                  				complete
									                  			</button>
						     					        <%	
						     					     		}
						     					     	%>
						     					     	   
                  			
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
  
</body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>