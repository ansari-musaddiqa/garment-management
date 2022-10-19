<%@page import="com.bean.StateBean"%>
<%@page import="com.dao.StateDao"%>
<%@page import="com.bean.CityBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CityDao"%>
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
          <li class="breadcrumb-item active">Add vendor</li>
        </ol>
           
            <div class="card card-register mx-auto mt-5">
      <div class="card-header heading" >Add Vendor</div>
      <div class="card-body">

        <form action="vendorcontroller" method="post" onSubmit="return validate()">

	    <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="firstName" class="form-control" placeholder="First Name" name="fname" required="required" autofocus="autofocus">
                  <label for="firstName">First Name</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="lastName" class="form-control" placeholder="Last Name" name="lname" required="required">
                  <label for="lastName">Last Name</label>
                </div>
              </div>
            </div>
          </div>
 
           <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valufname">
		          			<label class="form-control valbg" id="txtfname">Enter Fname</label>
				  		</div>
				  		</div>
				  	</div>
				  	<div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valulname">
				  			<label class="form-control valbg" id="txtlname">Enter lname</label>
				  		</div>
				  		</div>
				  	</div>
			</div>
	    
              <div class="form-group">
      <div class="form-row">
           <div class="col-md-12">
                <div class="form-label-group">
                  <textarea  rows="3" id="address" class="form-control" placeholder="Address" name="add" required="required"></textarea>
                  <label for="address">Address</label>
                </div>
              </div>
              </div>
              </div>
              
            <div class="form-row">
		              <div class="col-md-12">
		                <div class="form-label-group">
		            	  <div class="script1" id="valuaddress">
				  			<label class="form-control valbg" id="txtaddress">Enter Address</label>
				  		</div>
				  		</div>
				  	</div>
			</div>
	
              <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" name="cityName" id="cityName" class="form-control" name="cityName" required="required" autofocus="autofocus">
   					<option value="City Name">City Name</option>                 
                    <%
                    	CityDao cd = new CityDao();
                    	List<CityBean> list = cd.getAllState();
                    	
                    	for(CityBean cb: list)
                    	{
                    			if(cb.getStatus()==1)
                    			{
                    %>
                    
                    <option value="<%=cb.getCid()%>"><%=cb.getCnm() %></option>
                    
                    <%
                    			}
                    	}  
                    %>
                  
                  </select>
                </div>
              </div>
               <div class="col-md-6">
                <div class="form-label-group">
                  <select style="height:49px;" name="stateName" id="stateName" class="form-control" name="stateName" placeholder="State Name" required="required">
                    <option value="State Name">State Name</option>
                    <%
                    	StateDao sd = new StateDao();
                    	List<StateBean> list1 = sd.getAllState1();
                    	
                    	for(StateBean sb: list1)
                    	{
                    			if(sb.getStatus()==1)
                    			{
                    %>
                    
                    <option value="<%=sb.getSid()%>"><%=sb.getSnm() %></option>
                  
                  	<%
                    			}
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
		          			<label class="form-control valbg" id="txtcity">Enter city</label>
				  			</div>
				  		</div>
				  	</div>
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valustate">
		          			<label class="form-control valbg" id="txtstate">Enter state</label>
				  		</div>
				  		</div>
				  	</div>
			</div>
		
		
            <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="text" id="contactNumber" class="form-control" placeholder="contact Number" name="mo_num" required="required">
                  <label for="contactNumber">Contact Number</label>
                </div>
              </div>
               <div class="col-md-6">
                <div class="form-label-group">
              <input type="email" id="inputEmail" class="form-control" placeholder="Email address" name="eml" required="required">
              <label for="inputEmail">Email address</label>
            </div>
          </div>
            </div>
          </div>

            <div class="form-row">
		              <div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valucontact">
		          			<label class="form-control valbg" id="txtcontact">Enter Contact number</label>
				  		  </div>
				  		</div>
				  	</div>
				  	<div class="col-md-6">
		                <div class="form-label-group">
		            	  <div class="script1" id="valuemail">
		          			<label class="form-control valbg" id="txtemail">Enter Email</label>
				  		</div>
				  		</div>
				  	</div>
			</div>
    
    
    
		<div class="form-group">         
          <div class="form-row">
            <div class="col-md-4" style="margin-bottom: 12px;">
				<button type="submit" class="btn btn-primary btn-block" formnovalidate name="action" value="insert">ADD</button>		                 
		    </div>
            <div class="col-md-4" style="margin-bottom: 12px;">
		         <button type="reset" class="btn btn-primary btn-block">RESET</button>   
            </div>
            <div class="col-md-4">
                <a class="btn btn-primary btn-block" href="ViewVendor.jsp">CANCEL</a>
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
  <jsp:include page="addVendorValid.jsp"></jsp:include>
  
  </body>


<!-- Mirrored from blackrockdigital.github.io/startbootstrap-sb-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 18 Oct 2019 09:37:10 GMT -->
</html>