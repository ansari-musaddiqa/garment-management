<%@page import="com.bean.RegisterBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.RegisterDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<% RegisterBean bean=(RegisterBean)request.getAttribute("empDid");%>

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
      		<div class="card-header heading" align="center">Employee Details	
      			<form action="registercontroller" method="post">
      		      			<input type="hidden" name = "id" value = "<%= bean.getEmp_id()%>">
            	<button type="submit" class="btn btn-primary btn-block col-md-4" formnovalidate name="action" value="update">Edit</button>		                 
				</form>
			</div>
      				<div class="card-body" align="center">
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
																      // System.out.println("profile:"+bean.getEmp_id());
																    %>
																    <tbody>
																      <tr>
																        <th style="padding:7px;">Emp_id</th>
																        <td style="padding:7px;"><%=bean.getEmp_id()%></td>
																      </tr>
																      <tr>
																        <th style="padding:7px;">First Name</th>
																        <td style="padding:7px;"><%=bean.getFirst_name()%></td>
																      </tr>
																       <tr>
																        <th style="padding:7px;">Last Name</th>
																        <td style="padding:7px;"><%=bean.getLast_name()%></td>
																      </tr>
																        <tr>
																        <th style="padding:7px;">Work</th>
																        <td style="padding:7px;"><%=bean.getWork_name()%></td>
																      </tr>
										 						    
										 						      <tr>
																        <th style="padding:7px;">Address</th>
																        <td style="padding:7px;"><%=bean.getAddress()%></td>
																      </tr>
										 						    
										 						      <tr>
																        <th style="padding:7px;">City</th>
																        <td style="padding:7px;"><%=bean.getCity_name()%></td>
																      </tr>
										 						    
										 						      <tr>
																        <th style="padding:7px;">State</th>
																        <td style="padding:7px;"><%=bean.getState_name()%></td>
																      </tr>
										 						    
										 						      <tr>
																        <th style="padding:7px;">Phone</th>
																        <td style="padding:7px;"><%=bean.getPhoneno()%></td>
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
    