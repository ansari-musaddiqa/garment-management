<%@page import="com.bean.SizeBean"%>
<%@page import="com.bean.CategoryTypeBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CategoryTypeDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<% SizeBean sb = (SizeBean) request.getAttribute("id"); %>

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
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="dashboard.jsp">DASHBOARD</a>
          </li>
          <li class="breadcrumb-item">
            <a href="#">PRODUCT DETAILS</a>
          </li>
          
          <li class="breadcrumb-item active">Update Size</li>
        </ol>
           
        <div class="card card-register mx-auto mt-5">
      <div class="card-header heading">Update Size</div>
      <div class="card-body">
        
        <form id="myform" action="sizecontroller" method="post" onSubmit="return validate()">
        
        	<div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group">
                  <input type="hidden" name = "id" value = <%= sb.getSizeid() %>>
                </div>
              </div>
          </div>
          </div>
        
          <div class="form-group">         
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="sizename" name="updatesize" class="form-control" placeholder="Size Name" required="required" value="<%= sb.getSize()%>">
                  <label for="sizename">Size Name</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" id="cat-type" class="form-control" required="required" name="catnm">
                     <option value="Category Type">Category Type</option>
                    <%
                  	CategoryTypeDao cd=new CategoryTypeDao();
                  	List<CategoryTypeBean> list=cd.getAllCategoryType();
                  	
                  	for(CategoryTypeBean cb:list)
                  	{
                  			
                  	%>
                  	<option value="<%=cb.getCat_type_id()%>" <%if(cb.getCat_type_id() == sb.getCat_id()) out.println("selected"); %>>
                  		<%= cb.getCat_type_name() %>
                  	</option>
                  	<%
                  		}
                  	%>
                  </select>
                </div>
              </div>
            </div>
          </div>


			    <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group checkchange"> 
                 <input type="checkbox" name="change" value="change" id="sizecheck">Change
                 </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group checkchange">
                 <input type="checkbox" name="change" value="change" id="cattypecheck">Change 
                  </div>
              </div>
          </div>
          </div>
       
		 <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valuesize">
				  			<label class="form-control valbg" id="txtsize">Enter Size</label>
				  		  </div>
				  		</div>
				  	</div>
				  	<div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valulcategorytype">
		          			<label class="form-control valbg" id="txtcattype">Enter CategoryType</label>
				  		</div>
				  		</div>
				  	</div>
			</div>
		
         

			<div class="form-group">         
          <div class="form-row">
            <div class="col-md-4" style="margin-bottom: 12px;">
			  <button type="submit" class="btn btn-primary btn-block" name="action" value="save" formnovalidate>SAVE</button>
		    </div>
            <div class="col-md-4" style="margin-bottom: 12px;">
		    	<button type="reset" class="btn btn-primary btn-block">RESET</button>
		    </div>
            <div class="col-md-4">
                <a class="btn btn-primary btn-block" href="ViewSize.jsp">CANCEL</a>
            </div>
          </div>
      </div>
		
    
    
    
      </form>
        
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

  <!-- Logout Modal-->
 

  <!-- Bootstrap core JavaScript-->
  
  <jsp:include page="script.jsp"></jsp:include>
  <jsp:include page="UpdateSizeValid.jsp"></jsp:include> 
  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>
    