<%@page import="com.bean.CategoryTypeBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CategoryTypeDao"%>
<%@page import="com.bean.MainCategoryBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<% MainCategoryBean mb = (MainCategoryBean) request.getAttribute("id"); %>

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
          
          
          <li class="breadcrumb-item active">Update Main-Category</li>
        </ol>
           
        <div class="card card-register mx-auto mt-5">
      <div class="card-header heading">Update Main-Category</div>
      <div class="card-body">
        
        <form method="post" action="maincategorycontroller" id="myform" onsubmit="return validate()">
        
       	 <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group">
                  <input type="hidden" name = "id" value = "<%= mb.getMain_cat_id()%>">
                </div>
              </div>
          </div>
          </div>
         
          <div class="form-group">         
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="category" class="form-control" placeholder="Name" name="main_cat_nm" value="<%= mb.getMain_cat_name()%>" required="required">
                  <label for="category">Name</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" id="cat-type" name="cat_type" class="form-control" required="required">
                    <option value="Category Type">Category Type</option>
                    
                    <%
                    	CategoryTypeDao cd = new CategoryTypeDao();
                    	List<CategoryTypeBean> lst = cd.getAllCategoryType();
                    	
                    	for(CategoryTypeBean cb : lst)
                    	{
                    %>
                    
                    	<option value="<%=cb.getCat_type_id()%>" <%if(mb.getCat_type_id()==cb.getCat_type_id()) out.println("selected"); %>>
                    		<%=cb.getCat_type_name() %>
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
                 <input type="checkbox" id="nmcheck" name="change" value="change">Change
                 </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group checkchange">
                 <input type="checkbox" id="typecheck" name="change" value="change">Change 
                  </div>
              </div>
          </div>
          </div>
       

            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valname">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtname">Enter Fname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
				  	<div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valtype">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txttype">Enter lname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
			</div>


      <div class="form-group">         
          <div class="form-row">
            <div class="col-md-12">
              <div class="form-label-group">
                <input type="text" id="descrp" name="des" class="form-control" placeholder="Description" required="required">
                <label for="descrp">Description</label>
              </div>
            </div>
          </div>
      </div>


   		 <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group checkchange"> 
                 <input type="checkbox" name="change" id="descheck" value="change">Change
                 </div>
              </div>
          </div>
          </div>
		  

			<div class="form-group">         
          <div class="form-row">
            <div class="col-md-4" style="margin-bottom: 12px;">
				<button type="submit"  class="btn btn-primary btn-block" formnovalidate name="action" value="save">save</button>           
		     </div>
            <div class="col-md-4" style="margin-bottom: 12px;">
		 	      				  <button type="reset" class="btn btn-primary btn-block">Reset</button>
	   </div>
            <div class="col-md-4">
                <a class="btn btn-primary btn-block" href="ViewMainCategory.jsp">CANCEL</a>
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
  <jsp:include page="updateMainCategoryValidate.jsp"></jsp:include>
  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>
    