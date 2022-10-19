<%@page import="com.bean.StateBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.StateDao"%>
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
            <a href="#">ADDRESS</a>
          </li>
          <li class="breadcrumb-item active">Add City</li>
        </ol>
           
       <div class="card card-register mx-auto mt-5">
      <div class="card-header heading" >Add City</div>
      <div class="card-body">
        
        <form onSubmit="return validate()" action="citycontroller" method="post">
          
      	<div class="script1" id="valup">
          <div class="form-group">
		  <label class="form-control valbg txtup1" id="txtup">Wrong</label>
		  </div>
		  </div>
        

          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="cityName" name="cityName" class="form-control" placeholder="cityName" required="required" autofocus="autofocus">
                  <label for="cityName">City name</label>
                </div>
              </div>
              <div id="cmb" class="col-md-6">
                <div class="form-label-group">
                  <select name="stateName" id="stateName" class="form-control cmb" placeholder="State Name" required="required" autofocus="autofocus" style="height:49px;">
     					<option value="State Name">State Name</option>
                  	<%
                  	StateDao sd=new StateDao();
                  	List<StateBean> list=sd.getAllState1();
                  	
                  	for(StateBean sb:list)
                  	{
                  		
                  	%>
                  	<option value="<%=sb.getSid()%>"><%=sb.getSnm()%></option>
                  	<%
                  	}
                  	%>
                  	</select>
                 <!-- <label for="StateName">State name</label> -->
                </div>
              </div>
          </div>
          </div>
  
 
 		    <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <div class="script1" id="valcitynm">
		  			<label class="form-control valbg" id="txtcitynm">Enter City</label>
		  		  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <div class="script1" id="valstatenm">
		  			<label class="form-control valbg" id="txtstatenm">Enter State</label>
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
                <a class="btn btn-primary btn-block" href="ViewCity.jsp">CANCEL</a>
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
  <jsp:include page="cityvalidate.jsp"></jsp:include>
  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>