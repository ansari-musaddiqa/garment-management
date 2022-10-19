<%@page import="com.bean.StateBean"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.CityBean"%>
<%@page import="com.dao.CityDao"%>
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
            <a href="dashboard.jsp">Dashboard</a>
          </li>
          <li class="breadcrumb-item">
            <a href="#">SHOP</a>
          </li>
          <li class="breadcrumb-item active">Add Shop</li>
        </ol>
           
        <div class="card card-register mx-auto mt-5">
      <div class="card-header heading" >Add Shop</div>
      <div class="card-body">
        <form method="post" action="shopcontroller" onsubmit="return validate()">
          

            <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="branchName" name="branchname" class="form-control" placeholder="Branch Name" required="required" autofocus="autofocus">
                  <label for="branchName">Branch Name</label>
                </div>
              </div>
            
              <div class="col-md-6">
			       <div class="form-label-group">
			           <input type="text" id="contactNumber" name="num" class="form-control" placeholder="contact Number" required="required">
			              <label for="contactNumber">Contact Number</label>
	                </div>
	             </div>
		      </div>
        	  </div>
 
        
        
        
            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valufname">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtfname">Enter Fname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
				  	<div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valcontact">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtcontact">Enter lname</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
			</div>
		
        
              <div class="form-group">
      				<div class="form-row">
           				<div class="col-md-12">
                			<div class="form-label-group">
			                  <textarea  rows="3" id="address" name="add" class="form-control" placeholder="Address" required="required"></textarea>
			                  <label for="address">Address</label>
			                </div>
              			</div>
              		</div>
             </div>
              
			
			<div class="form-group">
            <div class="form-row">
              <div class="col-md-12">
                <div class="form-label-group">
                  <div class="script1" id="valadd">
		  			<label class="form-control valbg" id="txtadd">Enter Size</label>
		  		  </div>
                </div>
              </div>
         	</div>
		
  
          <div class="form-group">
            <div class="form-row">
             
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" name="cityName" id="cityName" class="form-control" placeholder="City Name" required="required" >
                  <%
                  	CityDao cd=new CityDao();
                  	List<CityBean> list=cd.getAllState();
                  	
                  	for(CityBean cb:list)
                  	{
                  		
                  	%>
                  	<option value="<%=cb.getCid()%>"><%=cb.getCnm()%></option>
                  	<%
                  	}
                  	%>
                
                  </select>
                </div>
              </div>
                 
              <div class="col-md-6">
              		<div class="form-label-group">
                  	<select style="height:49px;" name="stateName" id="stateName" class="form-control" placeholder="State Name" required="required" autofocus="autofocus">
		         <%
                  	StateDao sd=new StateDao();
                  	List<StateBean> list1=sd.getAllState1();
                  	
                  	for(StateBean sb:list1)
                  	{
                  		
                  	%>
                  	<option value="<%=sb.getSid()%>"><%=sb.getSnm()%></option>
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
            <div class="col-md-4" style="margin-bottom: 12px;">
 	           <button type="submit" name="action" value="insert" class="btn btn-primary btn-block" href="common.jsp" formnovalidate>Add</button>
            </div>
            <div class="col-md-4" style="margin-bottom: 12px;">
		            <button type="reset" class="btn btn-primary btn-block">Reset</button>
            </div>
            <div class="col-md-4">
                <a class="btn btn-primary btn-block" href="ViewShop.jsp">CANCEL</a>
            </div>
          </div>
      </div>
		

          <!-- <a class="btn btn-primary btn" href="login.html">Submit</a>
          <a class="btn btn-primary btn" href="login.html">Reset</a> -->
  
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
  <jsp:include page="addShopValid.jsp"></jsp:include>
  
  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>
    