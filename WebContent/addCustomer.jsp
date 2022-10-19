<%@page import="com.bean.CityBean"%>
<%@page import="com.dao.CityDao"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.StateDao"%>
<%@page import="com.bean.StateBean"%>
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
            <a href="#">USERS</a>
          </li>
          <li class="breadcrumb-item active">Add Customer</li>
        </ol>
           
        <div class="card card-register mx-auto mt-5">
      <div class="card-header heading" >Add Customer </div>
      <div class="card-body">
        <form onSubmit="return validate()" action="customercontroller" method="post" >
          

            <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="firstName" name="fname" class="form-control" placeholder="First Name" required="required">
                  <label for="firstName">First Name</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="lastName" name="lname" class="form-control" placeholder="Last Name" required="required">
                  <label for="lastName">Last Name</label>
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
		            	  <div class="script1" id="valulname">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtlname">Enter lname</label>
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
              
            <div class="form-row">
		              <div class="col-md-12">
		                <div class="form-label-group">
		            	  <div class="script1" id="valuaddress">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtaddress">Enter Address</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
			</div>
		
  
          <div class="form-group">
            <div class="form-row">
             
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" name="cityName" id="cityName" class="form-control" placeholder="City Name" required="required" autofocus="autofocus">
                  <option value="City Name">City Name</option>
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
		         	<option value="State Name">State Name</option>
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
           
        
        
            <div class="form-row">
           			 <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valucity">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtcity">Enter city</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valustate">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtstate">Enter state</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
			</div>
		
        
         
            <div class="form-group">
            <div class="form-row">
			            <div class="col-md-6">
			                <div class="form-label-group">
			                  <input type="text" id="contactNumber" name="num" class="form-control" placeholder="contact Number" required="required">
			                  <label for="contactNumber">Contact Number</label>
			                </div>
			            </div>
			            <div class="col-md-6">
			              <div class="form-label-group">
			              <input type="email" id="inputEmail" name="eml" class="form-control" placeholder="Email address" required="required">
			              <label for="inputEmail">Email address</label>
			            </div>
			           </div>
            </div>
          	</div>

			
		    <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valucontact">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtcontact">Enter Contact number</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
				  	<div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valuemail">
		          			<div class="form-group">
				  			<label class="form-control valbg" id="txtemail">Enter Email</label>
				  			</div>
				  		</div>
				  		</div>
				  	</div>
			</div>
		  
    
    
			<div class="form-group">         
          <div class="form-row">
            <div class="col-md-4" style="margin-bottom: 12px;">
 	           <button type="submit" name="action" value="insert" class="btn btn-primary btn-block" href="#" formnovalidate>Add</button>
            </div>
            <div class="col-md-4" style="margin-bottom: 12px;">
		            <button type="reset" class="btn btn-primary btn-block">Reset</button>
            </div>
            <div class="col-md-4">
                <a class="btn btn-primary btn-block" href="ViewCustomer.jsp">CANCEL</a>
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
  <jsp:include page="addCustValid.jsp"></jsp:include>
  
  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>
    