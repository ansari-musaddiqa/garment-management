<%@page import="com.bean.CustomerBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CustomerDao"%>
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
            <a href="common.jsp">DASHBOARD</a>
          </li>
          <li class="breadcrumb-item">
          	<a href="#">USERS</a>
          </li>
          <li class="breadcrumb-item active">Customers</li>
        </ol>
        
          <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-person-booth"></i>
            Customers
          </div>
          	<div class="card-body">
            	
       			<div class="row" style="margin-bottom:15px;">
            			<div class="col-md-9">
            			</div>
           				<div class="col-md-3">
			                	<a class="btn btn-primary btn-block" href="addCustomer.jsp">
			                		<i class="fas fa-plus"style="margin-right:9px;"></i>Add New Customer
			                	</a>
			            </div>
			      </div>
			
	  	    <div class="table-responsive">
              <table class="table table-bordered" id="dataTable">
                <thead>
                  <tr>
                  
                  	<th>ID</th>
                    <th>Name</th>
                    <th>Contact No.</th>
                    <th>E-mail ID</th>
                    <th>Address</th>
                    <th>City</th>
                    <th>State</th>
                    <th>Update</th>
                    <th>Delete</th>
                  </tr>
                </thead>
                
                <tbody>
                  <%
                  	CustomerDao cd=new CustomerDao();
                  	List<CustomerBean> list=cd.getAllCustomer();
                  	for(CustomerBean customer : list)
                  	{
                  		if(customer.getStatus()==1)
                  		{
                  %>
                  <tr>
                  <td><%= customer.getCustid() %></td>
                  <td><%= customer.getFname() %> <%= customer.getLname() %></td>
                 
                  <td><%= customer.getNum() %></td>
                  <td><%= customer.getEmail() %></td>
                  <td><%= customer.getAdd() %></td>
                  <td><%= customer.getCnm() %></td>
                  <td><%= customer.getSnm() %></td>
                  	<td>
                    	<form action="customercontroller" method="post">
                  			<input type="hidden" name = "id" value = "<%=customer.getCustid()%>">
                  			<input class="btn btn-primary btn-uesr btn-block btn-sm" type="submit" name="action" value="Update">
                  		</form>
                    </td>
                    <td>
                    	<form action="customercontroller" method="post">
                  			<input type="hidden" name = "id" value = "<%=customer.getCustid()%>">
                  			<input class="btn btn-primary btn-uesr btn-block btn-sm" type="submit" name="action" value="Delete">
                  		</form>
                    </td>
                  </tr>
              <%
                  		}
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