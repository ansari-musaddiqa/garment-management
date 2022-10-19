<%@page import="com.bean.CityBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CityDao"%>
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
          	<a href="#">ADDRESS</a>
          </li>
          <li class="breadcrumb-item active">City</li>
        </ol>
        
          <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-landmark"> </i>
            City
          </div>
          	<div class="card-body">
            	
       			<div class="row" style="margin-bottom:15px;">
            			<div class="col-md-9">
      						<a type="button" href="ViewState.jsp">
      							<i class="fas fa-map-marker-alt" style="color:black; margin-right:5px;"></i>State
      						</a>
      					</div>
           				<div class="col-md-3">
			                	<a class="btn btn-primary btn-block" href="addcity.jsp">
			                		<i class="fas fa-plus"style="margin-right:9px;"></i>Add New City
			                	</a>
			            </div>
			      </div>
			
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable">
                <thead>
                  <tr>
                  	<th>ID</th>
                    <th>City</th>
                    <th>State</th>
                    <th>Update</th>
                    <th>Delete</th>
                  </tr>
                </thead>
                
                <tbody>
                  
                  <%
                  	CityDao cd=new CityDao();
                  	List<CityBean> list = cd.getAllCity();
                  	
                  	for(CityBean city : list)
                  	{
                  		if(city.getStatus() == 1)
                  		{
                  %>
                  <tr>
                  	<td><%= city.getCid() %></td>
                  	<td><%= city.getCnm() %></td>
                  	<td><%= city.getSnm() %></td>
                  	<td>
                    	<form action="citycontroller" method="post">
                  			<input type="hidden" name = "id" value = "<%= city.getCid()%>">
                  			<input class="btn btn-primary btn-uesr btn-block btn-sm" type="submit" name="action" value="Update">
                  		</form>
                    </td>
                    <td>
                    	<form action="citycontroller" method="post">
                  			<input type="hidden" name = "id" value = "<%= city.getCid()%>">
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