<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:17 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>

  <!--meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content=""-->

  <title>Login</title>

  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header heading">Login</div>
      <div class="card-body">
        <form action="logincontroller" method="post" onSubmit="return validate()">
        
        	<div class="script1" id="valup">
          <div class="form-group">
		  <label class="form-control valbg txtup1" id="txtup">Wrong</label>
		  </div>
		  </div>
        
          <div class="form-group">
            <div class="form-label-group">
              <input type="name" id="inputUname" name="email" class="form-control" placeholder="Email address" required="required" autofocus="autofocus">
              <label for="inputUname">User Name</label>
            </div>
          </div>
          
          <div class="script1" id="valuname">
            <div class="form-group">
		   		<label class="form-control valbg" id="txtuname">Enter user Name</label>
		  	</div>
		  </div>
		  
          
          <div class="form-group">
             <div class="form-row">
              <div class="col-md-11">
               <div class="input-group"> 
               		<input type="password" id="inputPassword" name="pass" class="form-control" placeholder="Password" required="required" style="height: 45px; border-top-right-radius: 0rem; border-bottom-right-radius: 0rem;">
		       </div>
               </div>
               
               
              <div class="col-md-1"  style=" border: 1px solid #ced4da; border-top-right-radius: 0.25rem; border-bottom-right-radius: 0.25rem; margin-left: -5px;">
            <div class="form-label-group" style="text-align: center;">
		    		<label class="input-group-addon" style="line-height:0.5; ">
						<input type="chechbox" style="display:none"
		              	 onclick="myFunction()">
		              	 <span><i class="fa fa-eye" style="margin-left: -12px;"></i></span>
		      		   </label>
		    	</div>
		    	</div>
		    
		    </div>
          </div>
         
          
          <div class="script1" id="valpass">
          <div class="form-group">
		  <label class="form-control valbg" id="txtpass">Enter password</label>
		  </div>
		  </div>
		  
		  <button type="submit" class="btn btn-primary btn-block" name="action" value="login" href="common.jsp" formnovalidate>Login</button>
        </form>
        <div class="text-center">
 <!--         <a class="d-block small mt-3" href="register.jsp">Register an Account</a>
 -->     <a class="d-block small" href="forgotPassword.jsp">Forgot Password?</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<jsp:include page="loginvalidate1.jsp"></jsp:include>
	<script>
function myFunction() {
  var x = document.getElementById("inputPassword");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>
	
</body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:17 GMT -->
</html>
