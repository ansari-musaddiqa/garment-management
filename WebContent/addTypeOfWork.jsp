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
            <a href="dahboard.jsp">DASHBOARD</a>
          </li>
          <li class="breadcrumb-item">
            <a href="#">EMPLOYEES DETAILS</a>
          </li>
          <li class="breadcrumb-item active">Add Type Of Job-Work</li>
        </ol>
           
       <div class="card card-register mx-auto mt-5">
      <div class="card-header heading" >Add Type Of Job-Work</div>
      <div class="card-body">
        <form  action="TypeOfWorkController" method="post" onSubmit="return validate()">
      
           <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group">
                  <input type="text" id="typeOfWork" name="typeOfWorkName" class="form-control" placeholder="typeOfWork" required="required" autofocus="autofocus">
                  <label for="typeOfWorkName">Type Of Job-Work</label>
                </div>
              </div>
          </div>
          </div>
  
 
 		    <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group">
                  <div class="script1" id="valtypeofwork">
		  			<label class="form-control valbg" id="txttypeofwork">Enter type of work</label>
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
                <a class="btn btn-primary btn-block" href="ViewTypeOfWork.jsp">CANCEL</a>
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
  <jsp:include page="addTypeOfWorkValid.jsp"></jsp:include>
  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>