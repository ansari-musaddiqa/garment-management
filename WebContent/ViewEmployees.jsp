<%@page import="com.dao.RegisterDao"%>
<%@page import="com.bean.RegisterBean"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
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
          <li class="breadcrumb-item active">Employees</li>
        </ol>
        
          <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-users-cog"></i>
            Employees
          </div>
          	<div class="card-body">
            	
       			<div class="row" style="margin-bottom:15px;">
            			<div class="col-md-9">
      						<a type="button" href="ViewJobType.jsp">
      							<i class="fas fa-people-carry" style="color:black; margin-right:5px;"></i>EMPLOYEE TYPE
      						</a><br>
      						<a type="button" href="ViewTypeOfWork.jsp">
      							<i class="fas fa-tools"style="color:black; margin-right:8px;"></i>TYPEs OF JOB-WORK
      						</a>
      					</div>
           				<div class="col-md-3">
			                	<a class="btn btn-primary btn-block" href="register.jsp">
			                		<i class="fas fa-plus"style="margin-right:9px;"></i>Register New Employee
			                	</a>
			            </div>
			    </div>
			
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable">
                <thead>
                  <tr>
                  	<th>ID</th>
                    <th>View</th>
                    <th>Shop</th>
                    <th>Name</th>
                    <th>Employee Type</th>
                    <th>Type Of Job-Work</th>
                    <th>Contact No.</th>
                    <th>Address</th>
                    <th>Update</th>
                    <th>Delete</th>
                  </tr>
                </thead>
                
                <tbody>
                  	<%
                    RegisterDao dao=new RegisterDao();
              		List<RegisterBean> list=dao.getAllEmployees();
              		for(RegisterBean b:list)
              		{
              			if(b.getStatus()==1)
              			{
              					
              %>
              
                  <tr>
                  	<td><%=b.getEmp_id() %></td>
                  	<td>
                  		<form action="profilecontroller" method="post">
                  			<input type="hidden" name = "id" value = "<%= b.getEmp_id()%>">
                  			
                  			<!--<input class="btn btn-primary btn-uesr btn-block btn-sm" type="submit" name="action" value="Update">
                  			 -->
               					<button type="submit" value="empdetails" name="action">
               					 <img src="upload/<%=b.getPhoto()%>" height="50" width="50">
                  				</button>
                  		</form>
                  	</td>   
                  	<td><%=b.getShop_name() %></td>
                  	<td><%=b.getFirst_name()+" "+b.getLast_name() %></td>
                    <td><%=b.getJob_name()%></td>
                    <td><%=b.getWork_name() %></td>
                    <td><%=b.getPhoneno()%></td>
                    <td><%=b.getAddress()%></td>
                    <td>
                    	<form action="registercontroller" method="post">
                  			<input type="hidden" name = "id" value = "<%= b.getEmp_id()%>">
                  			<input class="btn btn-primary btn-uesr btn-block btn-sm" type="submit" name="action" value="Update">
                  		</form>
                    </td>
                    <td>
                    	<form action="registercontroller" method="post">
                  			<input type="hidden" name = "id" value = "<%=b.getEmp_id()%>">
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