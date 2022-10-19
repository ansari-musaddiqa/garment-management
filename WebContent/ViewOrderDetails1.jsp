<%@page import="com.bean.RegisterBean"%>
<%@page import="com.dao.RegisterDao"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.OrderBean"%>
<%@page import="com.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<% int forid; %>
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
          
          <li class="breadcrumb-item active">ORDER Details</li>
        </ol>
        
          <div class="card mb-3">
          <div class="card-header">
            <i class="fa fa-shopping-basket" aria-hidden="true"></i>
            Order Details
          </div>
          	<div class="card-body">
			
          <div class="table-responsive">
              <table class="table table-bordered tbl_pro" id="dataTable">
                   <thead>
                  <tr>
                    <th>Id</th>
                  	<th>Status</th>
                  	<th>Order ID</th>
                  	<th>Product Name</th>
                  	<th>Color</th>
                  	<th>Size</th>
                    <th>Quantity</th>
                    <th>Customization</th>
                    <th>Job-Work-Type</th>
                    <th>Job Work Charges</th>
                    <th>Description</th>
                    <th>Unit Cost</th>
                    <th>Sub Total</th>
                    <th>Assign</th>
                  </tr>
                </thead>
                <tbody>
              <%
              	OrderDao dao=new OrderDao();
                List <OrderBean> l=dao.getAllOrderDetails();
                for(OrderBean b:l)
                {
              %>
          			<%
          			forid=b.getOrder_d_id() ;
          			%>
                  <tr>
                  	<td><%=b.getOrder_d_id() %></td> 
                  	
                  	         		<%if(b.getCustomization()==1)
				  				{
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
				  				}
				  				else
				  				{
				  				%>
				  					<td style="color:#28a745; font-weight: bold;">COMPLETED</td>	
				  				<%
				  				}
				  				%>
        
                  	<td><%=b.getOrder_id()%></td>
                  	<td><%=b.getProd_name()%></td>
                  	<td><%=b.getColor_name()%></td>
                  	<td><%=b.getSize_name()%></td>
                  	<td><%=b.getQty() %></td>
                  	
                  		<%if(b.getCustomization()==1)
  				{
  				%>
  				<td>yes</td>
  				<%	
  				}
  				else
  				{
  				%>
  					<td>no</td>	
  				<%
  				}
  				%>
            
            
                  	<td><%=b.getJob_work_type_name() %></td>
                  	<td><%=b.getJob_work_charges()%></td>
                  	<td><%=b.getDescription()%></td>
                  	<td><%=b.getUnit_cost()%></td>
                  	<td><%=b.getSubtotal() %></td> 
                  	                 	
                  
  		<%
             		if(b.getCustomization()==1)
                  		{
         %>	 
                  	
           					<!-- Button to Open the Modal -->
						  			<% if(b.getAssign()==0)
						  			{
						  			%>
									<td>
				                  		<form action="ordercontroller" method="post">
				                  			<input type="hidden" name = "id" value = "<%=b.getOrder_d_id()%>">
				                  			<button class="btn btn-primary btn-uesr btn-block" type="submit" name="action" value="assignjobwork">
				                  				Assign
				                  			</button>
				                  		</form>
				                  	</td>	
                 		<%
						  			}
						  			else
						  			{
						  			%>	
						  			<td>
				                  		<form action="ordercontroller" method="post">
				                  			<input type="hidden" name = "id" value = "<%=b.getOrder_d_id()%>">
				                  			<button class="btn btn-primary btn-uesr btn-block" type="submit" name="action" value="assignjobwork" disabled>
				                  				Assign
				                  			</button>
				                  		</form>
				                  	</td>	
				                  	
				                  	<% 
                  					}
              		%>
						  			  <!-- The Modal -->
                  	<!-- musaddiqa -->      
		              	   <%
                  		}
                  		else
                  		{
                  			%>
                  					<td> </td>
                  			<% 
                  		}
                  	%>
	                                 
                 
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

 
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <jsp:include page="script.jsp"></jsp:include>
  
</body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>