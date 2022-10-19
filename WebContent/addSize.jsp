<%@page import="com.bean.CategoryTypeBean"%>
<%@page import="com.dao.CategoryTypeDao"%>
<%@page import="com.bean.SizeBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.SizeDao"%>
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
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="dashboard.jsp">DASHBOARD</a>
          </li>
          <li class="breadcrumb-item">
            <a href="#">PRODUCT DETAILS</a>
          </li>
          <li class="breadcrumb-item active">Add Size</li>
        </ol>
           
        <div class="card card-register mx-auto mt-5">
      <div class="card-header heading">Add Size</div>
      <div class="card-body">
      
        <form action="sizecontroller" method="post" onSubmit="return validate()">
        
        <div class="script1" id="valup">
          <div class="form-group">
			  <label class="form-control valbg txtup1" id="txtup">Wrong</label>
		  </div>
		</div>
        
          <div class="form-group">         
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="size" class="form-control" placeholder="Size Name" required="required" name="addsize"autofocus = "autofocus">
                  <label for="size">Size</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" id="cat-type" class="form-control" required="required" name="cat_id">
                    <option value="Category Type">Category Type</option>
                    <%
                    	CategoryTypeDao cd = new CategoryTypeDao();
                    	List<CategoryTypeBean> list = cd.getAllCategoryType();
                    	
                    	for(CategoryTypeBean cb: list)
                    	{
                    	
                    %>
                    	<option value="<%=cb.getCat_type_id()%>"><%=cb.getCat_type_name()%></option>
                    	
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
                <div class="form-label-group">
                  <div class="script1" id="valsizenm">
		  			<label class="form-control valbg" id="txtsizenm">Enter Size</label>
		  		  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <div class="script1" id="valcatnm">
		  			<label class="form-control valbg" id="txtcatnm"></label>
                  </div>
              </div>
          </div>
          </div>
		    
		<div class="form-group">         
          <div class="form-row">
            <div class="col-md-4" style="margin-bottom: 12px;">
				<button type="submit" class="btn btn-primary btn-block" formnovalidate name="action" value="add">ADD</button>		                 
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

  <!-- Bootstrap core JavaScript-->
  <jsp:include page="script.jsp"></jsp:include>
  <jsp:include page="sizevalidate.jsp"></jsp:include>
  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>