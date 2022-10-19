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
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active">Update Order</li>
        </ol>
           
        <div class="card card-register mx-auto mt-5">
      <div class="card-header heading">Update Order</div>
      <div class="card-body">
      
        <form action="" method = "post">
       
       	  <div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group">
                  <input type="hidden" name = "id" value = "">
                </div>
              </div>
          </div>
          </div>
          
          <div class="form-group">         
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="orderid" name="orderid" class="form-control" placeholder="Color" value="" required="required" disabled>
                  <label for="orderid">Order ID</label>
                </div>
              </div>
              
              <div class="col-md-6">
              <div class="form-label-group">
                <input type="text" id="cust_nm" name="cust_nm" class="form-control" placeholder="Description" required="required" disabled>
                <label for="cust_nm">Customer Name</label>
              </div>
            </div>
            </div>
          </div>

		  <div class="form-group">         
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="ttlpmnt" name="ttlpmnt" class="form-control" placeholder="Color" value="" required="required" disabled>
                  <label for="ttlpmnt">Total Paymnet</label>
                </div>
              </div>
              
              <div class="col-md-2">
                <div class="form-label-group">
                  <label style="font-size: 20px; line-height: 1;">Order Status : </label>
                </div>
              </div>
              
              <div class="col-md-4">
              <div class="form-label-group">
                      <div class="btn-group btn-group-toggle btn-responsive" data-toggle="buttons" style="margin-top: 3px; height: 45px;">
                        <label class="btn btn-secondary" style="font-size: 20px;">
                          <input type="radio" name="options_cust" value="complete" id="option1" autocomplete="off"> COMPLETED
                        </label>
                        <label class="btn btn-secondary active"  style="font-size: 20px;">
                          <input type="radio" name="options_cust" value="pending" id="option2" autocomplete="off" active> PENDING
                        </label>
                      </div>
              </div>
            </div>
            </div>
          </div>
		   
      
			<div class="form-group">         
          <div class="form-row">
            <div class="col-md-4" style="margin-bottom: 12px;">
 				<button type="submit" class="btn btn-primary btn-block" formnovalidate value="Save" name="action">SAVE</button>
            </div>
            <div class="col-md-4" style="margin-bottom: 12px;">
		            <button type="reset" class="btn btn-primary btn-block">RESET</button>
            </div>
            <div class="col-md-4">
                <a class="btn btn-primary btn-block" href="ViewColor.jsp">CANCEL</a>
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
		<jsp:include page="UpdateColorValid.jsp"></jsp:include>
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
  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>