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

  <title>OTP Verification</title>

  <!-- Custom fonts for this template-->
  <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin.css" rel="stylesheet">

</head>

<%
String x1=request.getParameter("id");
String x=(String)session.getAttribute("otp");
%> 


<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header heading">Reset Password</div>
      <div class="card-body">
        <div class="text-center mb-4">
          <h4>OTP Verification</h4>
          <p>Enter OTP  to reset your password.</p>
        </div>
        <form onSubmit="return validate()" action="${pageContext.request.contextPath}/forgot1" method="post" >
          <div class="form-group">
            <div class="form-label-group">
              <input type="hidden"  name="otps" value="<%=x %>">
              <input type="text" id="inputOTP" name="otp"  class="form-control" placeholder="Enter OTP" required="required" autofocus="autofocus">
              <label for="inputOTP">Enter OTP</label>
			  <h5 style="color:red;"><%if(x1!=null){out.println("*"+x1);}%></h5>
                       
            </div>
          </div>
          
          <div class="script1" id="valeml">
          <div class="form-group">
		  <label class="form-control valbg" id="txteml">Enter OTP</label>
		  </div>
		  </div>
		  
          
         <button type="submit" class="btn btn-primary btn-block" name="action" value="submitotp"  formnovalidate>Submit OTP</button>
        
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

	<jsp:include page="OtpVerifyValidate.jsp"></jsp:include>
</body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/forgot-password.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:17 GMT -->
</html>
