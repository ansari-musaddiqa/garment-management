<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/forgot-password.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:17 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>New Password</title>

  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin.css" rel="stylesheet">

</head>

<%
String email=(String)session.getAttribute("email");
%>



<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header heading">Reset Password</div>
      <div class="card-body">
       <!--  <div class="text-center mb-4">
          <h4>Forgot your password?</h4>
          <p>Enter your email address and we will send you OTP  to reset your password.</p>
         </div> -->
        <form action="${pageContext.request.contextPath}/forgot1" method="post" onSubmit="return validate()">
        <!-- 	<div class="script1" id="valup">
          <div class="form-group">
		  <label class="form-control valbg txtup1" id="txtup">Wrong</label>
		  </div>
		  </div> -->
          <div class="form-group">
            <div class="form-label-group">
              <input type="hidden" name="email1" value="<%=email%>">  
              <input type="password" id="inputPass" name="pass" class="form-control" placeholder="New Password" required="required" autofocus="autofocus">
              <label for="inputPass">New Password</label>
            </div>
          </div>
          
          <div class="script1" id="valpass">
          <div class="form-group">
		  <label class="form-control valbg" id="txtpass">Enter Password</label>
		  </div>
		  </div>
		  
		  
		  <div class="form-group">
            <div class="form-label-group">
              <input type="password" id="inputConPass" name="conpass" class="form-control" placeholder="Confirm Password" required="required" autofocus="autofocus">
              <label for="inputConPass">Confirm Password</label>
            </div>
          </div>
          
          <div class="script1" id="valcon">
          <div class="form-group">
		  <label class="form-control valbg" id="txtcon">Enter Confirm Password</label>
		  </div>
		  </div>
		  
          
         <button type="submit" class="btn btn-primary btn-block" name="action" value="change"  formnovalidate>Reset</button>
        
        </form>
        <div class="text-center">
          <a class="d-block small" href="login.jsp">Login Page</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<jsp:include page="NewPassValidate.jsp"></jsp:include>
</body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/forgot-password.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:17 GMT -->
</html>
