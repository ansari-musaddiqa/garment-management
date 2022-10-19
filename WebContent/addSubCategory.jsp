<%@page import="com.bean.MainCategoryBean" %>
<%@page import="com.dao.MainCategoryDao" %>
<%@ page import="java.util.*" %>
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
            <a href="#">CATEGORY</a>
          </li>
          <li class="breadcrumb-item active">Add Sub-Category</li>
        </ol>
           
        <div class="card card-register mx-auto mt-5">
      <div class="card-header heading">Add Sub-Category</div>
      <div class="card-body">
        <form onSubmit="return validate()" action="subcategorycontroller" method="post">
        
        <div class="script1" id="valup">
          <div class="form-group">
		  <label class="form-control valbg txtup1" id="txtup">Wrong</label>
		  </div>
		  </div>
        
          <div class="form-group">         
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="category" name="sub_cat_name" class="form-control" placeholder="Name" required="required">
                  <label for="category">Sub-Category</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" id="cat-type" name="main_cat_type_id" class="form-control" required="required">
                    <option value="Main-Category">Main-Category</option>
                    
                  <%
                  MainCategoryDao  dao=new MainCategoryDao();
				  List<MainCategoryBean> list=dao.getAllMainCategory();
                  	for(MainCategoryBean l:list)
                  	{
                  %>  
                    <option value=<%=l.getMain_cat_id() %>><%=l.getMain_cat_name() %></option>
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
                  <div class="script1" id="valsubnm">
		  			<label class="form-control valbg" id="txtsubnm">Enter Size</label>
		  		  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <div class="script1" id="valcatnm">
		  			<label class="form-control valbg" id="txtcatnm">Enter State</label>
                  </div>
              </div>
          </div>
          </div>
			

		  <div class="form-group">         
          <div class="form-row">
            <div class="col-md-12">
              <div class="form-label-group">
                <input type="text" id="descrp" name="description" class="form-control" placeholder="Description" required="required">
                <label for="descrp">Description</label>
              </div>
            </div>
          </div>
      </div>



			<div class="form-group">         
          <div class="form-row">
            <div class="col-md-4" style="margin-bottom: 12px;">
				<button type="submit" name="action" value="insert" class="btn btn-primary btn-block" href="common.jsp" formnovalidate>ADD</button>		                 
		    </div>
            <div class="col-md-4" style="margin-bottom: 12px;">
		            <button type="reset" class="btn btn-primary btn-block">Reset</button>
            </div>
            <div class="col-md-4">
                <a class="btn btn-primary btn-block" href="ViewSubCategory.jsp">CANCEL</a>
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
  <jsp:include page="subCategoryvalidate.jsp"></jsp:include>
  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>
    