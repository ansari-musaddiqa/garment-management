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
          <li class="breadcrumb-item active">Change Password</li>
        </ol>
           
           <div class="card card-register mx-auto mt-5">
      <div class="card-header heading" >Change Password</div>
      <div class="card-body">
        <form action="changepasswordcontroller" method="post" onSubmit="return validate()">
         
       <div class="form-group">
            <div class="form-row">
	              <div class="col-md-12">
	                <div class="form-label-group">
	                    <input type="password" id="curpassword" class="form-control" name="oldpass" placeholder="Password" required="required" value="">
	              		<label for="curpassword">Current Password</label>
	          		</div>
	              </div>  
	        </div>
        </div>

		           <div class="form-row">
		           			 <div class="col-md-6">
				                <div class="form-label-group">				
									<div class="script1" id="valucurpass">
									  		<label class="form-control valbg" id="txtcurpass">Enter password</label>
									</div>
								</div>
							</div>
					</div>
			 	
	 	
	 	
	 	<div class="form-group">
            <div class="form-row">
	              <div class="col-md-6">
	                <div class="form-label-group">
	                    <input type="password" id="inputPassword" class="form-control" name="newpass" placeholder="Password" required="required" value="">
	              		<label for="inputPassword">New Password</label>
	          		</div>
	              </div>
          
	          	  <div class="col-md-6">    
	              	<div class="form-label-group">
	          	  	 <input type="password" id="confPass" class="form-control" placeholder="Confirm Password" required="required">
	              	 <label for="confPass">Confirm Password</label>
	              	</div>
	          	  </div>
            </div>
          </div>

		            <div class="form-row">
		           			 <div class="col-md-6">
				                <div class="form-label-group">				
									<div class="script1" id="valupass">
									  		<label class="form-control valbg" id="txtpass">Enter password</label>
									</div>
								</div>
							</div>
							<div class="col-md-6">
				                <div class="form-label-group">				
									<div class="script1" id="valconpass">			        	 
									  		<label class="form-control valbg" id="txtconpass">Enter confirmpassword</label>
									</div>
								</div>
							</div>
					</div>
			 
	 		
	 
	 <div class="form-group">         
          <div class="form-row">
            <div class="col-md-4" style="margin-bottom: 12px;">
		   		    <button type="submit" name="action" value="change" class="btn btn-primary btn-block" href="common.jsp" formnovalidate>change</button>                  
		     </div>
            <div class="col-md-4" style="margin-bottom: 12px;">
		           <button type="reset" class="btn btn-primary btn-block">RESET</button>
            </div>
            <div class="col-md-4">
                <a class="btn btn-primary btn-block" href="dashboard.jsp">CANCEL</a>
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
  <jsp:include page="changevalidate.jsp"></jsp:include>
  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>