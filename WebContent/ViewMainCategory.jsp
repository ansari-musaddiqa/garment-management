<%@page import="com.bean.MainCategoryBean" %>
<%@page import="com.dao.MainCategoryDao" %>
<%@page import="java.util.*" %>
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
          	<a href="#">CATEGORY</a>
          </li>
          <li class="breadcrumb-item active">Main-Category</li>
        </ol>
        
          <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-fw fa-tshirt"> </i>
            Main-Category
          </div>
          	<div class="card-body">
            	
       			<div class="row" style="margin-bottom:15px;">
            			<div class="col-md-9">
      					</div>
           				<div class="col-md-3">
			                	<a class="btn btn-primary btn-block" href="addMainCategory.jsp">
			                		<i class="fas fa-plus"style="margin-right:9px;"></i>Add New Main-Category
			                	</a>
			            </div>
			      </div>
			
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable">
                <thead>
                  <tr>
                  	<th>ID</th>
                    <th>Main Category Name</th>
                    <th>Category Type</th>
                    <th>Description</th>
                    <th>Update</th>
                    <th>Delete</th>
                  </tr>
                </thead>
                
                <tbody>
                  
                  <%
                    MainCategoryDao dao=new MainCategoryDao();
                    List<MainCategoryBean> list=dao.getAllMainCategory();
                    for(MainCategoryBean b:list)
                    {
                    	if(b.getStatus()==1)
                    	{
                  %>
                  <tr>
                  	<td><%=b.getMain_cat_id() %></td>
                  	<td><%=b.getMain_cat_name() %></td>
                  	<td><%=b.getCat_type_name() %></td>
                    <td><%=b.getDesc() %></td>
                    <td>
                    	<form action="maincategorycontroller" method="post">
                  			<input type="hidden" name = "id" value = "<%=b.getMain_cat_id()%>">
                  			<input class="btn btn-primary btn-uesr btn-block btn-sm" type="submit" name="action" value="Update">
                  		</form>
                    </td>
                    <td>
                    	<form action="maincategorycontroller" method="post">
                  			<input type="hidden" name = "id" value = "<%=b.getMain_cat_id() %>">
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