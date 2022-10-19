<%@page import="com.bean.ProfileBean"%>
<%@page import="com.bean.RegisterBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.RegisterDao"%>
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
    <!-- Sidebar -->
   <jsp:include page="sidebar.jsp"></jsp:include>

  <div id="content-wrapper">

<div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb"><!--
          <li class="breadcrumb-item">
            <a href="#"></a>
          </li>-->
          <li class="breadcrumb-item active">Information</li>
        </ol>
		
	   <div class="card card-register mx-auto mt-5">
      		<div class="card-header heading" align="center">Profile		
      			<form action="registercontroller" method="post">
      			<%
      			HttpSession ses=request.getSession();
				int id=(int) ses.getAttribute("id");
      			%>
                  			<input type="hidden" name = "id" value = "<%= id%>">
            	<button type="submit" class="btn btn-primary btn-block col-md-4" formnovalidate name="action" value="update">Edit</button>		                 
				</form>
			</div>
      				<div class="card-body" align="center">
       										<% 
								    		   RegisterBean bean=RegisterDao.getProfile();
								    		%>			
								    <div class="form-row">
              							<div class="col-md-6">
                							<div class="form-label-group">
											        <img src="upload\<%=bean.getPhoto()%>" class="img-responsive img-circle center-block" alt="Cinque Terre" width="350" height="350"> 
											</div>
	      								</div>
	      										<div class="col-md-6">
                									<div class="form-label-group">
														<table class="table table-borderless">
																    <thead>
																    		
																    </thead>
																    <%
																       System.out.println("profile:"+bean.getEmp_id());
																    %>
																    <tbody>
																      <tr>
																        <th>Emp_id</th>
																        <td><%=bean.getEmp_id()%></td>
																      </tr>
																      <tr>
																        <th>First Name</th>
																        <td><%=bean.getFirst_name()%></td>
																      </tr>
																       <tr>
																        <th>Last Name</th>
																        <td><%=bean.getLast_name()%></td>
																      </tr>
																        <tr>
																        <th>Work</th>
																        <td><%=bean.getWork_name()%></td>
																      </tr>
										 						    
										 						      <tr>
																        <th>Address</th>
																        <td><%=bean.getAddress()%></td>
																      </tr>
										 						    
										 						      <tr>
																        <th>City</th>
																        <td><%=bean.getCity_name()%></td>
																      </tr>
										 						    
										 						      <tr>
																        <th>State</th>
																        <td><%=bean.getState_name()%></td>
																      </tr>
										 						    
										 						      <tr>
																        <th>Phone</th>
																        <td><%=bean.getPhoneno()%></td>
																      </tr>
										 						   
										 						        <tr>
																        <th>E-mail</th>
																        <td><%=bean.getEmail()%></td>
																      </tr>
										 						   
										 						    </tbody>
										 					  </table>
														</div>
	      										</div>
	   									<div>
					</div>
			</div>
		</div>
 </div>
 </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
   
<jsp:include page="footer.jsp"></jsp:include>		
   
   </div>
    <!-- /.content-wrapper -->
</div>  
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  
  <!-- Bootstrap core JavaScript-->
<jsp:include page="script.jsp"></jsp:include>
</body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>
    