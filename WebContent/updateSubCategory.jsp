<%@page import="java.util.List"%>
<%@page import="com.bean.MainCategoryBean"%>
<%@page import="com.dao.MainCategoryDao"%>
<%@page import="com.bean.SubCategoryBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<% SubCategoryBean sb = (SubCategoryBean) request.getAttribute("id"); %>

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
          <li class="breadcrumb-item active">Update Sub-Category</li>
        </ol>
           
        <div class="card card-register mx-auto mt-5">
      <div class="card-header heading">Update Sub-Category</div>
      <div class="card-body">
        <form method="post" action="subcategorycontroller" onSubmit="return validate();">
			
       		<div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group">
                  <input type="hidden" name = "id" value ="<%= sb.getSub_cat_id() %>">
                </div>
              </div>
          </div>
          </div>
          
          <div class="form-group">         
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="category" class="form-control" name="sub_cat" value="<%= sb.getSub_cat_name() %>" placeholder="Name" required="required">
                  <label for="category">Name</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" id="mcategory" name="main_cat" class="form-control" required="required">
                    <option value="Main-Category">Main-Category</option>
                    
                    <%
                    	MainCategoryDao md = new MainCategoryDao();
                    	List<MainCategoryBean> lst = md.getAllMainCategory();
                    	
                    	for(MainCategoryBean mb : lst)
                    	{
                    %>
                    	<option value="<%=mb.getMain_cat_id()%>" <%if(sb.getMain_cat_id()==mb.getMain_cat_id()) out.println("selected"); %>>
                    		<%= mb.getMain_cat_name() %>
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
                 <input type="checkbox" id="subchng" name="change" value="change">Change
                 </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group checkchange">
                 <input type="checkbox" id="catchng" name="change" value="change">Change 
                  </div>
              </div>
          </div>
          </div>
       
		 <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <div class="script1" id="valsub">
		  			<label class="form-control valbg" id="txtsub">Enter Size</label>
		  		  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <div class="script1" id="valcat">
		  			<label class="form-control valbg" id="txtcat">Enter State</label>
                  </div>
              </div>
          </div>
          </div>


		  <div class="form-group">         
          <div class="form-row">
            <div class="col-md-12">
              <div class="form-label-group">
                <input type="text" id="descrp" class="form-control" name="desc" value="<%= sb.getDescrip() %>" placeholder="Description" required="required">
                <label for="descrp">Description</label>
              </div>
            </div>
          </div>
      </div>


	    <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group checkchange"> 
                 <input type="checkbox" id="deschng" name="change" value="change">Change
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

  <!-- Logout Modal-->

  <!-- Bootstrap core JavaScript-->
  <jsp:include page="script.jsp"></jsp:include>
  <jsp:include page="updatesubCategoryvalidate.jsp"></jsp:include>
  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>