<%@page import="com.bean.StateBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<%StateBean sb = (StateBean) request.getAttribute("id"); %>

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
            <a href="#">DASHBOARD</a>
          </li>
           
           <li class="breadcrumb-item">
            <a href="#">ADDRESS</a>
          </li>
          
          <li class="breadcrumb-item active">Update State</li>
        </ol>
           
      <div class="card card-register mx-auto mt-5">
      <div class="card-header heading" >Update State</div>
      <div class="card-body">
        <form  action="statecontroller" onSubmit="return validate()" method="post">
          
		<div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group">
                  <input type="hidden" name = "id" value = <%= sb.getSid() %>>
                </div>
              </div>
          </div>
          </div>

          <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group">
                  <input type="text" id="stateName" class="form-control" placeholder="stateName" name="updatestate" value=<%= sb.getSnm() %> required="required" autofocus="autofocus">
                  <label for="stateName">State name</label>
                </div>
              </div>
          </div>
          </div>
       
       	    <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group checkchange"> 
                 <input type="checkbox" id="change" name="change" value="change">Change
                 </div>
              </div>
			</div>
			</div>         

		<div class="script1" id="valnm">
          <div class="form-group">
		  <label class="form-control valbg" id="txtnm">Enter Email</label>
		  </div>
		  </div>


			<div class="form-group">         
          <div class="form-row">
            <div class="col-md-4" style="margin-bottom: 12px;">
	     		   <button type="submit" class="btn btn-primary btn-block"  href="common.jsp" value="save" name="action" formnovalidate>SAVE</button>		                                         
            </div>
            <div class="col-md-4" style="margin-bottom: 12px;">
		   	      				  <button type="reset" class="btn btn-primary btn-block">Reset</button>
	 </div>
            <div class="col-md-4">
                <a class="btn btn-primary btn-block" href="ViewState.jsp">CANCEL</a>
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
  <jsp:include page="updatestatevalidate.jsp"></jsp:include>
  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>